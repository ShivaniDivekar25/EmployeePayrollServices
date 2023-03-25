--Create Payroll Service Database UC1
CREATE DATABASE Payroll_Service_DB;
USE Payroll_Service_DB;

--Create Employee Payroll Table UC2
CREATE TABLE Employee_Payroll_Table(
EmpID INT PRIMARY KEY  IDENTITY(1,1),
EmployeeName VARCHAR(100) NOT NULL,
Salary FLOAT NOT NULL,
Startdate DATE
);
SELECT * FROM Employee_Payroll_Table;

--Insert Data Into Employee Payroll Table UC3
INSERT INTO Employee_Payroll_Table(EmployeeName,Salary) VALUES ('Swati',100000.00),('Payal',120000.00),('Mahek',150000.00);
INSERT INTO Employee_Payroll_Table(EmployeeName,Salary) VALUES ('Malhar',100000.00),('Shubham',110000.00);

UPDATE Employee_Payroll_Table SET Startdate='2018-03-01' WHERE EmpID=8;
UPDATE Employee_Payroll_Table SET Startdate='2019-03-20' WHERE EmpID=9;
UPDATE Employee_Payroll_Table SET Startdate='2020-01-28' WHERE EmpID=10;
UPDATE Employee_Payroll_Table SET Startdate='2021-03-20' WHERE EmpID=11;
UPDATE Employee_Payroll_Table SET Startdate='2021-06-25' WHERE EmpID=13;
UPDATE Employee_Payroll_Table SET Startdate='2022-03-12' WHERE EmpID=14;

--Retrive All Data From Employee Payroll Table UC4
SELECT * FROM Employee_Payroll_Table;
SELECT * FROM Employee_Payroll_Table WHERE EmpID=9;
SELECT EmployeeName FROM Employee_Payroll_Table WHERE EmpID=9;

--Retrieve Salary Data Of Perticular Employee UC5
SELECT Salary FROM Employee_Payroll_Table WHERE EmployeeName='Payal';
--Retrieve Data of Employee Who Have Join In Perticular Range Of Date
SELECT * FROM Employee_Payroll_Table where StartDate BETWEEN '2020-01-01' AND GETDATE();
SELECT * FROM Employee_Payroll_Table where StartDate BETWEEN CAST('2020-01-01' AS DATE) AND GETDATE(); 

--Add Gender To Employee UC6
ALTER TABLE Employee_Payroll_Table ADD Gender CHAR(1);
--Update Data
UPDATE Employee_Payroll_Table SET Gender='F' WHERE EmployeeName='Swati' OR EmployeeName='Payal';
UPDATE Employee_Payroll_Table SET Gender='F' WHERE EmployeeName='Mahek';
UPDATE Employee_Payroll_Table SET Gender='M' WHERE EmployeeName='Malhar' OR EmployeeName='Shubham';

SELECT * FROM Employee_Payroll_Table;

--Ability To Find Sum, Avg, Min, Max, Count By Gender
--SUM
SELECT SUM(Salary) AS SumOfFSalary FROM Employee_Payroll_Table WHERE Gender='F' GROUP BY Gender;
SELECT SUM(Salary) AS SumOfMSalary FROM Employee_Payroll_Table WHERE Gender='M' GROUP BY Gender;
--AVG
SELECT AVG(Salary) AS AvgOfFSalary FROM Employee_Payroll_Table WHERE Gender='F' GROUP BY Gender;
SELECT AVG(Salary) AS AvgOfMSalary FROM Employee_Payroll_Table WHERE Gender='M' GROUP BY Gender;
--MIN
SELECT MIN(Salary) AS MinOfFSalary FROM Employee_Payroll_Table WHERE Gender='F' GROUP BY Gender;
SELECT MIN(Salary) AS MinOfMSalary FROM Employee_Payroll_Table WHERE Gender='M' GROUP BY Gender;
--MAX
SELECT MAx(Salary) AS MaxOfFSalary FROM Employee_Payroll_Table WHERE Gender='F' GROUP BY Gender;
SELECT MAX(Salary) AS MaxOfMSalary FROM Employee_Payroll_Table WHERE Gender='M' GROUP BY Gender;
--Count
SELECT COUNT(EmployeeName) AS FemaleCount FROM Employee_Payroll_Table WHERE Gender='F' GROUP BY Gender;
SELECT COUNT(EmployeeName) AS MaleCount FROM Employee_Payroll_Table WHERE Gender='M'GROUP BY Gender;

