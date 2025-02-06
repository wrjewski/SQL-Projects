USE EmployeeManagement;
GO

-- Insert Departments
INSERT INTO Departments (DepartmentName)
VALUES
    ('Human Resources'),
    ('Engineering'),
    ('Marketing'),
    ('Sales');

-- Insert Employees
INSERT INTO Employees (FirstName, LastName, HireDate, DepartmentID)
VALUES
    ('John', 'Doe', '2020-01-15', 2),
    ('Jane', 'Smith', '2019-03-10', 1),
    ('Alice', 'Johnson', '2021-06-25', 3),
    ('Bob', 'Brown', '2018-11-05', 4);

-- Insert Salaries
INSERT INTO Salaries (EmployeeID, BaseSalary, Bonus)
VALUES
    (1, 80000, 5000),
    (2, 70000, 3000),
    (3, 65000, 2000),
    (4, 90000, 10000);

SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Salaries;