-- Sipariþ fiþi: müþteri, restoran, kurye ve sipariþ detaylarý
SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    r.Name AS RestaurantName,
    cr.Name AS CourierName,
    o.OrderDate,
    od.Quantity,
    mi.Name AS ItemName,
    od.Price
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
INNER JOIN Couriers cr ON o.CourierID = cr.CourierID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN MenuItems mi ON od.ItemID = mi.ItemID;


-- Son 1 ayda toplam 5’ten fazla sipariþ alan restoranlarýn ortalama sepet tutarý
SELECT 
    r.Name AS RestaurantName,
    COUNT(o.OrderID) AS TotalOrders,
    AVG(o.TotalAmount) AS AvgOrderAmount
FROM Orders o
INNER JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
WHERE o.OrderDate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY r.Name
HAVING COUNT(o.OrderID) > 5;



-- Hiç Askýda Yemek baðýþý yapmamýþ ama platformu aktif kullanan müþteriler
SELECT c.CustomerID, c.Name, c.Email
FROM Customers c
WHERE c.CustomerID NOT IN (
    SELECT DISTINCT DonorCustomerID
    FROM AskidaYemekPool
    WHERE DonorCustomerID IS NOT NULL
)
AND c.IsActive = 1;