SELECT * FROM Employee_Payroll_Table;

--Ability To Extent Employee Payroll To Phone No., Address, Dept, And Add Data UC8
ALTER TABLE Employee_Payroll_Table ADD AddressOfEmp VARCHAR(100);
ALTER TABLE Employee_Payroll_Table ADD PhoneNumber BIGINT;
ALTER TABLE Employee_Payroll_Table ADD Department VARCHAR(20);

--Insert Data
INSERT INTO Employee_Payroll_Table(AddressOfEmp,PhoneNumber,Department) VALUES('Karad',8986952360,'IT' WHERE EmployeeName='Swati')
UPDATE Employee_Payroll_Table SET AddressOfEmp='Karad',PhoneNumber=8986922703, Department='IT' WHERE EmpID=9 OR EmpID=10;
UPDATE Employee_Payroll_Table SET AddressOfEmp='Kolhapur',PhoneNumber=7875613307, Department='EE' WHERE EmpID=14;
UPDATE Employee_Payroll_Table SET AddressOfEmp='Pune',PhoneNumber=7875614407, Department='IC' WHERE EmpID=13;
UPDATE Employee_Payroll_Table SET AddressOfEmp='Pune',PhoneNumber=7875623078, Department='Production' WHERE EmpID=8;
UPDATE Employee_Payroll_Table SET AddressOfEmp='Satar',PhoneNumber=9826350178, Department='Quality' WHERE EmpID=11;

SELECT * FROM Employee_Payroll_Table;

--Extend Employee Payroll To BasicPay, Deduction, Taxable Pay, Income Tax, Net Pay UC9
--Rename Salary As Basic Pay
EXEC sp_rename 'Employee_Payroll_Table.Salary','BasicPay','COLUMN';
ALTER TABLE Employee_Payroll_Table ADD Deduction BIGINT;
ALTER TABLE Employee_Payroll_Table ADD TaxablePay BIGINT;
ALTER TABLE Employee_Payroll_Table ADD IncomeTax BIGINT;
ALTER TABLE Employee_Payroll_Table ADd NetPay BIGINT;

UPDATE Employee_Payroll_Table SET Deduction = 0 WHERE EmpID=8 OR EmpID=9 OR EmpID=10 OR EmpID=11 OR EmpID=13 OR EmpID=14;
UPDATE Employee_Payroll_Table SET TaxablePay = 0 WHERE EmpID=8 OR EmpID=9 OR EmpID=10 OR EmpID=11 OR EmpID=13 OR EmpID=14;
UPDATE Employee_Payroll_Table SET Incometax = 0 WHERE EmpID=8 OR EmpID=9 OR EmpID=10 OR EmpID=11 OR EmpID=13 OR EmpID=14;
UPDATE Employee_Payroll_Table SET NetPay = 0 WHERE EmpID=8 OR EmpID=9 OR EmpID=10 OR EmpID=11 OR EmpID=13 OR EmpID=14;

SELECT * FROM Employee_Payroll_Table;

--Add New Data For Terisa In Sales And Marketing UC10
INSERT INTO Employee_Payroll_Table(EmployeeName,BasicPay,Gender,AddressOfEmp,PhoneNumber,Department,Deduction,TaxablePay,Incometax,NetPay) 
VALUES('Terisa',2200000.00,'F','Plot 23,Pune','1234567890','Sale',10000,10000,0,200000);
INSERT INTO Employee_Payroll_Table(EmployeeName,BasicPay,Gender,AddressOfEmp,PhoneNumber,Department,Deduction,TaxablePay,Incometax,NetPay) 
VALUES('Terisa',2200000.00,'F','Plot 23,Pune','1234567890','Marketing',10000,10000,0,200000);
UPDATE Employee_Payroll_Table SET Startdate='2020-03-30' WHERE EmpID=15 OR EmpID=16;

SELECT * FROM Employee_Payroll_Table;

--ER Diagram UC11
--1.Employee Details Table
CREATE TABLE EmployeeDetail(
EmpId INT PRIMARY KEY IDENTITY(1,1),
EmpName VARCHAR(150) NOT NULL,
Address VARCHAR(100)NOT NULL,
Gender VARCHAR(10) NOT NULL,
Mobile VARCHAR(10) DEFAULT('1234567890')
);

