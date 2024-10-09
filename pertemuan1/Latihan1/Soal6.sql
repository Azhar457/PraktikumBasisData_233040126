USE kelas_d;
SELECT c.empid, c.firstname, c.lastname 
FROM HR.Employees c
LEFT JOIN Sales.Orders o ON o.empid = c.empid AND o.orderdate > '2016-05-01'
WHERE o.orderid IS NULL AND c.empid IN (3,5,6);