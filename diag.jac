# Symptom Diagnosis System
import from byllm { Model }
import streamlit as st;

# Initialize Gemini LLM
glob llm = Model(model_name="gemini/gemini-2.0-flash");

node Patient{}

node Age(Patient){
    has age: int;
    can check with Doctor entry {
        visitor.data["age"] = self.age;
    }
}
node Gender(Patient){
    has gender: str;
    can check with Doctor entry {
        visitor.data["gender"] = self.gender;
    }
}
node Symptoms(Patient){
    has symptoms: str;
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
    st.title("Diagnosis App🩺");

    # 1. Use Streamlit components for user input
    user_age = st.number_input("Enter patient age:", min_value=1, max_value=120, value=30);
    user_gender = st.selectbox("Enter patient gender:", ["", "Male", "Female", "Other"]);
    user_symptoms = st.text_area("Enter symptoms (comma-separated):");

    # 2. Use a Streamlit button to trigger the diagnosis logic
    if st.button("Get Diagnosis") {

        # Basic validation
        if user_age == 0 or user_gender == "" or user_symptoms.strip() == "" {
            st.error("Please ensure you've entered age, gender, and symptoms.");
        } else {
            # 3. Create nodes and run the walker only when the button is pressed
            root ++> Age(age=int(user_age));
            root ++> Gender(gender=user_gender);
            root ++> Symptoms(symptoms=user_symptoms);
            root ++> Record();

            # Run the agent
            agent = Doctor() spawn root;
            
            # 4. Use Streamlit to display results
            st.subheader("Your Results:");
            st.info("**Diagnosis:** " + agent.data['diagnosis']);
            st.warning("**Treatment Recommendation:** " + agent.data['treatment']);
        } 
    } 
}