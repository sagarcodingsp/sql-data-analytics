-- View raw HR table structure
SELECT * FROM hr LIMIT 10;
-- 1. Attrition Rate (%) by Age Group (Ranked by highest attrition)
SELECT 
    AgeGroup, 
    COUNT(*) AS total_employees,
    SUM(IF(Attrition = 'Yes', 1, 0)) AS total_churned,
    ROUND(SUM(IF(Attrition = 'Yes', 1, 0)) / COUNT(*) * 100, 2) AS attrition_rate_pct
FROM hr
GROUP BY AgeGroup 
ORDER BY attrition_rate_pct DESC;
-- 2. Most Common Education Field Among Attrited Employees
SELECT 
    EducationField, 
    COUNT(*) AS number_of_emp
FROM hr 
WHERE Attrition = 'Yes'
GROUP BY EducationField
ORDER BY number_of_emp DESC;
-- 3. Attrition Count by Marital Status
SELECT 
    MaritalStatus, 
    SUM(IF(Attrition = 'Yes', 1, 0)) AS attrition_count
FROM hr
GROUP BY MaritalStatus
ORDER BY attrition_count DESC;
-- 4. Attrition Breakdown by Gender
SELECT 
    Gender, 
    Attrition, 
    COUNT(*) AS employee_count
FROM hr
GROUP BY Gender, Attrition
ORDER BY Gender, Attrition;
