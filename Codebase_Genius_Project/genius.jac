import from byllm.llm { Model }
import os;
import subprocess;

# ------------------------
# Global LLM model
# ------------------------
glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=True);

# ------------------------
# Node: FileManager (local, non-LLM)
# ------------------------
node FileManager {
    has repo_url: str = "";
    has repo_path: str = "";

    # Clone repository
    def clone_repo() -> str {
        if not os.path.exists("./repos") {
            os.makedirs("./repos");
        }

        repo_name = self.repo_url.split("/")[-1].replace(".git", "");
        self.repo_path = "./repos/" + repo_name;

        if os.path.exists(self.repo_path) {
            report "Repo already exists at " + self.repo_path;
            return self.repo_path;
        }

        try {
            subprocess.run(["git", "clone", self.repo_url, self.repo_path], check=True);
            report "Repository cloned successfully at " + self.repo_path;
            return self.repo_path;
        } except Exception as e {
            report "Clone failed: " + str(e);
            return "Failed to clone repository.";
        }
    }

    # List files recursively
    def list_files(base_path: str) -> list {
        all_files = [];
        entries = os.listdir(base_path);

        for e in entries {
            full_path = os.path.join(base_path, e);
            if os.path.isdir(full_path) {
                sub_files = self.list_files(full_path);
                for sf in sub_files {
                    all_files.append(os.path.join(e, sf));
                }
            } else {
                all_files.append(e);
            }
        }
        return all_files;
    }

    # Read file content
    def read_file(file_path: str) -> str {
        try {
            with open(file_path, "r", encoding="utf-8") as f {
                content = f.read();
            }
            return content;
        } except Exception as e {
            report "Failed to read " + file_path + ": " + str(e);
            return "";
        }
    }

    # Save file
    def save_output(content: str, output_path: str) -> str {
        abs_path = os.path.abspath(output_path);
        dir_path = os.path.dirname(abs_path);
        if not os.path.exists(dir_path) {
            os.makedirs(dir_path, exist_ok=True);
        }

        try {
            with open(abs_path, "w", encoding="utf-8") as f {
                f.write(content);
            }
            report "File saved at: " + abs_path;
            return abs_path;
        } except Exception as e {
            report "Failed to save file: " + str(e);
            return "";
        }
    }
}

# ------------------------
# Node: RepoMapper (LLM)
# ------------------------
node RepoMapper {
    def map_repo_structure(files: list[str]) -> str by llm();
    def summarize_readme(readme_content: str) -> str by llm();
}

sem RepoMapper.map_repo_structure = """
Given a list of file paths, produce a JSON object with:
- folders: mapping of folder path -> list of file names
- languages_detected: list of language names
- entry_points: likely entry files (e.g., main.py, app.js)
Return JSON string.
""";

sem RepoMapper.summarize_readme = """
Given README text, produce a concise project overview (≤4 sentences) describing purpose, key features, and usage.
Return plain text summary.
""";

# ------------------------
# Node: CodeAnalyzer (LLM)
# ------------------------
node CodeAnalyzer {
    def analyze_code(file_content: str, filename: str) -> str by llm();
    def build_context_graph(files_data: list[str]) -> str by llm();
}

sem CodeAnalyzer.analyze_code = """
Analyze code content to detect language, functions, classes, and imports.
Return JSON: {filename, language, summary, functions[], classes[], imports[]} 
""";

sem CodeAnalyzer.build_context_graph = """
Given analyzed file data, construct a Code Context Graph (CCG) as JSON.
Include nodes (file names) and edges (relationships between files).
""";

# ------------------------
# Node: DocGenie (LLM)
# ------------------------
node DocGenie {
    def generate_documentation(repo_summary: str, structure_json: str, ccg_json: str) -> str by llm();
}

sem DocGenie.generate_documentation = """
You are DocGenie, an expert technical writer.
Given:
- repo_summary: overview
- structure_json: folder/file structure
- ccg_json: code relationships
Produce Markdown with:
1. Project Overview
2. Repo Structure
3. Installation & Usage (infer if needed)
4. API / Key Functions
5. Code Relationships
Return Markdown string.
""";

# ------------------------
# Walker: GenerateRepoDoc
# ------------------------
walker GenerateRepoDoc {
    has repo_url: str = "";

    obj __specs__ {
        static has auth: bool = False;
        static has methods: list[str] = ["post"];
        static has body: dict[str, str] = { "repo_url": "string" };
    }

    can run with entry {
        report "Starting documentation generation for repo: " + self.repo_url;

        # --- FileManager operations ---
        fm = spawn FileManager;
        fm.repo_url = self.repo_url;
        repo_path = fm.clone_repo();
        if repo_path.startswith("Failed") {
            report "Stopping: cloning failed.";
            return;
        }

        files = fm.list_files(repo_path);

        # --- Read README ---
        readme_files = ["README.md", "readme.md", "docs/README.md"];
        readme_content = "";
        for rf in readme_files {
            full_path = os.path.join(repo_path, rf);
            if os.path.exists(full_path) {
                readme_content = fm.read_file(full_path);
                break;
            }
        }

        # --- LLM-powered summary & structure ---
        mapper = spawn RepoMapper;
        repo_summary = "";
        if readme_content != "" {
            repo_summary = mapper.summarize_readme(readme_content);
            report "README Summary: " + repo_summary;
        }

        structure_json = mapper.map_repo_structure(files);
        report "Repo Structure JSON: " + structure_json;

        # --- Analyze code files ---
        analyzer = spawn CodeAnalyzer;
        analyses = [];
        for f in files {
            if any(f.endswith(ext) for ext in [".py", ".js", ".html"]) {
                content = fm.read_file(os.path.join(repo_path, f));
                if content.strip() != "" {
                    analysis = analyzer.analyze_code(content, f);
                    analyses.append(analysis);
                }
            }
        }

        ccg_json = analyzer.build_context_graph(analyses);

        # --- Generate Markdown documentation ---
        docgen = spawn DocGenie;
        docs_md = docgen.generate_documentation(repo_summary, structure_json, ccg_json);

        # --- Save output ---
        repo_name = os.path.basename(repo_path);
        output_path = f'./outputs/{repo_name}/docs.md';
        final_output = fm.save_output(docs_md, output_path);
        report "Documentation saved at: " + final_output;
    }
}
