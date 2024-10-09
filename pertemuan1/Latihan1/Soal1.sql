USE kelas_d;
SELECT c.firstname, c.lastname, 
CASE 
    WHEN c.titleofcourtesy IN ('Ms.', 'Mrs.') THEN 'Female'
    WHEN c.titleofcourtesy = 'Mr.' THEN 'Male'
    ELSE 'Unknown'
END AS 'Gender'
FROM HR.Employees c;