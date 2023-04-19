--UC1 Ability to create a payroll service database
create database Payroll;
use Payroll;

--UC2 Ability to create a employee payroll table in the payroll service database 
create table  employee_payroll(Id int Identity(1,1)Primary Key, Name varchar(100), Salary float, StartDate date);

--UC3 Insert employee data into employee_payroll table
Insert into employee_payroll values ('Terisa', 25000, '2019-11-13'), ('Charlies', 30000, '2020-05-21'),
('Bill', 35000, '2018-01-03'), ('Mark', 40000, '2018-01-03');

--UC4 Ability to retrieve all the employee payroll data that is added to payroll service database
select * from employee_payroll;

--UC5 Ability to retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database
select * from employee_payroll where Name= 'Bill';
select * from employee_payroll where StartDate between cast('2018-01-01' as date ) AND GETDATE();

--UC6 Ability to add Gender to Employee Payroll Table and Update the Rows
alter table employee_payroll add Gender varchar(10)
update employee_payroll set Gender ='M' where Name='Charlie' or Name='Bill' or Name='Mark' or Name='Charlies' ;
update employee_payroll set Gender ='F' where name='Terisa' ;


