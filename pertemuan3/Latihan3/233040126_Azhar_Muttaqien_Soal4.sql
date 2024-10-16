USE kelas_d;
SELECT c.custid, c.companyname, o.orderid, o.orderdate 
FROM Sales.Customers c
LEFT JOIN Sales.Orders o ON c.custid = o.custid
ORDER BY o.orderid ASC;