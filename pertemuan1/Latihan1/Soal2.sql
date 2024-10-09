USE kelas_d;
SELECT c.custid, 
        COUNT(od.orderid) AS Total_Pesanan,
        SUM(od.qty) AS Total_Kuantitas
FROM Sales.Customers c 
INNER JOIN Sales.Orders o on c.custid = o.custid
INNER JOIN Sales.OrderDetails od on o.orderid = od.orderid
WHERE c.country IN ('USA')
GROUP BY c.custid;