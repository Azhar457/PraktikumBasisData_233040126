USE kelas_d;

DROP VIEW ViewPelangganPembelian;
CREATE VIEW ViewPelangganPembelian AS
SELECT c.custid, COUNT(o.orderid) AS TOTALORDER, SUM(d.unitprice) AS Total_Harga FROM Sales.Customers c
INNER JOIN Sales.Orders o ON c.custid = o.custid
INNER JOIN Sales.OrderDetails d ON o.orderid = d.orderid
GROUP BY c.custid;



SELECT * FROM ViewPelangganPembelian;