INSERT INTO EmployeeDetail(EmpName, Address,Gender,Mobile) VALUES('Swati','Karad','Female','7875623078'),('Payal','Pune','Female','8986922703');
INSERT INTO EmployeeDetail(EmpName, Address,Gender,Mobile) VALUES('Mahek','Kolhapur','Female','9855623078'),('Malhar','Pune','Male','8986932703'),('Shubham','Panvel','Male','7549856306');
SELECT * FROM EmployeeDetail;

--Department Table
CREATE TABLE DepartmentDetails(
DeptId INT PRIMARY KEY IDENTITY(1001,1),
DeptName VARCHAR(150) NOT NULL,
EmpId INT FOREIGN KEY REFERENCES EmployeeDetail(EmpId)
);

INSERT INTO DepartmentDetails VALUES ('HR',1),('Manager',2),('Sales',3),('Marketing',4),('IT',5);
SELECT * FROM DepartmentDetails;

--Salary Table
CREATE TABLE SalaryDetails(
BasicPay BIGINT DEFAULT(000),
Deduction BIGINT DEFAULT(000),
Tax BIGINT DEFAULT(000),
EmpId INT FOREIGN KEY REFERENCES EmployeeDetail(EmpId),
NetPay Bigint 
);

INSERT INTO SalaryDetails(BasicPay,Deduction,Tax,EmpId) VALUES(1000000,2000,3000,1),(2000000,5000,2500,2),(3000000,10000,8000,3),(4000000,20000,15000,4),(5000000,30000,25000,5);
UPDATE SalaryDetails SET NetPay=(BasicPay-Tax-Deduction);
SELECT * FROM SalaryDetails;

--Main Company 
CREATE TABLE CompanyTable(
CompId INT PRIMARY KEY IDENTITY(1,1),
EmpId INT FOREIGN KEY REFERENCES EmployeeDetail(EmpId),
DeptId INT FOREIGN KEY REFERENCES DepartmentDetails(DeptId),
Start DATE NOT NULL,
);
INSERT INTO CompanyTable(EmpId,DeptId,Start) VALUES(1,1001,'2020-03-01'),(2,1002,'2011-01-01'),(3,1003,'2015-01-01'),(4,1004,'2011-01-01'),(5,1005,'2018-01-01');
SELECT *FROM CompanyTable;

SELECT * FROM CompanyTable AS A FULL OUTER JOIN EmployeeDetail AS B ON A.EmpId=B.EmpId; 
SELECT * FROM EmployeeDetail AS C FULL OUTER JOIN DepartmentDetails AS D ON C.EmpId=D.EmpId; 
SELECT * FROM EmployeeDetail AS C FULL OUTER JOIN SalaryDetails AS D ON C.EmpId=D.EmpId; 

--UC12
--All data retrieve
SELECT * FROM CompanyTable INNER JOIN EmployeeDetail ON CompanyTable.EmpId = EmployeeDetail.EmpId;
SELECT * FROM CompanyTable INNER JOIN DepartmentDetails ON EmployeeDetail.EmpId = DepartmentDetails.EmpId;
SELECT * FROM CompanyTable INNER JOIN SalaryDetails ON EmployeeDetail.EmpId = SalaryDetails.EmpId;

--UC12 - UC6
SELECT * FROM CompanyTable
WHERE Start BETWEEN CAST('2018-01-01'AS DATE) AND GETDATE();
--UC12 -UC7
--Avg
SELECT AVG(NetPay) FROM SalaryDetails 
INNER JOIN EmployeeDetail ON  SalaryDetails.EmpId = EmployeeDetail.EmpId  WHERE Gender = 'Male' GROUP BY Gender;

--Sum
SELECT Gender, SUM(NetPay) AS AvgSalary FROM SalaryDetails 
INNER JOIN EmployeeDetail ON  SalaryDetails.EmpId = EmployeeDetail.EmpId GROUP BY Gender;

--Min
SELECT Gender, MIN(NetPay) AS MinSalary FROM SalaryDetails 
INNER JOIN EmployeeDetail ON  SalaryDetails.EmpId = EmployeeDetail.EmpId GROUP BY Gender;

--Max
SELECT Gender, MAX(NetPay) AS MaxSalary FROM SalaryDetails 
INNER JOIN EmployeeDetail ON  SalaryDetails.EmpId = EmployeeDetail.EmpId GROUP BY Gender;

--Count
SELECT Gender, COUNT(NetPay) As TotalPerson FROM SalaryDetails 
INNER JOIN EmployeeDetail ON  SalaryDetails.EmpId = EmployeeDetail.EmpId GROUP BY Gender;