USE kelas_d;
-- 1. Bualtah procedure dengan nama IncDiscount untuk menaikan diskon secara dinamis setiap konsumen
-- yang dipilih, misal pelanggan dengan id 1 dan kenaikan diskon adalah 10% untuk setiap barang yang
-- dipesannya.
-- Hapus procedure jika sudah ada
IF OBJECT_ID('IncDiscount', 'P') IS NOT NULL DROP PROC dbo.IncDiscount;
GO

-- Buat procedure IncDiscount
CREATE PROC dbo.IncDiscount
    @custid AS INT,
    @inc AS DECIMAL(5, 2)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Sales.OrderDetails
    SET discount = discount + @inc
    WHERE orderid IN (
        SELECT orderid
        FROM Sales.Orders
        WHERE custid = @custid
    );
END;
GO
-- Buat procedure DecDiscount
CREATE PROC dbo.DecDiscount
    @custid AS INT,
    @dec AS DECIMAL(5, 2)
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE Sales.OrderDetails
    SET discount = discount - @dec
    WHERE orderid IN (
        SELECT orderid
        FROM Sales.Orders
        WHERE custid = @custid
    );
END;
-- Eksekusi procedure untuk menaikkan diskon
EXEC dbo.IncDiscount @custid = 1, @inc = 0.10;

-- Eksekusi procedure untuk menurunkan diskon
EXEC dbo.DecDiscount @custid = 1, @dec = 0.10;

-- Tampilkan hasil setelah diskon diperbarui
SELECT 
    o.companyname, 
    o.custid,
    c.discount AS 'Discount Awal'
FROM Sales.OrderDetails c
INNER JOIN Sales.Orders d ON c.orderid = d.orderid
INNER JOIN Sales.Customers o ON d.custid = o.custid
WHERE o.custid = 1;

-- Tampilkan semua data dari OrderDetails
SELECT * FROM Sales.OrderDetails;




-- 2. Buatlah fungsi untuk memunculkan setiap nama produk dan jumlah quantitas yang dipesan oleh konsumen
-- tertentu, konsumen dengan id 1

-- Hapus fungsi jika sudah ada
IF OBJECT_ID('GetCustomerOrders', 'FN') IS NOT NULL DROP FUNCTION dbo.GetCustomerOrders;
GO
CREATE FUNCTION dbo.GetCustomerOrders(@custid INT)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        p.productname,
        c.quantity
    FROM Sales.OrderDetails c
    INNER JOIN Sales.Orders d ON c.orderid = d.orderid
    INNER JOIN Sales.Customers o ON d.custid = o.custid
    INNER JOIN Sales.Products p ON c.productid = p.productid
    WHERE o.custid = @custid
);
GO

-- Eksekusi fungsi GetCustomerOrders
SELECT * FROM dbo.GetCustomerOrders(1);

