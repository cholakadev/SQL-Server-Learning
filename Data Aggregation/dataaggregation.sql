-- (1) Select the size of the longest magic wand. Rename the new column appropriately.

SELECT 
MAX(w.MagicWandSize) AS [Longest Magic Wand]
FROM WizzardDeposits AS w

-- (2) For wizards in each deposit group show the longest magic wand. Rename the new column appropriately.

SELECT w.DepositGroup,
MAX(w.MagicWandSize) AS [Longest Magic Wand]
FROM WizzardDeposits AS w
GROUP BY DepositGroup

-- (3) Select the two deposit groups with the lowest average wand size.

SELECT TOP 2 DepositGroup,
AVG(MagicWandSize)
FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize) ASC

-- (4) Select all deposit groups and their total deposit sums.

SELECT DepositGroup,
SUM(w.DepositAmount)
FROM WizzardDeposits AS w
GROUP BY DepositGroup

-- (5) Select all deposit groups and their total deposit sums but only for the wizards who have their magic wands crafted by Ollivander family.

SELECT DepositGroup,
SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup

-- (6) Select all deposit groups and their total deposit sums but only for the wizards who have their magic wands crafted by Ollivander family. 
-- Filter total deposit amounts lower than 150000. Order by total deposit amount in descending order.

SELECT DepositGroup,
SUM(DepositAmount) AS TotalDeposit
FROM WizzardDeposits as w
WHERE MagicWandCreator = 'Ollivander family'
GROUP BY DepositGroup
HAVING SUM(DepositAmount) < 150000
ORDER BY [TotalDeposit] DESC

-- (7) Create a query that selects:
-- �	Deposit group 
-- �	Magic wand creator
-- �	Minimum deposit charge for each group 
-- Select the data in ascending ordered by MagicWandCreator and DepositGroup.

SELECT DepositGroup, MagicWandCreator,
MIN(DepositCharge) AS MinimumDepositCharge
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator
ORDER BY MagicWandCreator ASC, DepositGroup ASC

-- (8) Write down a query that creates 7 different groups based on their age.
-- Age groups should be as follows:
-- �	[0-10]
-- �	[11-20]
-- �	[21-30]
-- �	[31-40]
-- �	[41-50]
-- �	[51-60]
-- �	[61+]
-- The query should return
-- �	Age groups
-- �	Count of wizards in it

SELECT
CASE
	WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
	WHEN Age BETWEEN 11 AND 20 THEN '[11-20]'
	WHEN Age BETWEEN 21 AND 30 THEN '[21-30]'
	WHEN Age BETWEEN 31 AND 40 THEN '[31-40]'
	WHEN Age BETWEEN 41 AND 50 THEN '[41-50]'
	WHEN Age BETWEEN 51 AND 60 THEN '[51-60]'
	ELSE '[61+]'
END AS [AgeGroup],
COUNT(*) AS [WizardCount]
FROM WizzardDeposits
GROUP BY CASE
	WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
	WHEN Age BETWEEN 11 AND 20 THEN '[11-20]'
	WHEN Age BETWEEN 21 AND 30 THEN '[21-30]'
	WHEN Age BETWEEN 31 AND 40 THEN '[31-40]'
	WHEN Age BETWEEN 41 AND 50 THEN '[41-50]'
	WHEN Age BETWEEN 51 AND 60 THEN '[51-60]'
	ELSE '[61+]'
END
