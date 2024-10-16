USE kelas_d;
SELECT 
    orderid,
    orderdate,
    custid,
    empid 
FROM 
    Sales.Orders
WHERE orderdate = (SELECT MAX(orderdate) FROM Sales.Orders)
ORDER BY orderid DESC;
