import from byllm { Model }

# ---------- Initialize Gemini LLM ----------
glob llm = Model(model_name="gemini/gemini-2.0-flash");

# ---------- NODE ----------
node Chat {
    has questions: list = [];
    has answers: list = [];

    # Store each Q&A pair in memory
    can record with Converse entry {
        self.questions.append(visitor.last_question);
        self.answers.append(visitor.last_answer);
    }
}

# ---------- WALKER ----------
walker Converse {
    has last_question: str;
    has last_answer: str = "";

    obj __specs__ {
        static has methods: list = ["post"];
        static has auth: bool = False;
        static has path: str = "/walker/Converse";
        static has summary: str = "Agricultural Expert Chatbot";
        static has description: str = """
        Accepts a farmer's question about pests, diseases, or general farming 
        and responds with AI-generated expert advice or diagnosis.
        """;
    }

    """The expert provides agricultural diagnosis and tips based on the farmer’s question."""
    def expert_response(question: str) -> str by llm();

    can start with `root entry {
        # Create or visit Chat node
        visit[-->(`?Chat)];

        # Get AI response from the LLM
        self.last_answer = self.expert_response(self.last_question);

        # Store this Q&A pair
        # self.record();

        # Return answer as JSON
        report {
            "question": self.last_question,
            "answer": self.last_answer
        };
    }
}
