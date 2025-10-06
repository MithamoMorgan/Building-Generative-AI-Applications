import from byllm { Model }

# Initialize Gemini LLM
glob llm = Model(model_name="gemini/gemini-2.0-flash");

# Walker exposed as REST endpoint
walker Doctor {
    has data: dict;

    # API Configuration (auto endpoint)
    obj __specs__ {
        static has methods: list = ["post"];   # Accept POST requests
        static has auth: bool = False;         # No authentication required
        static has path: str = "/walker/Doctor";  # Optional (default auto)
        static has summary: str = "Medical diagnosis and treatment assistant";
        static has description: str = """
        Accepts patient data (age, gender, symptoms) and returns a possible diagnosis and treatment plan.
        """;
    }

    can diagnose with `root entry {
        # Validate incoming data
        if not ("age" in self.data and "gender" in self.data and "symptoms" in self.data) {
            report {
                "error": "Missing one or more required fields: age, gender, symptoms"
            };
            return;
        }

        # Generate diagnosis
        let diagnosis = self.create_diagnosis(self.data);
        let treatment = self.recommend_treatment({
            "age": self.data["age"],
            "gender": self.data["gender"],
            "symptoms": self.data["symptoms"],
            "diagnosis": diagnosis
        });

        report {
            "diagnosis": diagnosis,
            "treatment": treatment
        };
    }

    """Use the patient's data (age, gender, symptoms) to suggest a possible diagnosis."""
    def create_diagnosis(data: dict) -> str by llm();

    """Suggest a possible treatment or management plan for the diagnosis.
    Always remind the user this is not professional medical advice."""
    def recommend_treatment(data: dict) -> str by llm();
}
