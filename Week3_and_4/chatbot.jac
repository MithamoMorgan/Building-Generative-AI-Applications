import from byllm { Model }

# Initialize Gemini LLM
glob llm = Model(model_name="gemini/gemini-2.0-flash");

# ---------- NODE ----------
node Chat {
    has questions: list = [];
    has answers: list = [];

    # The walker uses this to save each Q&A pair
    can check with Messenger entry {
        self.questions.append(visitor.last_question);
        self.answers.append(visitor.last_answer);
    }
}

# ---------- WALKER ----------
walker Messenger {
    has last_question: str;
    has last_answer: str = "";

    """You are an agricultural expert giving pest/disease diagnosis to farmers. 
       Additionally, you provide agricultural tips and answers to questions 
       they have to improve their farming. Respond based on the last question.
       Use previous conversation for context"""

    # The LLM function — official Jac syntax
    def expert_response(history: str, question: str) -> str by llm();

    # 1. START: Initiate the move from root
    can start with `root entry {
        # Move the walker to the Chat node connected to root
        visit[-->(`?Chat)];
    }
    
    # 2. ENTRY: Logic executes when the walker enters the Chat node
    can store with Chat entry {
        convo_history = "";

        # 'here' is now the Chat node, and attributes can be accessed
        if here.questions != []{
            for i in range(len(here.questions)){
                convo_history += "Farmer: " + here.questions[i] + "\n";
                convo_history += "AI Expert: " + here.answers[i] + "\n";
            }
        }

        self.last_answer = self.expert_response(convo_history, self.last_question);
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
        convo = Messenger(last_question=user_input) spawn root;

        # Print the AI's response
        print("🌾 AI Expert:", convo.last_answer);
    }
}
