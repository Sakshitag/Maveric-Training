--JOINS 

--INNER JOIN : Only matched rows from both the tables would be retrieved.
-- LEFT OUTER JOIN : All rows from Left table and only matched rows from right table would be retrieved
-- RIGHT OUTER JOIN : All rows from Right table and only matched rows from left table would be retrieved

select * from employee
select * from empdept
select * from [dbo].[empproject] 


select a.empid, 
       a.empname, 
	   b.projectid,
	   b.startyear,
	   b.endyear, 
	   d.salary
	   from employee a join empproject b on a.empid = b.empid 
	                   join empdept c on a.department = c.deptid
					   join empsalary d on a.empid = d.empid --and d.salary >= 5000 and b.startyear > 2010
					   where d.salary >= 5000 and b.startyear > 2010 


select a.empid, 
       a.empname, 
	   b.projectid,
	   b.startyear,
	   b.endyear
	   from employee a, empproject b where a.empid = b.empid 

select a.empid, 
       a.empname, 
	   b.projectid,
	   b.startyear,
	   b.endyear
	   from employee a join empproject b on a.empid = b.empid 


select  a.EmpID, 
		a.EmpName, 
		b.projectid, 
		b.startyear 
	    from emptest a join empproject b on a.EmpID = b. empid
select  a.EmpID, 
		a.EmpName, 
		b.projectid, 
		b.startyear 
	    from emptest a left join empproject b on a.EmpID = b. empid
select  a.EmpID, 
		a.EmpName, 
		b.projectid, 
		b.startyear 
	    from emptest a right join empproject b on a.EmpID = b. empid

select a.empid, 
       a.empname, 
	   b.projectid,
	   b.startyear,
	   b.endyear
	   from employee a left join empproject b on a.empid = b.empid 

select a.empid, 
       a.empname, 
	   b.projectid,
	   b.startyear,
	   b.endyear
	   from employee a right join empproject b on a.empid = b.empid 

-- Nested Query : Inner Query will runs first, only once. Outer query executes based on Inner query result

select * from empsalary
select * from employee 
 where empid = (select empid from empsalary where salary = 5000)
	 

-- Correlated Query: Outer query executes first and for every outer query, inner query will execute.


select * from employee 
select * from empproject

select * from employee where 
exists (select empid from empproject 
         where empproject.empid = employee.empid)

-------------

Procedures

