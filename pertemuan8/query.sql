SELECT TABLE_NAME 
FROM kelas_d.INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';
USE kelas_d;

SELECT * FROM HR.Employees;
IF OBJECT_ID('dbo.GetAge') IS NOT NULL DROP FUNCTION dbo.GetAge;
GO
CREATE FUNCTION dbo.GetAge
(
@birthdate AS DATE, 
@eventdate AS DATE
)
RETURNS INT
AS
BEGIN
RETURN
DATEDIFF(year, @birthdate, @eventdate)
- CASE WHEN 100 * MONTH(@eventdate) + DAY(@eventdate)
 < 100 * MONTH(@birthdate) + DAY(@birthdate)
THEN 1
ELSE 0
END;
END;
GO

SELECT
empid, firstname, lastname, birthdate,
dbo.GetAge(birthdate, SYSDATETIME()) AS age
FROM HR.Employees;

IF OBJECT_ID('Sales.GetCustomerOrders', 'P') IS NOT NULL
DROP PROC Sales.GetCustomerOrders;
GO
CREATE PROC Sales.GetCustomerOrders
@custid AS INT,
@fromdate AS DATETIME = '19000101',
@todate AS DATETIME = '99991231',
@numrows AS INT OUTPUT
AS
SET NOCOUNT ON;
SELECT orderid, custid, empid, orderdate
FROM Sales.Orders
WHERE custid = @custid
AND orderdate >= @fromdate
AND orderdate < @todate;
SET @numrows = @@rowcount;
GO

DECLARE @rc AS INT;
EXEC Sales.GetCustomerOrders
@custid = 1, @fromdate = '20070101',
@todate = '20080101',
@numrows = @rc OUTPUT;
SELECT @rc AS numrows;



-- 1. Bualtah procedure dengan nama IncDiscount untuk menaikan diskon secara dinamis setiap konsumen
-- yang dipilih, misal pelanggan dengan id 1 dan kenaikan diskon adalah 10% untuk setiap barang yang
-- dipesannya.
-- 2. Buatlah fungsi untuk memunculkan setiap nama produk dan jumlah quantitas yang dipesan oleh konsumen
-- tertentu, konsumen dengan id 1

SELECT * FROM Sales.OrderDetails c
INNER JOIN Sales.Orders d ON c.orderid = d.orderid
INNER JOIN Sales.Customers o ON d.custid = o.custid;


UPDATE Sales.OrderDetails SET discount = discount + 0.1 WHERE orderid IN (SELECT orderid FROM Sales.Orders WHERE custid IN (SELECT custid FROM Sales.Customers WHERE custid = 1));

IF OBJECT_ID('Sales.IncDiscount', 'P') IS NOT NULL
DROP PROC Sales.IncDiscount;
GO
CREATE PROC Sales.IncDiscount
@custid AS INT,
@inc AS DECIMAL(5, 2)
AS
SET NOCOUNT ON;
UPDATE Sales.OrderDetails
SET discount = discount + @inc
WHERE orderid IN (
SELECT orderid
FROM Sales.Orders
WHERE custid IN (SELECT custid FROM Sales.Customers WHERE custid = @custid)
);
GO

EXEC Sales.IncDiscount @custid = 1, @inc = 0.1;
