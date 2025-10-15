import from byllm { Model }

# Initialize Gemini LLM
glob llm = Model(model_name="gemini/gemini-2.0-flash");

# ---------- NODE ----------
node Chat {
    has questions: list = [];
    has answers: list = [];

    # The walker uses this to save each Q&A pair
    can check with Converse entry {
        self.questions.append(visitor.last_question);
        self.answers.append(visitor.last_answer);
    }
}

# ---------- WALKER ----------
walker Converse {
    has last_question: str;
    has last_answer: str = "";

    """You are an agricultural expert giving pest/disease diagnosis to farmers. 
       Additionally, you provide agricultural tips and answers to questions 
       they have to improve their farming. Respond based on the last question."""

    # The LLM function — official Jac syntax
    def expert_response(question: str) -> str by llm();

    can start with entry {
        # Visit or create a Chat node
        visit[-->(`?Chat)];

        # Get response from the LLM using the last question
        self.last_answer = self.expert_response(self.last_question);

    }
}

# ---------- EXECUTION ----------
with entry {
    print("🌱 Welcome to ShambaHive AI Expert!");

    # Create one Chat node to store the entire conversation
    chat = Chat();
    root ++> chat;

    while True {
        user_input = input("Farmer: ");

        # Spawn and execute a Converse walker carrying the question
        convo = root spawn Converse(last_question=user_input);

        # Print the AI's response
        print("🌾 AI Expert:", convo.last_answer);
    }
}
