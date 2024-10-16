SELECT TOP (50) 
     c.custid, c.contactname, c.city, c.country  ,COUNT(o.orderid) AS 'JUMLAH ORDER'
FROM 
    Sales.Customers c
INNER JOIN Sales.Orders o ON  c.custid = o.custid
INNER JOIN Sales.OrderDetails d ON o.orderid = d.orderid
WHERE c.city IN ('Sao Paulo', 'London', 'Paris') OR city LIKE '%n' 
GROUP BY c.custid, c.contactname, c.city, c.country
HAVING COUNT(o.orderid) > 10;

SELECT * FROM Sales.Customers
WHERE postalcode BETWEEN 10000 AND 10050
ORDER BY postalcode ASC;

SELECT * FROM Sales.CustOrders
WHERE ordermonth BETWEEN '2006' AND '2008'
ORDER BY ordermonth ASC;

SELECT * FROM Sales.Customers
WHERE city IN (SELECT city FROM HR.Employees WHERE city NOT IN ('London'));
