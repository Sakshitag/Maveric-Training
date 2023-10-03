-- exec GetEmpDetails
-- exec GetEmpDetails 5000
alter procedure dbo.GetEmpDetails
( @sal int,
  @startdate int)
as 
begin

	select a.empid, 
		   a.empname, 
		   b.projectid,
		   b.startyear,
		   b.endyear, 
		   d.salary
		   from employee a join empproject b on a.empid = b.empid 
						   join empdept c on a.department = c.deptid
						   join empsalary d on a.empid = d.empid 
						  where d.salary >= @sal and b.startyear = @startdate

end
