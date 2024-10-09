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
-- SELECT Customers.custid, Customers.companyname, Orders.orderid, Orders.orderdate 
-- FROM Sales.Customers AS C   
-- INNER JOIN Sales.Orders AS O     
-- ON Customers.custid = Orders.custid;
-- kesalahan tersebut dikarenakan pada saat melakukan join tabel Customers dan Orders, serta alias yang digunakan tidak sesuai dengan tabel yang di join