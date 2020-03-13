  -- (1) Write a SQL query to find the first names of all employees in the departments with ID 3 or 10 
  -- and whose hire year is between 1995 and 2005 inclusive.

 SELECT FirstName
   FROM Employees
  WHERE DepartmentID IN (3, 10) 
    AND DATEPART(YEAR, HireDate) 
BETWEEN 1995 AND 2005

-- (2) Write a SQL query to find the first and last names of all employees whose job titles does not contain “engineer”. 

SELECT FirstName, LastName
  FROM Employees
 WHERE JobTitle NOT LIKE ('%engineer%')

 -- (3) Write a SQL query to find town names that are 5 or 6 symbols long and order them alphabetically by town name. 

SELECT [Name]
  FROM Towns
 WHERE LEN([Name]) = 5 OR LEN([Name]) = 6 

  -- (4) Write a SQL query to find all towns that start with letters M, K, B or E. Order them alphabetically by town name. 

   SELECT TownID, [Name]
     FROM Towns
    WHERE SUBSTRING([Name], 1, 1) IN ('M', 'K', 'B', 'E')
 ORDER BY [Name]

 -- (5) Write a SQL query to find all towns that does not start with letters R, B or D. Order them alphabetically by name. 

   SELECT TownID, [Name]
     FROM Towns
    WHERE SUBSTRING([Name], 1, 1) NOT IN ('R', 'B', 'D')
 ORDER BY [Name]

 -- (6) Write a SQL query to create view V_EmployeesHiredAfter2000 with first and last name to all employees hired after 2000 year. 

 CREATE VIEW V_EmployeesHiredAfter2000
          AS
      SELECT FirstName, LastName
        FROM Employees
	   WHERE DATEPART(YEAR, HireDate) > 2000

	   SELECT * FROM V_EmployeesHiredAfter2000

-- (7) Write a SQL query to find the names of all employees whose last name is exactly 5 characters long.

SELECT FirstName, LastName
  FROM Employees
 WHERE LEN(LastName) = 5

-- (8) Write a query that ranks all employees using DENSE_RANK. In the DENSE_RANK function, 
-- employees need to be partitioned by Salary and ordered by EmployeeID. 
-- You need to find only the employees whose Salary is between 10000 and 50000 and order them by Salary in descending order.
-- DENSE_RANK ( ) OVER ( [ <partition_by_clause> ] < order_by_clause > ) 

 SELECT EmployeeID,
	   FirstName,
	   LastName,
	   Salary,
DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
    FROM Employees
   WHERE Salary BETWEEN 10000 AND 50000
ORDER BY Salary DESC

-- (9) Use the query from the previous problem and upgrade it, so that it finds only the employees whose Rank is 2 and again, order them by Salary (descending).

SELECT * FROM (SELECT EmployeeID,
	   FirstName,
	   LastName,
	   Salary,
DENSE_RANK() OVER (PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
    FROM Employees
   WHERE Salary BETWEEN 10000 AND 50000) AS temp
   WHERE temp.[Rank] = 2
   ORDER BY temp.[Salary] DESC