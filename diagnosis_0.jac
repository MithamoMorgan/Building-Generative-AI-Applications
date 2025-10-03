# Symptom Diagnosis System
import from byllm { Model }

# Initialize Gemini LLM
glob llm = Model(model_name="gemini/gemini-2.0-flash");

node Patient{}

node Age(Patient){
    has age: int = 10;
    can check with Doctor entry {
        visitor.data["age"] = self.age;
    }
}
node Gender(Patient){
    has gender: str = "Male";
    can check with Doctor entry {
        visitor.data["gender"] = self.gender;
    }
}
node Symptoms(Patient){
    has symptoms: str = "headache, fever, fatigue";
    can check with Doctor entry {
        visitor.data["symptoms"] = self.symptoms;
    }
}

node Record{
    can store with Doctor entry {
        visitor.data["diagnosis"] = visitor.create_diagnosis(visitor.data);
        visitor.data["treatment"] = visitor.recommend_treatment(visitor.data);
    }
}

walker Doctor{
    has data: dict = {};
    can start with `root entry {
        visit [-->(`?Patient)];
        visit [-->(`?Record)];
    }

    """You are a medical assistant. Use the following patient data (age, gender, symptoms) to suggest a possible diagnosis."""
    def create_diagnosis(data: dict) -> str by llm();

    """You are a medical assistant. Suggest possible treatment or
        management options for the given patient, based on age, gender,
        symptoms, and diagnosis. Make it clear that this is not a substitute for professional medical care."""
    def recommend_treatment(data: dict) -> str by llm();
}

with entry {
    root ++> Age();
    root ++> Gender();
    root ++> Symptoms();
    root ++> Record();   

    agent = Doctor() spawn root;
    print("Your Results:");
    print(agent.data['diagnosis']);
    print(agent.data['treatment']);
}