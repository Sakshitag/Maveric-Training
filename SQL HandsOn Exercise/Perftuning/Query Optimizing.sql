

/*         Query Optimization Session*/

/*Set these statistics IO, Time ON/OFF to measure and examine the Query behavior while conluding efficient queries*/
set statistics io,time on

select * from employee where exists (select empid from empproject where empproject.empid = employee.empid)

select a.* from employee a join empproject b on a.empid = b.empid 

/***************************** Query tuning with Non-Ansi Join vs Join - START *****************************/
/* NON-ANSI Join*/
select a.empid, 
       a.empname, 
	   b.projectid,
	   b.startyear,
	   b.endyear
	   from employee a , empproject b where a.empid = b.empid 

/*ANSI Join*/
select a.empid, 
       a.empname, 
	   b.projectid,
	   b.startyear,
	   b.endyear
	   from employee a join empproject b on a.empid = b.empid 

/***************************** Query tuning with Non-Ansi Join vs Join - END *****************************/

/************************************************Dirty Read during Transaction - START ********************/

select * from empsalary

-- TRANSACTIONS
	Begin Tran 

			update empsalary set salary = salary + 300 where empid = 101
			update empsalary set salary = salary + 700 where empid = 101
			waitfor delay '000:00:10' -- Explicitly giving a delay of 10 secs
			update empsalary set salary = salary - 300 where empid = 101

	Commit

select * from empsalary


select * from empsalary where empid=101

select * from empsalary with(nolock) where empid=101

/************************************************Dirty Read during Transaction - END ********************/



/******************************************** Fastest way to get rowcount of a table  --  START ********/
SELECT  SCHEMA_NAME(t.schema_id) SchemaName,
        t.[name] TableName, 
        SUM(p.row_count) TotalRows
FROM sys.tables t
INNER JOIN sys.dm_db_partition_stats p
ON t.object_id = p.object_id
    AND t.type_desc = 'USER_TABLE'
    AND p.index_id IN (0,1)
WHERE t.[name] = 'employee'
GROUP BY t.schema_id, t.[name]
ORDER BY TotalRows DESC

/******************************************** Fastest way to get rowcount of a table  --  END ********/




/******************************************** Primary Key Clustered vs Non-Clustered --  START ********/

/* Nonclustered Primary Key  */
--Clustered Primary Key
GO
Create table Student
(
	ID INT NOT NULL, 
	[ROLLNO] INT NOT NULL, 
)
GO
ALTER TABLE Student
ADD PRIMARY KEY (ID);
GO
DROP TABLE Student;
GO

--Non-Clustered Primary Key
GO
Create table Student
(
ID INT NOT NULL, 
[ROLLNO] INT NOT NULL, 
)
GO
ALTER TABLE Student
ADD PRIMARY KEY NONCLUSTERED(ID);
GO
DROP TABLE Student;
GO

--Non-Clustered Primary Key
GO
Create table Student
(
ID INT NOT NULL, 
[ROLLNO] INT NOT NULL, 
)
GO

CREATE CLUSTERED INDEX IDX_PK
ON Student(ROLLNO);
GO

ALTER TABLE Student
ADD PRIMARY KEY (ID);
GO

DROP TABLE Student;
GO


/******************************************** Fastest way to get rowcount of a table  --  END ********/




/******************************************** Efficient Queries --  START **************************/

/****  Execute Set stastics io on | set statistics time on */

Set statistics io on 
set statistics time on

create table Customer
(
	CustId int identity(1,1),
	CustName varchar(100), 
	CustNum  bigint	

)
GO


 insert into Customer values  -- DML
  ('Isha'	,1234567890)
 insert into Customer values  
  ('Priya',	1234567890 )
 insert into Customer values  
  ('Neha',	1234567890 )
 insert into Customer values  
  ('Rahul'	,1234567890	) 
 insert into Customer values  
  ('Abhishek',1234567890 )

   insert into Customer values  -- DML
  ('John'	,888899999 ) 
 insert into Customer values  
  ('Vivek',	9999900000  ) 
 insert into Customer values  
  ('Venkat',3333366666  )
 insert into Customer values  
  ('Nitin'	,7777766666	) 
 insert into Customer values  
  ('Patrick',5555566666 ) 

  select * from Customer

