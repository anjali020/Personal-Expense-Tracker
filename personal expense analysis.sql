create database personal_expenses;
use personal_expenses;

-- View All Records
select *
from expenses;


-- Total Expenses
SELECT SUM(Amount) AS Total_Expense
FROM expenses;


-- Average Expense
SELECT AVG(Amount) AS Avg_Expense
FROM expenses;


-- Highest Expense
SELECT MAX(Amount) AS Highest_Expense
FROM expenses;


-- Lowest Expense
SELECT MIN(Amount) AS Lowest_Expense
FROM expenses;


-- Expense by Category
SELECT Category,
       SUM(Amount) AS Total_Spent
FROM expenses
GROUP BY Category
ORDER BY Total_Spent DESC;


-- Number of Transactions by Category
SELECT Category,
       COUNT(*) AS Transactions
FROM expenses
GROUP BY Category
ORDER BY Transactions DESC;


-- Expense by Payment Mode
SELECT `Payment Mode`,
       SUM(Amount) AS Total_Spent
FROM expenses
GROUP BY `Payment Mode`;


-- Top 5 Highest Expenses
SELECT *
FROM expenses
ORDER BY Amount DESC
LIMIT 5;


-- Daily Spending
SELECT DATE(`DATE & Time`) AS Expense_Date,
       SUM(Amount) AS Total_Spent
FROM expenses
GROUP BY DATE(`DATE & Time`)
ORDER BY Expense_Date;


-- Monthly Spending
SELECT YEAR(`DATE & Time`) AS Year,
       MONTH(`DATE & Time`) AS Month,
       SUM(Amount) AS Total_Spent
FROM expenses
GROUP BY Year, Month
ORDER BY Year, Month;


-- Category with Highest Spending
SELECT Category,
       SUM(Amount) AS Total_Spent
FROM expenses
GROUP BY Category
ORDER BY Total_Spent DESC
LIMIT 1;


-- Most Used Payment Mode
SELECT `Payment Mode`,
       COUNT(*) AS Usage_Count
FROM expenses
GROUP BY `Payment Mode`
ORDER BY Usage_Count DESC
LIMIT 1;


-- Top Expense in Each Category
SELECT *
FROM (
    SELECT Category,
           Description,
           Amount,
           RANK() OVER(
               PARTITION BY Category
               ORDER BY Amount DESC
           ) AS rk
    FROM expenses
) x
WHERE rk = 1;
