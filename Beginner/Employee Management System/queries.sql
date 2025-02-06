USE EmployeeManagement;
GO

-- List All Employees With Their Department Names and Hire Date
SELECT 
    E.EmployeeID,
    CONCAT(E.FirstName, ' ', E.LastName) AS FullName,
    D.DepartmentName,
    E.HireDate
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

-- Find the Highest Paid Employee (Including Bonuses)
SELECT TOP 1 
    CONCAT(E.FirstName, ' ', E.LastName) AS FullName,
    (S.BaseSalary + S.Bonus) AS TotalCompensation
FROM Salaries S
JOIN Employees E ON S.EmployeeID = E.EmployeeID
ORDER BY TotalCompensation DESC;

-- Calculate the Average Salary by Department
SELECT 
    D.DepartmentName,
    AVG(S.BaseSalary) AS AvgBaseSalary
FROM Salaries S
JOIN Employees E ON S.EmployeeID = E.EmployeeID
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName;

-- Count Employees Hired in the Last Year
SELECT COUNT(*) AS EmployeesHiredLastYear
FROM Employees
WHERE HireDate >= DATEADD(YEAR, -1, GETDATE());
