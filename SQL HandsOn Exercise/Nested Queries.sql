-- 1.   Select the department name of the company which is assigned to the employee whose employee id is grater 103.

select deptname from empdept where deptid 
in (select department from employee where empid>103)

-- 2.   Select the name of the employee who is working under Abhishek.

select empname from employee 
where empheadid = (select empid from employee where empname='abhishek') 

--3.   Select the name of the employee who is department head of HR.

select empname from employee 
where empid =(select depthead from empdept where deptname='hr')

-- 4.   Select the name of the employee head who is permanent.

select empname from employee where empid in(select empheadid from employee) and 
empid in(select empid from empsalary where ispermanent='yes')

-- 5.   Select the name and email of the Dept Head who is not Permanent.

select empname, emaildid from employee where empid in(select depthead from empdept ) 
and empid in (select empid from empsalary where ispermanent='no')

-- 6.   Select the employee whose department off is monday

select * from employee where department 
in(select deptid from empdept where dept_off='monday')

--7.   select the indian clinets details.
select * from clienttable where cid in(select cid from p_country where cname='india')

-- 8.   select the details of all employee working in development department.
select * from employee where 
department in (select deptid from empdept where deptname='development')


select empname from employee 
where empheadid in (select empid from employee where empname  IN ('Abhishek','priya') )







































