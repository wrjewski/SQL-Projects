# Employee Management System

This project demonstrates a basic **Employee Management System** using Microsoft SQL Server and showcases SQL concepts such as database creation, table design, data insertion, and query writing. It is designed to manage employees, their departments, and salary details in an organization.

---

## Features
1. **Database**: `EmployeeManagement` is the main database for this project.
2. **Tables**:
   - `Departments`: Stores information about company departments.
   - `Employees`: Stores details about employees, including their names, hire dates, and department affiliations.
   - `Salaries`: Stores salary information for each employee, including base salary and bonuses.
3. **Queries**:
   - List all employees with their department names.
   - Find the highest-paid employee (including bonuses).
   - Calculate the average salary for each department.
   - Count employees hired in the last year.

---

## Project Structure
The project contains the following SQL files:
- `create_database.sql`: Script to create the `EmployeeManagement` database.
- `create_tables.sql`: Script to create the `Departments`, `Employees`, and `Salaries` tables.
- `insert_data.sql`: Script to populate the tables with sample data.
- `queries.sql`: Script with example queries for analyzing the data.

---

## Database Schema
### 1. Departments Table
| Column Name     | Data Type     | Description                    |
|------------------|--------------|--------------------------------|
| `DepartmentID`   | INT (PK)     | Unique identifier for the department. |
| `DepartmentName` | NVARCHAR(50) | Name of the department.        |

### 2. Employees Table
| Column Name     | Data Type     | Description                    |
|------------------|--------------|--------------------------------|
| `EmployeeID`     | INT (PK)     | Unique identifier for the employee. |
| `FirstName`      | NVARCHAR(50) | First name of the employee.    |
| `LastName`       | NVARCHAR(50) | Last name of the employee.     |
| `HireDate`       | DATE         | Date the employee was hired.   |
| `DepartmentID`   | INT (FK)     | Links to the `DepartmentID` in the `Departments` table. |

### 3. Salaries Table
| Column Name     | Data Type     | Description                    |
|------------------|--------------|--------------------------------|
| `SalaryID`       | INT (PK)     | Unique identifier for the salary record. |
| `EmployeeID`     | INT (FK)     | Links to the `EmployeeID` in the `Employees` table. |
| `BaseSalary`     | DECIMAL(10,2)| Base salary of the employee.   |
| `Bonus`          | DECIMAL(10,2)| Bonus amount for the employee. |

---

## Sample Queries
Here are some example queries from the project:

1. **List all employees with their department names**:
   ```sql
   SELECT 
       E.EmployeeID,
       CONCAT(E.FirstName, ' ', E.LastName) AS FullName,
       D.DepartmentName,
       E.HireDate
   FROM Employees E
   JOIN Departments D ON E.DepartmentID = D.DepartmentID;

2. **Find the highest-paid employee (including bonuses)**:
   ```sql
   SELECT TOP 1 
       CONCAT(E.FirstName, ' ', E.LastName) AS FullName,
       (S.BaseSalary + S.Bonus) AS TotalCompensation
   FROM Salaries S
   JOIN Employees E ON S.EmployeeID = E.EmployeeID
   ORDER BY TotalCompensation DESC;

3. **Calculate the average salary by department**:
    ```sql
    SELECT 
        D.DepartmentName,
        AVG(S.BaseSalary) AS AvgBaseSalary
    FROM Salaries S
    JOIN Employees E ON S.EmployeeID = E.EmployeeID
    JOIN Departments D ON E.DepartmentID = D.DepartmentID
    GROUP BY D.DepartmentName;

4. **Count employees hired in the last year**:
    ```sql
    SELECT COUNT(*) AS EmployeesHiredLastYear
    FROM Employees
    WHERE HireDate >= DATEADD(YEAR, -1, GETDATE());
    ```

---

## How to Run the Project
1. Clone or download the repository.
2. Open the files in **VS Code** with the **SQL Server (mssql)** extension installed.
3. Follow these steps:
   - Run `create_database.sql` to create the `EmployeeManagement` database.
   - Run `create_tables.sql` to set up the tables.
   - Run `insert_data.sql` to populate the tables with sample data.
   - Run the queries in `queries.sql` to analyze the data.

---

## Skills Demonstrated
- Database creation and management.
- Table design with primary and foreign key relationships.
- Writing SQL queries for data analysis.
- Use of joins, aggregations, and conditional filtering.

---

## Future Improvements
- Add stored procedures for commonly used queries.
- Create views to simplify reporting.
- Integrate with a front-end application for a complete system.

---