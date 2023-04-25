--UC1 Ability to create a payroll service database
create database Payroll_Service;
use Payroll_Service;

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

--UC9 Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
alter table employee_payroll add Basic_Pay float, Deductions float, Taxable_Pay float, Income_Tax float, Net_Pay float ;
update employee_payroll set Basic_Pay=60000, Deductions=25000, Taxable_Pay=3000,Income_Tax=1500,Net_Pay=45000000 where Name='Terisa';
update employee_payroll set Basic_Pay=50000, Deductions=5000, Taxable_Pay=2000,Income_Tax=1800,Net_Pay=5000000 where Name='Charlies';
update employee_payroll set Basic_Pay=65000, Deductions=2000, Taxable_Pay=3500,Income_Tax=2500,Net_Pay=55000000 where Name='Bill';
update employee_payroll set Basic_Pay=70000, Deductions=35000, Taxable_Pay=4000,Income_Tax=4500,Net_Pay=75000000 where Name='Mark';

select * from employee_payroll

--UC10 Make Richu as part of sales & Marketing
update employee_payroll set Department='Sales & Marketing' where Name='Terisa';
select * from employee_payroll;

--UC11 Implements the ER Diagram into payroll service DB

create table employee_payroll1 (ID int Identity(1,1)Primary Key, EmpID int, Department varchar(100) NOT NULL, DepartmentId int,
 FOREIGN KEY (EmpID) REFERENCES employee_payroll(Id));

insert into employee_payroll1 (EmpId, Department) values ('1', 'Finance'),('2', 'Sales'), ('3', 'Marketing')
select * from employee_payroll1

alter table employee_payroll1 add Name varchar(100), Gender varchar (1), Salary float
update employee_payroll1 set Name = 'Jimmy', DepartmentId = 12345, Gender = 'M', Salary = 20000 where Department = 'Finance'
update employee_payroll1 set Name = 'Satish', DepartmentId = 12346, Gender = 'M', Salary = 24000 where Department = 'Sales'
update employee_payroll1 set Name = 'Aurora', DepartmentId = 12347, Gender = 'F', Salary = 35000 where Department = 'Marketing'

--UC12 Ensure All Retrieve Queries

alter table employee_payroll1 add Start date
Insert into employee_payroll1 (EmpId, Department,DepartmentId,Name,Gender,Salary,Start) values ('4','Analyst',12348,'Amaira','F',24000,'2018-01-01'),('5','Testing',12349,'Justin','M',19000,'2020-03-03'),('6','HR',12350,'Salena','F',40000,'2019-05-05')

update employee_payroll1 set Start = '2017-08-09' where Name = 'Jimmy'
update employee_payroll1 set Start = '2019-08-19' where Name = 'Satish'
update employee_payroll1 set Start = '2017-10-09' where Name = 'Aurora'

select * from employee_payroll1