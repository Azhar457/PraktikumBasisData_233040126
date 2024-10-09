USE kelas_d; 
SELECT 
    c.custid, 
    c.companyname, 
    o.orderid, 
    o.orderdate 
FROM 
    Sales.Customers c
INNER JOIN 
    Sales.Orders o ON c.custid = o.custid;