-- Inner Join (Default Join)

/**********  Inner Join only matched rows from the table *********/
select distinct a.empid, 
       a.empname,
	   b.salary
   from employee a join empsalary b on a.empid = b.empid
                   right join empproject c on  a.empid = c.empid
				   left join empdept d on a.empid = d.depthead

select a.empid, 
       a.empname,
	   b.salary
   from employee a join empsalary b on a.empid = b.empid
   where b.salary between 1500 and 5000

/**Left Join- All rows from left table only matched rows from the right table **/
select a.empid, 
       a.empname,
	   b.salary
   from employee a left join empsalary b on a.empid = b.empid

select a.empid, 
       a.empname,
	   b.salary
   from employee a left join empsalary b on a.empid = b.empid
   where b.salary between 1500 and 5000


/**Right Join- All rows from Right table only matched rows from the Left table **/
select a.empid, 
       a.empname,
	   b.salary
   from employee a right join empsalary b on a.empid = b.empid

select a.empid, 
       a.empname,
	   b.salary
   from employee a right join empsalary b on a.empid = b.empid
   where b.salary between 1500 and 5000




