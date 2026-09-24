# 💳 Credit Card Fraud Detection — Risk Analytics Project

## 📌 Project Overview

Financial fraud is a major challenge for institutions due to the **extremely low occurrence rate of fraud transactions (~0.17%)** and evolving fraud patterns.

This project focuses on:

- Identifying fraud patterns using SQL and Excel
- Building machine learning models to detect fraudulent transactions
- Generating actionable insights for risk analysis

---

## 🎯 Objective

- Analyze transaction data to detect fraud patterns  
- Understand behavioral trends in fraudulent activity  
- Build predictive models for fraud detection  
- Present insights using a dashboard for decision-making  

---

## 📊 Dataset

- **Source:** Kaggle Credit Card Fraud Detection Dataset (https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)
- **Total Transactions:** 284,807  
- **Fraud Cases:** 492 (~0.17%)  

### 📌 Important Notes:
- Features **V1–V28** are PCA-transformed (privacy reasons)  
- Only **Time** and **Amount** are interpretable features  

---

## 🛠️ Tools & Technologies

- **SQL** → Data analysis & feature extraction  
- **Excel** → Dashboard & visualization  
- **Python (Pandas, Scikit-learn)** → Machine Learning  
- **Jupyter Notebook** → Model development  

---

## 🔍 Project Workflow

### 1️⃣ Data Analysis (SQL)

Performed:

- Fraud vs Non-Fraud distribution  
- Amount-based fraud analysis  
- Time-based fraud trends  
- High-value transaction risk analysis  

---

### 2️⃣ Dashboard (Excel)

Built an interactive dashboard with:

- KPI summary  
- Fraud distribution chart  
- Fraud rate by transaction amount  
- Fraud rate by time window  
- High vs low-value transaction risk  

![Dashboard](dashboard/dashboard.png)
---

### 3️⃣ Machine Learning

#### Model 1: Logistic Regression
- Used as baseline model  
- Applied `class_weight='balanced'` to handle imbalance  

#### Model 2: Random Forest
- Captures non-linear relationships  
- Better performance in fraud detection  

---

## 📈 Key Insights

- Fraud transactions are extremely rare (~0.17% of total transactions)  
- Majority of fraud transactions occur in **low-value transactions (<100)**  
- Early time windows show relatively higher fraud activity  
- High-value transactions have higher fraud risk percentage  

---

## 📊 Business Impact

- Helps identify **high-risk transaction patterns**  
- Supports fraud monitoring based on **time and amount trends**  
- Can assist financial institutions in improving **fraud detection systems**  
- Enables better **risk-based decision making**  

---

## 🤖 Model Evaluation

Evaluation Metrics Used:

- Precision  
- Recall  
- F1 Score  

> Recall is prioritized to minimize missed fraud cases.

## Model Results

**Default threshold (0.5):**
| Model | Precision (Fraud) | Recall (Fraud) | F1-Score |
|---|---|---|---|
| Logistic Regression (balanced) | 0.06 | 0.92 | 0.11 |
| Random Forest (balanced) | 0.27 | 0.89 | 0.41 |

**Random Forest — after threshold tuning:**
| Threshold | Precision (Fraud) | Recall (Fraud) | F1-Score |
|---|---|---|---|
| 0.5 (default) | 0.27 | 0.89 | 0.41 |
| 0.7 | 0.69 | 0.87 | 0.77 |
| 0.9 | 0.84 | 0.74 | 0.79 |
