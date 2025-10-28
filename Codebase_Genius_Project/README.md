# About💡

In this project I build **Codebase Genius**: an AI‑powered, **multi‑agent** system 
that automatically generates high‑quality documentation for any software repository, ie an autonomous system that, given a public GitHub repository URL, produces high‑quality markdown documentation of that codebase with clear prose and explanatory diagrams.

# To Know 🧠

#### Q. What is an agent?

An agent is a self-contained unit(node or walker) that: Perceives its environment (gets input or data),Thinks or decides what to do (processes logic or uses an AI model), Acts to achieve specific goals (executes actions or produces outputs).

#### Q. What is a multi-agent system?

A system made up of multiple intelligent agents that can interact, collaborate, or coordinate with each other to achieve specified goals.

# Agents ⚙️

1. `FileManager`: Handles all local file operations: cloning repositories, reading files, listing directory contents, and saving generated documentation.
   
2. `Repo Mapper`: Clones repo + generates file tree + summarizes README. Gives structure and overview for next steps.
   
3. `Code Analyzer`: Adds core code understanding. Reads files (eg  `.jac`, `.py`) and extracts function/class names.
   
4. `DocGenie`: Combines outputs into a Markdown summary ie Produces visible results/generate Markdown report.

5. `GenerateRepoDoc`: Required for coordination and control ie, orchestrates the workflow, receives GitHub URL, delegates tasks.

# Codebase Genius Implementation 🛠️

* The system produces a complete `docs.md` file under `./outputs/<repo_name>/`, providing a structured, readable overview of the repository, including installation, usage, key functions, and code relationships. Here is the [code](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/blob/main/Codebase_Genius_Project/genius.jac).

* Note the 2 folders [repos](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/tree/main/Codebase_Genius_Project/repos) and [outputs](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/tree/main/Codebase_Genius_Project/outputs). They are created automatically in your working directory when the entire process runs successfully. They store cloned repos and docs.md files(for each cloned repo) respectively.

# Run 🚀

`jac serve genius.jac`

# UI 🖥️

Next, I will be creating a UI
