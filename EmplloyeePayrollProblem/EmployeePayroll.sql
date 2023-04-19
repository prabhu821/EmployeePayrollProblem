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

--UC7 Ability to find sum, average, min, max and number of male and female employees (using aggregate functions)
select sum(Salary) as Total_Salary_Of_Male from employee_payroll where Gender='M' Group By Gender;
select Sum(Salary) as Total_Salary_Of_Female from employee_payroll where Gender = 'F' Group BY Gender;
select sum(Salary) as Total_Salary_Of_Male_And_Female from employee_payroll;

select Avg(Salary) as Average_Salary_Of_Male from employee_payroll where Gender='M' Group By Gender;
select Avg(Salary) as Average_Salary_Of_Female from employee_payroll where Gender='F' Group By Gender;
select Avg(Salary) as Average_Salary_Of_Male_And_Female from employee_payroll ;

select Max(Salary) as Max_Salary_Of_Male from employee_payroll where Gender='M' Group By Gender;
select Max(Salary) as Max_Salary_Of_Female from employee_payroll where Gender='F' Group By Gender;
select Max(Salary) as Max_Salary_Of_Male_And_Female from employee_payroll;

select Min(Salary) as Min_Salary_Of_Male from employee_payroll where Gender='M' Group By Gender;
select Min(Salary) as Min_Salary_Of_Female from employee_payroll where Gender='F' Group By Gender;
select Min(Salary) as Min_Salary_Of_Male_And_Female from employee_payroll;

select Count(Salary) as Total_Count_Salary_Of_Male from employee_payroll where Gender='M' Group By Gender;
select Count(Salary) as Total_Count_Salary_Of_Female from employee_payroll where Gender='F' Group By Gender;
select Count(Salary) as Total_Count_Salary_Of_Male_And_Female from employee_payroll;


--UC8 Extend employee_payroll data to store employee information like employee phone, address and department
alter table employee_payroll add Phone_Number bigint, Address varchar(200), Department varchar(100) NOT NULL default 'Test';
update employee_payroll set Phone_Number=1111111111, Address='Agra', Department='Account' where Name='Terisa';
update employee_payroll set Phone_Number=2222222222, Address='Meerut', Department='HR' where Name='Charlies';
update employee_payroll set Phone_Number=3333333333, Address='Bulandshahr', Department='IT' where Name='Bill';
update employee_payroll set Phone_Number=4444444444, Address='Noida', Department='Developer' where Name='Mark';


