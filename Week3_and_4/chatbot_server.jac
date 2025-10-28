import from byllm.Model { Model }

# ---------- Initialize Gemini LLM ----------
glob llm = Model(model_name="gemini/gemini-2.0-flash");

# ---------- NODE ----------
# This node stores all conversation history
node Chat {
    has questions: list = [];
    has answers: list = [];
    has convo: str = "";

    # Custom entry to save a Q&A pair from the walker
    can store_qa with Messenger entry {
        self.questions.append(visitor.last_question);
        self.answers.append(visitor.last_answer);

        # Rebuild readable conversation
        self.convo = "";
        for i in range(len(self.questions)) {
            self.convo += "Farmer: " + self.questions[i] + "\n";
            self.convo += "AI Expert: " + self.answers[i] + "\n";
        }
    }
}

# GLOBAL CHAT NODE- Single Chat node to persist across all requests
glob chat = Chat();

# ---------- WALKER ----------
walker Messenger {
    has last_question: str;
    has last_answer: str = "";

    # ---------- API Exposure ----------
    obj __specs__ {
        static has methods: list = ["post"];
        static has auth: bool = False;
        static has path: str = "/walker/Messenger";
        static has summary: str = "ShambaHive Agricultural Expert Chatbot";
        static has description: str = """
        AI agricultural expert chatbot that remembers conversation history.
        Accepts a farmer's question about pests, diseases, or general farming 
        and responds with AI-generated advice or diagnosis.
        """;
    }

    """You are an agricultural expert giving pest/disease diagnosis to farmers. 
    Additionally, you provide agricultural tips and answers to questions 
    they have to improve their farming. Respond naturally and use previous 
    conversation for context."""

    # ---------- LLM Function ----------
    def expert_response(history: str, question: str) -> str by llm();

    # ---------- START ENTRY ----------
    can start with entry {
        # Ensure chat node is attached to root (only necessary for the first run)
        if len([n for n in [-->(`?Chat)]]) == 0 {
            root ++> chat;
        }

        # Visit Chat. In this structure, the visit is mainly to confirm attachment, 
        # as we access the global 'chat' directly.
        visit [-->chat];

        # Build conversation history from the global chat node
        convo_history = chat.convo;

        # Query LLM
        self.last_answer = self.expert_response(convo_history, self.last_question);

        # ------------------------------------------------------------------
        # FIX: Explicitly call the 'store_qa' capability on the global 'chat' node,
        # passing the current walker 'self' as the 'entry' to save the new Q&A.
        # ------------------------------------------------------------------
        chat.store_qa(self);

        # Return API response
        report {
            "question": self.last_question,
            "answer": self.last_answer
        };
    }
}