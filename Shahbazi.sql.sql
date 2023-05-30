
--Q1

SELECT
	SUM(QUANTITY * UNITPRICE)
FROM SaleTable

--------------------------------------------------------------------------------------------------------------------------

--Q2

SELECT
	DISTINCT Customer
FROM SaleTable

--------------------------------------------------------------------------------------------------------------------------

--Q3

SELECT
	Product ,SUM(QUANTITY * UNITPRICE)
FROM SaleTable
GROUP BY Product

--------------------------------------------------------------------------------------------------------------------------

--Q4

SELECT 
    Customer, 
    COUNT(DISTINCT OrderID) AS TotalOrderID, 
    SUM(Quantity * UnitPrice) AS TotalPurchaseAmount, 
    SUM(Quantity) AS TotalItemCount
FROM 
    [Sale Table]
WHERE 
    Customer IN (
        SELECT DISTINCT Customer 
        FROM [Sale Table] 
        WHERE Quantity * UnitPrice > 1500
    )
GROUP BY 
    Customer
---------------------------------------------------------------------------------------------------------------------

--Q5
SELECT
SUM(QUANTITY * UNITPRICE*(ISNULL (ProfitRatio,.1)),SUM(ProfitRatio)
FROM SaleTable LEFT JOIN SaleProfit
	ON SaleTable.Product = SaleProfit.Product 

------------------------------------------------------------------------------------------------------------------------

--Q6.A

WITH CTE_COUNTCUSTOMER
AS
(
SELECT
	DISTINCT Customer, Date
FROM SaleTable
)
SELECT 
COUNT(Customer)
FROM CTE_COUNTCUSTOMER

---------------------------------------------------------

--Q6.B

WITH RecursiveCTE AS (
    SELECT Name, manager, 1 as Level
    FROM Chart
    WHERE manager IS NULL
    UNION ALL
    SELECT e.Name, e.manager, r.Level + 1 as Level
    FROM Chart e
    INNER JOIN RecursiveCTE r ON e.manager = r.Name
)
SELECT Name, manager, Level
FROM RecursiveCTE
ORDER BY Level;











