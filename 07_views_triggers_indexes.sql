USE YemekSiparisPlatformu;
GO

-- Aktif restoran menüleri
CREATE VIEW vw_AktifRestoranMenuleri
AS
SELECT 
    r.Name AS RestaurantName, 
    mi.Name AS ItemName, 
    mi.Price
FROM Restaurants r
INNER JOIN MenuItems mi ON r.RestaurantID = mi.RestaurantID
WHERE r.IsActive = 1 AND mi.IsActive = 1;
GO

-- Askýda Yemek Havuz Durumu
CREATE VIEW vw_AskidaYemekHavuzDurumu
AS
SELECT 
    p.PoolID,
    p.DonationType,
    p.Amount,
    p.DonationDate,
    c.Name AS DonorName
FROM AskidaYemekPool p
LEFT JOIN Customers c ON p.DonorCustomerID = c.CustomerID
WHERE p.IsActive = 1;
GO



USE YemekSiparisPlatformu;
GO

-- Sipariþ teslim edilince restoranýn toplam cirosunu güncelle
CREATE TRIGGER trg_UpdateRestaurantRevenue
ON Orders
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Status)
    BEGIN
        UPDATE Restaurants
        SET Rating = Rating 
        FROM Restaurants r
        INNER JOIN Orders o ON r.RestaurantID = o.RestaurantID
        WHERE o.Status = 'Teslim Edildi';
    END
END;
GO

-- Askýda Yemek kullanýldýðýnda havuzdaki bakiyeyi düþür
CREATE TRIGGER trg_AskidaYemekUsage
ON AskidaYemekUsage
AFTER INSERT
AS
BEGIN
    UPDATE AskidaYemekPool
    SET Amount = Amount - inserted.UsedAmount
    FROM AskidaYemekPool p
    INNER JOIN inserted ON p.PoolID = inserted.PoolID;
END;
GO



-- Müþteri e-posta aramalarý için indeks
CREATE INDEX idx_Customers_Email ON Customers(Email);

-- Restoran adý aramalarý için indeks
CREATE INDEX idx_Restaurants_Name ON Restaurants(Name);