-- Set statistics IO ON   |  Set statistics time on 

set statistics time on
-- Solution-1 where CustId is Identity Column
 select * from Customer
 where CustId in 
 (
	 select min(CustId) CustID from Customer
	 union all
	 select max(CustId) CustID from Customer
 )
 GO


 -- Solution-2 where ordering by any Column (here CustId)

 select * from Customer
 where CustId in 
 ( select top 1 CustId from Customer order by CustId)
 OR -- union all / or
  CustId in 
 (select top 1 CustId from Customer order by CustId desc)
  GO

 -- Solution-3 Using RANKING function

 select * from 
 ( select *, 
	 ROW_NUMBER() OVER  (ORDER BY CustId ASC) TOPROW,
	 ROW_NUMBER() OVER  (ORDER BY CustId DESC) BOTTOMROW
	 from Customer ) t

 where TOPROW = 1 OR BOTTOMROW = 1
 ORDER BY TOPROW

 GO


 /******************************************** Efficient Queries --  END **************************/



 /* Count(*)  OR Count(1)  - START */

 
create table Engineer
(
	EngId int identity(1,1),
	EngName varchar(100), 
	EngContNum bigint not null,
	AddressID int not null,
	StateProvinceID int not null,
	PostalCode int not null

)
GO


 insert into Engineer values  -- DML
  ('Isha'	,1234567890, 101, 11, 1001)
 insert into Engineer values  
  ('Priya',	1234567890, 102, 12, 1002)
 insert into Engineer values  
  ('Neha',	1234567890, 103, 13, 1003)
 insert into Engineer values  
  ('Rahul'	,1234567890,	 104, 14, 1004)
 insert into Engineer values  
  ('Abhishek',1234567890, 105, 15, 1005)

   insert into Engineer values  -- DML
  ('John'	,888899999,	106, 16, 1006)
 insert into Engineer values  
  ('Vivek',	9999900000, 107, 17, 1007)
 insert into Engineer values  
  ('Venkat',3333366666, 108, 18, 1008)
 insert into Engineer values  
  ('Nitin'	,7777766666	,109, 19, 1009 )
 insert into Engineer values  
  ('Patrick',5555566666, 110, 20, 1010)


create clustered index [CI] on [dbo].[Engineer]
( [AddressID] ASC ) 
GO

create nonclustered index [Narrow] on [dbo].[Engineer]
( [StateProvinceID] ASC ) 
GO

create nonclustered index [Wide] on [dbo].[Engineer]
( [PostalCode] ASC ) 
GO

set statistics io on 
select count(*) from Engineer 
select count(1) from Engineer


 /* Count(*)  OR Count(1)  - END */


  /* Index Scan Good or Bad?  - START */
  /*Notice Logical Read vs Num of row read*/

set statistics io on 
select top 1 e.AddressID, e.StateProvinceID,  e.EngName  
from Engineer e
GO

select top 1 e.AddressID, e.StateProvinceID,  e.EngName  
from Engineer e order by e.EngId , e.EngName
GO




 /******************************** Examine efficient queries with 10Lac records (Employees table) - START **************************/

/****  new table employees query tuning - 10Lac records from Index SQL Script */

--select * from employees

set statistics io on
set statistics time on

 select * from employees
 where Id in 
 (
	 select min(Id) CustID from employees
	 union all
	 select max(Id) CustID from employees
 )
 GO

  select * from employees
 where Id in 
 ( select top 1 Id from employees order by Id)
 OR -- union all / or
  Id in 
 (select top 1 Id from employees order by Id desc)
  GO


   select * from 
 ( select *, 
	 ROW_NUMBER() OVER  (ORDER BY Id ASC) TOPROW,
	 ROW_NUMBER() OVER  (ORDER BY Id DESC) BOTTOMROW
	 from Employees ) t

 where TOPROW = 1 OR BOTTOMROW = 1
 ORDER BY TOPROW

 GO
  /******************************** Examine efficient queries with 10Lac records (Employees table) - END **************************/