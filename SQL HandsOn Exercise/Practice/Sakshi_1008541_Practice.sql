 select * from employee
-- 1.   Select the detail of the employee whose name start with P. 
select * from employee where empname like 'P%' 



select * from empsalary
-- 2.   How many permanent candidate take salary more than 5000.
select count(empid) from empsalary where salary>5000 and ispermanent='Yes'



-- 3.   Select the detail of employee whose emailId is in gmail.
select * from employee where emaildid like '%gmail.com'


-- 4.   Select the details of the employee who work either for department E-104 or E-102.

select * from employee where department='E-104' or department='E-102'


-- 5.   What is the department name for DeptID E-102?
select * from empdept
select deptname from empdept where deptid='E-102'


-- 6.  What is total salary that is paid to permanent employees?

select * from empsalary
select sum(salary) from empsalary where ispermanent='Yes' 

-- 7.  List name of all employees whose name ends with a.

select empname from employee where empname like '%a'


-- 8.  List the number of department of employees in each project.

select count(empid) as employee, projectid from empproject group by projectid

--  9.  How many project started in year 2010.

select count(projectid) from empproject where startyear=2010

-- 10.  How many project started and finished in the same year.
select * from empproject
select count(projectid) from empproject where startyear=endyear

-- 11.  select the name of the employee whose name's 3rd charactor is 'h'.

select * from employee where empname like '__h%'
