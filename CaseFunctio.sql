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
--Mapping : transfrom the values from one from to another.


/*						TASK - 02
RETRIVE EMPLOYEE DETAILS WITH GENDER DISPLAYED AS FULL TEXT.
*/

SELECT 
*,
--COALESCE(LASTNAME,'') LastName,
--COALESCE(ManagerID,-999) ManagerId,  those are experement for Handling NULL value.

CASE E.Gender

	WHEN 'M' THEN 'Male'
	WHEN 'F' THEN 'Female'
	ELSE 'Not Avaiable'
END GenderFullText

FROM Sales.Employees AS E
ORDER BY Gender

/*					TASK - 03

Retrive customers details with abbreviated country code.
*/

SELECT 
C.CustomerID,
C.Country,
CASE C.Country
	WHEN 'Germany' THEN 'DE'
	WHEN 'USA' THEN 'US'
	ELSE 'N/A'

END CountryCode
FROM Sales.Customers AS C


/*				HANDLING NULLS

Replace NULLS with a specific value.

nulls can lead to inaccurate results,
which can lead to wrong decision making. */
 

 --				TASK - 04
 -- find the Average scores of customers and treat nulls as 0
 -- Additionally provide details such customer ID and LastName

 SELECT 
 C.CustomerID,
 C.FirstName,
 --C.LastName,
 --C.Score,
 C.Country,
 COALESCE(C.LastName,'') LastName,
 --COALESCE(C.Score,0) Score,
	 AVG(CASE
			WHEN Score IS NULL THEN 0
			ELSE Score
		END ) OVER() AvgCustomerClear
 --AVG(C.Score)  OVER() AvgScore it show wrong value.
 FROM Sales.Customers AS C
