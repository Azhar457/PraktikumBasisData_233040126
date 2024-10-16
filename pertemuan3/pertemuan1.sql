SELECT c.city, c.country
FROM Sales.customers c
WHERE c.country = 'France' AND (c.city = 'Paris' OR c.city = 'Nantes');

SELECT c.city, COUNT(c.custid)  AS countcust
FROM Sales.Customers c
WHERE c.country = 'France' AND (c.city = 'Paris' OR c.city = 'Nantes')
GROUP BY c.country, c.city
HAVING COUNT(custid) > 1;

SELECT c.city, COUNT(c.custid)  AS countcust
FROM Sales.Customers c
GROUP BY c.country, c.city
HAVING COUNT(custid) > 1
ORDER BY c.city,countcust DESC;

SELECT TOP(5) contactname, address
FROM Sales.Customers
WHERE country = 'France' OR country = 'Germany';