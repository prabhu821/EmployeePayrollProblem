--UC1 Ability to create a payroll service database
create database Payroll;
use Payroll;

--UC2 Ability to create a employee payroll table in the payroll service database 
create table  employee_payroll(Id int Identity(1,1)Primary Key, Name varchar(100), Salary float, StartDate date);

--UC3 Insert employee data into employee_payroll table
Insert into employee_payroll values ('Terisa', 25000, '2019-11-13'), ('Charlies', 30000, '2020-05-21'),
('Bill', 35000, '2018-01-03'), ('Mark', 40000, '2018-01-03');