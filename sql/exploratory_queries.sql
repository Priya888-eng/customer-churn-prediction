-- Query 1: Attrition rate by Department
SELECT Department, COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM employees GROUP BY Department ORDER BY attrition_rate_pct DESC;

-- Query 2: Average monthly income by Attrition status
SELECT Attrition, ROUND(AVG(MonthlyIncome), 2) AS avg_monthly_income
FROM employees GROUP BY Attrition;

-- Query 3: Attrition rate by OverTime status
SELECT OverTime, COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM employees GROUP BY OverTime ORDER BY attrition_rate_pct DESC;

-- Query 4: Attrition rate by Job Role
SELECT JobRole, COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM employees GROUP BY JobRole ORDER BY attrition_rate_pct DESC;

-- Query 5: Attrition rate by Marital Status
SELECT MaritalStatus, COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM employees GROUP BY MaritalStatus ORDER BY attrition_rate_pct DESC;