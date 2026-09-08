# Customer Churn Prediction

## Business Problem
Predict which employees are likely to leave (attrition) using HR data, so management can proactively intervene with retention incentives before losing valuable employees.

## Dataset
IBM HR Analytics Employee Attrition dataset (Kaggle) — 1,470 employees, 35 original features.

## Tools Used
SQL (MySQL), Python (pandas, scikit-learn, seaborn), Jupyter Notebook

## Workflow
1. **Data Understanding** — loaded raw data, checked shape/dtypes, identified and removed 4 uninformative columns (`EmployeeCount`, `StandardHours`, `Over18` were constant; `EmployeeNumber` was a meaningless ID). Confirmed no missing values or duplicates.
2. **SQL Analysis** — wrote exploratory queries in MySQL to check attrition rate by department, income, overtime status, job role, and marital status.
3. **Python Cleaning** — verified all categorical columns were consistent (no typos/whitespace issues); saved cleaned dataset.
4. **EDA** — analyzed age, job satisfaction, and correlation patterns using visualizations.
5. **Feature Engineering** — encoded target and categorical variables (binary, ordinal, one-hot encoding) for modeling.
6. **Classification** — trained and compared Logistic Regression (default and class-balanced) and Random Forest models.
7. **Model Evaluation** — selected the best model based on recall for the minority (churn) class; extracted feature importance.

## Key Insights

**From SQL analysis:**
- Sales department has the highest attrition rate (20.63%), followed by HR (19.05%); R&D is lowest (13.84%).
- Employees who left earned significantly less on average ($4,787/month) than those who stayed ($6,833/month).
- Employees working overtime leave at nearly 3x the rate of those who don't (30.53% vs 10.44%).
- Sales Representative has the highest attrition rate by job role, at 39.76%.
- Single employees have higher attrition (25.53%) than Married (12.48%) or Divorced (10.09%).

**From EDA:**
- Employees who left are younger on average (33.6 years) than those who stayed (37.6 years).
- Attrition rate drops steadily as job satisfaction increases (22.84% at lowest satisfaction vs 11.33% at highest).
- MonthlyIncome and JobLevel are highly correlated (0.95) — a multicollinearity consideration for modeling.

## Model Performance

| Model | Recall (Churn class) | Precision (Churn class) | Accuracy |
|---|---|---|---|
| Logistic Regression (default) | 0.36 | 0.63 | 0.86 |
| Logistic Regression (balanced) | **0.66** | 0.37 | 0.77 |
| Random Forest (balanced) | 0.06 | 0.60 | 0.84 |

**Selected model: Logistic Regression (class-balanced).** Given the class imbalance (only 16% of employees left), plain accuracy was misleading. Recall on the churn class was prioritized, since failing to identify an actual churner is more costly to the business than a false alarm. The balanced Logistic Regression model caught 66% of actual churners, compared to just 36% for the default model and 6% for Random Forest.

## Top Factors Driving Attrition (from model coefficients)
1. JobRole: Laboratory Technician
2. OverTime
3. TotalWorkingYears (lower = higher risk)
4. JobLevel
5. JobRole: Sales Representative
6. NumCompaniesWorked (history of switching jobs)

## Repository Structure
```
data/raw/          - Original dataset
data/cleaned/       - Cleaned and feature-engineered datasets
sql/               - SQL exploratory queries
notebooks/         - Jupyter notebooks (data understanding, cleaning, EDA, feature engineering, classification, evaluation)
docs/              - Supporting documentation
```