USE kelas_d;
SELECT c.custid, 
        COUNT(od.orderid) AS numorders,
        SUM(od.qty) AS totalqty
FROM Sales.Customers c 
INNER JOIN Sales.Orders o on c.custid = o.custid
INNER JOIN Sales.OrderDetails od on o.orderid = od.orderid
WHERE c.country IN ('USA')
GROUP BY c.custid
ORDER BY c.custid ASC;