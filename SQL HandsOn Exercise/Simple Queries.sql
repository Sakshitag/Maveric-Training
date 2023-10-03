-- 1.   Select the detail of the employee whose name start with P.

select * from employee where empname like 'p%'

-- 2.   How many permanent candidate take salary more than 5000.

select count(salary) as count from empsalary where ispermanent='yes' and salary>5000

-- 3.   Select the detail of employee whose emailId is in gmail.

select * from employee where emaildid like '%@gmail.com'

-- 4.   Select the details of the employee who work either for department E-104 or E-102.

select * from employee where department='E-102' or department='E-104'

-- or

select * from employee where department in ('E-102','E-104')

-- 5.   What is the department name for DeptID E-102?

select deptname from empdept where deptid ='E-102'

-- 6.  What is total salarythat is paid to permanent employees?

select sum(salary) as salary from empsalary where ispermanent='yes'

-- 7.  List name of all employees whose name ends with a.

select * from employee where empname like '%a'

-- 8.  List the number of department of employees in each project.

select count(empid) as employee, projectid from empproject group by projectid

--  9.  How many project started in year 2010.

select count(projectid) as project from empproject where startyear=2010

-- 10.  How many project started and finished in the same year.

select count(projectid) as project from empproject where startyear=endyear

-- 11.  select the name of the employee whose name's 3rd charactor is 'h'.

select * from employee where empname like '__h%'

-- Group By Clause 
select min(salary) as MINSAL, max(salary) as MAXSAL, 
AVG(Salary) as AVGSalary from empsalary 

select count(empid) EmpCount,department from employee 
group by department order by department 

select count(empid) EmpCount,department from employee 
where empheadid in (105,102) group by department
having count(empid)>1 order by department 



select * from employee 
select * from empsalary 
--select * from empdept 
select empname from employee 
where empid in (select empheadid from employee) and 
      empid in (select empid from empsalary where ispermanent='yes')

SELECT CAST(25.65 AS int);
 SELECT CAST(25.65 AS varchar);
SELECT   
   GETDATE() AS UnconvertedDateTime,  
   CAST(GETDATE() AS NVARCHAR(30)) AS UsingCast,  
   CONVERT(nvarchar(30), GETDATE(), 126) AS UsingConvertTo_ISO8601  ; 
   
Select getdate (), cast ( getdate() as varchar(50)), CAST(25.65 AS int);