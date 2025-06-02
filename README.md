# BMI Calculator – Iteration Report

This project implements a Body Mass Index (BMI) Calculator using Flutter, developed in **three iterations**, with each iteration introducing new features and improvements.

---

## ✅ Iteration 1 – Basic BMI Calculation
**Features Implemented:**
- Input fields for **Height** and **Weight**
- Calculates BMI using the standard formula
- Displays the result as plain text: `"Your BMI is XX.XX"`

**Purpose:**  
Establish the foundation for the BMI calculator using simple math logic and basic Flutter UI components.

---

## ✅ Iteration 2 – Add BMI Categories
**Features Added:**
- Categorizes BMI result into:
  - Underweight (BMI < 18.5)
  - Normal (18.5 ≤ BMI < 25)
  - Overweight (BMI ≥ 25)
- The result now shows: `"Your BMI is XX.XX (Category)"`

**Purpose:**  
Adds logic-based conditionals to give users more insight into their health classification.

---

## ✅ Iteration 3 – Full GUI, Tips, Meal Plan & Visual Feedback
**Features Added:**
- Input fields for **Age** and **Gender**
- Personalized **Tips** and **Meal Plan** based on BMI, age, and gender
- Clean and modern Flutter GUI design
- Replaces bar chart with an **informative BMI classification image**
- Layout enhanced with custom styling, gradients, and improved spacing

**Purpose:**  
Improves user experience with GUI, personalized suggestions, and informative visuals for easier understanding.

---

## 🔀 Branching and Merging Explanation

To organize the development process, each iteration was implemented in a separate branch:
- `iteration-1` for basic BMI calculator logic
- `iteration-2` for adding BMI category classification
- `iteration-3` for full GUI, tips, and visual feedback

Each branch was committed separately using descriptive commit messages (e.g., `feat: add full GUI`).  
Tags (`v1.0`, `v2.0`, `v3.0`) were used to clearly mark completion of each stage.

Once tested, all features were merged into the `main` branch, providing a clean progression of development.
This approach allowed logical tracking, easy rollback, and clear iteration delivery.
