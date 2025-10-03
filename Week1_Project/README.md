# 🩺 Medical Symptom Diagnosis System

![First Aid Kit](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/blob/main/Week1_Project/first_aid_kit.jpg)

## 📖 About

This week I have developed a medical symptom diagnosis system using Jac, which I initially designed to prompt the user for age, gender, and symptoms from the command line. I have now updated the code to use a Streamlit app, where the user can enter these details through a web interface and has the option to download the output as a PDF. The system models patient data and generates a possible diagnosis along with treatment advice using a large language model (LLM).Here is the [code](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/blob/main/Week1_Project/diagnosis.jac).


### 🏗 Program Structure

**Nodes:**

- `Patient` (parent node)  
- `Age` (child of Patient)  
- `Gender` (child of Patient)  
- `Symptoms` (child of Patient)  

**Walker:**

- `Doctor` — collects information from the nodes, calls an LLM model, and generates a diagnosis along with treatment suggestions.

The system uses **Gemini LLM** (via the `byLLM` plugin) to process the patient data and provide responses.

 ⚠️ **Note:** The advice is for educational purposes only and is **not a substitute for professional medical care**.

---

## 🚀 How to Run

1. requirements:

```bash
pip install byllm
pip install jac-streamlit
pip install fpdf
```

2. Set your Gemini API key as an environment variable:

```bash
export GEMINI_API_KEY="YOUR_API_KEY_HERE"
```

3. Run the Jac Program

```bash
jac streamlit diagnosis.jac
```
## 🖥 Example with screenshots

### Step1:

![patient data](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/blob/main/Week1_Project/patient_data.jpg)

### Step 2:

![results](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/blob/main/Week1_Project/results.jpg)




