CREATE DATABASE pertemuan6;
USE pertemuan6;
-- CREATE TABLE Departments (
--     DepartmentID INT PRIMARY KEY,
--     DepartmentName VARCHAR(50)
-- );

-- CREATE TABLE Employees (
--     EmployeeID INT PRIMARY KEY,
--     Name VARCHAR(50),
--     DepartmentID INT,
--     ManagerID INT,
--     FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
--     FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
-- );

-- CREATE TABLE Salaries (
--     EmployeeID INT,
--     Salary DECIMAL(10,2),
--     FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
-- );

-- CREATE TABLE Projects (
--     ProjectID INT PRIMARY KEY,
--     ProjectName VARCHAR(50),
--     DepartmentID INT,
--     FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
-- );

-- Insert data
USE pertemuan6;
SELECT * FROM Employees;
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES 
(1, 'Finance'),
(2, 'HR'),
(3, 'IT'),
(4, 'Marketing');
INSERT INTO Projects (ProjectID, ProjectName, DepartmentID) VALUES 
(1, 'Project Alpha', 1),
(2, 'Project Beta', 2),
(3, 'Project Gamma', 3),
(4, 'Project Delta', 4);
INSERT INTO Employees (EmployeeID, Nama, ManagerID, DepartmentID) VALUES 
(1, 'John Doe', NULL, 1),
(2, 'Jane Smith', 1, 2),
(3, 'Emily Davis', 1, 3),
(4, 'Michael Brown', 2, 4),
(5, 'Sarah Wilson', 3, 1),
(6, 'David Johnson', 3, 2);


INSERT INTO Salaries (EmployeeID, Salary) VALUES 
(1, 7000.00),
(2, 6000.00),
(3, 6500.00),
(4, 5500.00),
(5, 5000.00),
(6, 4800.00);
SELECT * FROM Employees;

-- Query Melihat Tabel di database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
------------------------------------
USE pertemuan6;
SELECT * FROM Employees;

SELECT 
    c.Nama,  d.DepartmentName
FROM 
    Employees c
    INNER JOIN Departments d ON c.DepartmentID = d.DepartmentID;
-- SOAL 1
SELECT 
    c.Nama,  d.DepartmentName
    FROM Employees c
    INNER JOIN Departments d ON c.DepartmentID = d.DepartmentID

-- SOAL 2
SELECT 
    c.Nama, d.ProjectName
    FROM Employees c
    INNER JOIN Projects d ON c.DepartmentID = d.DepartmentID;

SELECT * FROM Projects;

--soal 3
SELECT 
    c.ProjectName, d.DepartmentName
    FROM Projects c
    LEFT JOIN Departments d ON c.DepartmentID = d.DepartmentID;
    SELECT * FROM Projects;
--soal 4
SELECT 
    c.Nama,  d.Salary
    FROM Employees c
    LEFT JOIN Salaries d ON c.EmployeeID = d.EmployeeID;

--soal 5
SELECT 
    c.Nama,  d.ProjectName
    FROM Employees c
    CROSS JOIN Projects d;
--soal 6
SELECT 
    c.Nama,  d.Nama
    FROM Employees c
    LEFT JOIN Employees d ON c.ManagerID = d.EmployeeID;
--soal 7
SELECT 
    c.Nama,  d.DepartmentName
    FROM Employees c
    INNER JOIN Departments d ON c.DepartmentID = d.DepartmentID;