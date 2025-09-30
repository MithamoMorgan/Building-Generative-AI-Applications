# Building-Generative-AI-Applications

### Overview

This repository houses building of Gen AI Applications in Jaseci Ecosystem.

### What is Jaseci Ecosystem?

Jaseci serves as the implementation stack for the Jac programming language, and is packaged as a simple Python library. This runtime stack enables Jac code to execute with its enhanced features while maintaining the seamless Python interoperability that makes the language particularly accessible to Python developers.

### What is Jac?

Jac is a new kind of programming language. It's built on top of Python, so you can still use Python code and tools with it. But Jac adds some new features that make programming easier and smarter, especially for modern tasks like AI development.

It helps you:

1. Avoid complex code by hiding the hard parts.</br>

2. Build software faster by automating things you usually have to code by hand.</br>

3. Work smoothly with Python, so you don’t have to start from scratch.</br>

Jac allows you to easily use large language models (like GPT) in your code by replacing complicated code with a call to the LLM. This simplifies the process, eliminating the need for detailed prompt creation or using extra libraries to make the LLM work.

# Week 1: Medical Symptom Diagnosis System in Jac

![First Aid Kit](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/raw/main/first_aid_kit.jpg)

## About

I have developed a **medical symptom diagnosis system** using **Jac**. The program models patient data and generates a possible diagnosis with treatment advice using an **LLM**. Here is the [code](https://github.com/MithamoMorgan/Building-Generative-AI-Applications/blob/main/diagnosis.jac).


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


