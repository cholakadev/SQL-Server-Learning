-- (1) Select the size of the longest magic wand. Rename the new column appropriately.

SELECT 
MAX(w.MagicWandSize) AS [Longest Magic Wand]
FROM WizzardDeposits AS w

-- (2) For wizards in each deposit group show the longest magic wand. Rename the new column appropriately.

SELECT w.DepositGroup,
MAX(w.MagicWandSize) AS [Longest Magic Wand]
FROM WizzardDeposits AS w
GROUP BY DepositGroup