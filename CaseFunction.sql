-- Here we learn some case statement of SQL.
SELECT 
C.CustomerID,
C.Score,
CASE 
	WHEN C.Score>800 THEN 'HIGH'
	WHEN C.Score>400 THEN 'Mid'

	ELSE 'Small'
END AS RANGE_SCORE
FROM Sales.Customers AS C

/*  TASK 1:

GENERATE A REPORT SHOWING THE TOTAL SALES FOR EACH CATEGORY:

--HIGH: IF THE SALES HIGHER THEN 50
--MEDIUM : IF THE SALES BETWEEN 20 AND 50
--LOW :IF THE SALES EQUAL OR LOWER THEN 20
SORT THE RESULT FROM LOWEST TO HIGHEST.

*/
SELECT
catagory,
sum(Sales) as TotalSales
FROM(
	SELECT
	O.CustomerID,
	O.Sales,
	CASE 
		WHEN O.Sales >50 THEN 'HIGH'
		--WHEN O.Sales >50 THEN 2   (Then it through error.)
		WHEN O.Sales BETWEEN 21 AND 50 THEN 'MIDIUM'

		ELSE 'LOWEST'

		END catagory


	FROM Sales.Orders AS O
)t
GROUP BY catagory
ORDER BY TotalSales DESC;

--NOTE : The data type of the results must be matching.
--mapping : transfrom the values from one from to another.
--save the file