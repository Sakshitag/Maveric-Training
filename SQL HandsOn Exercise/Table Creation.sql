/*************************** EMPLOYEE TABLES ****************************/

create table -- DDL
employee
(
	empid int primary key,
	empname varchar(100), 
	department varchar(50),
	contactno bigint, 
	emaildid varchar(100), 
	empheadid int
)


 insert into employee values  -- DML
  (101	, 'Isha'	,'E-101'	,1234567890	, 'isha@gmail.com'	,105)
 insert into employee values  
  (102	,'Priya',	'E-104',	1234567890,	'priya@yahoo.com',	103)
 insert into employee values  
  (103, 	'Neha',	'E-101' ,	1234567890,	'neha@gmail.com',	101)
 insert into employee values  
  (104	,'Rahul'	,'E-102'	,1234567890	, 'rahul@yahoo.com' ,105)
 insert into employee values  
  (105	, 'Abhishek'	, 'E-101'	,1234567890	, 'abhishek@gmail.com'	,102)

  select * from employee  -- DQL


create table empdept
(
	deptid varchar(50) primary key,
	deptname varchar(100), 
	dept_off varchar(100), 
	depthead int foreign key references employee(empid)
)

 insert into empdept values  ('E-101',	'HR',	'Monday'	,105)
 insert into empdept values  ('E-102'	,'Development'	,'Tuesday'	,101)
 insert into empdept values  ('E-103'	,'House Keeping'	,'Saturday',	103)
 insert into empdept values  ('E-104'	,'Sales',	'Sunday',	104)
 insert into empdept values  ('E-105',	'Purchase'	,'Tuesday'	,104)

 create table empsalary
 (
 empid int foreign key references employee(empid), 
 salary bigint, 
 ispermanent varchar(3)
 )

insert into empsalary values  (101	,2000	,'Yes')
insert into empsalary values  (102	,10000	,'Yes')
insert into empsalary values  (103	,5000	,'No')
insert into empsalary values  (104	,1900	,'Yes')
insert into empsalary values  (105	,2300	,'Yes')


select * from empsalary

/*************************** PROJECT TABLES ****************************/

--DROP TABLE project

create table project(projectid varchar(50) primary key, duration int)

insert into project values  ('p-1' ,	23)
insert into project values  ('p-2' ,	15)
insert into project values  ('p-3' ,	45)
insert into project values  ('p-4' ,	2)
insert into project values  ('p-5' ,	30)

select * from project 


create table country
(
 cid varchar(50) primary key, 
 cname varchar(100)
)

insert into country values  ('c-1',	'India')
insert into country values  ('c-2',	'USA')
insert into country values  ('c-3',	'China')
insert into country values  ('c-4',	'Pakistan')
insert into country values  ('c-5',	'Russiaa')

select * from country

-- DROP TABLE clienttable

create table clienttable
(
	clientid varchar(50) primary key, 
	clientname varchar(100), 
	cid varchar(50) references country(cid)
)

insert into clienttable values  ('cl-1'	,'ABC Group' ,	'c-1')
insert into clienttable values  ('cl-2'	,'PQR' ,	'c-2')
insert into clienttable values  ('cl-3'	,'XYZ' ,	'c-3')
insert into clienttable values  ('cl-4'	,'tech altum' ,	'c-4')
insert into clienttable values  ('cl-5'	,'mnp' ,	'c-5')

select * from clienttable

--DROP TABLE empproject

create table empproject
(
  empid int foreign key references employee(empid), 
  projectid varchar(50) foreign key references project(projectid), 
  clientid varchar(50) foreign key references clienttable(clientid),
  startyear int, 
  endyear int
)

insert into empproject values  (101,	'p-1'	,'Cl-1',	2010	,2010)
insert into empproject values  (102,	'p-2'	,'Cl-2',	2010	,2012)
insert into empproject values  (103,	'p-3'	,'Cl-3',	2013	,NULL)
insert into empproject values  (104,	'p-4'	,'Cl-4',	2014	,2015)
insert into empproject values  (105,	'p-5'	,'Cl-5',	2015	, NULL)

select * from empproject








