CREATE PROCEDURE Employee1
AS
SELECT * FROM Employee
GO;

EXEC Employee1;

CREATE PROCEDURE Employee_A (@empid int)
AS
SELECT * FROM employee WHERE empid = @empid
GO;

EXEC Employee_A @empid = 101;

CREATE VIEW employee_B AS
SELECT empid,empname 
FROM employee

SELECT * FROM employee_B;
EXEC Employee1;
EXEC Employee_A @empid = 101;
SELECT * FROM employee_B;





