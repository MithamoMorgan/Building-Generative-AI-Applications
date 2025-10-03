# Week 1: Medical Symptom Diagnosis System in Jac

![First Aid Kit](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/blob/main/Week1_Project/diagnosis.jac)

## About

I have developed a medical symptom diagnosis system using Jac. The program prompts the user to enter age, gender, and symptoms from the command line. It models patient data and generates a possible diagnosis along with treatment advice using a large language model (LLM). Here is the [code](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/blob/main/Week1_Project/diagnosis.jac).


### Program Structure

**Nodes:**

- `Patient` (parent node)  
- `Age` (child of Patient)  
- `Gender` (child of Patient)  
- `Symptoms` (child of Patient)  

**Walker:**

- `Doctor` — collects information from the nodes, calls an LLM model, and generates a diagnosis along with treatment suggestions.

The system uses **Gemini LLM** (via the `byLLM` plugin) to process the patient data and provide responses.

> **Note:** The advice is for educational purposes only and is **not a substitute for professional medical care**.

---

## How to Run

1. Install the `byLLM` plugin:

```bash
pip install byllm
```

2. Set your Gemini API key as an environment variable:

```bash
export GEMINI_API_KEY="YOUR_API_KEY_HERE"
```

3. Run the Jac Program

```bash
jac run diagnosis.jac
```
## Example Output

```text
Your Results:
Possible viral infection (e.g., influenza or common cold)

* Rest: Ensure the child gets plenty of rest.
* Hydration: Encourage frequent fluids.
* Fever management: Administer age-appropriate doses of acetaminophen or ibuprofen.
* Symptom relief: Saline drops or humidifier for nasal congestion.
* Nutrition: Offer easily digestible foods.
* Isolation: Keep the child home from school.
* Monitoring: Watch for worsening symptoms.
* Follow-up: Consult a healthcare provider if symptoms persist.

**Disclaimer:** This information is not a substitute for professional medical advice.
```
