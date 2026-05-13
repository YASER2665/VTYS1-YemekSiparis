USE YemekSiparisPlatformu;

-- Müþteriler
INSERT INTO Customers (Name, Email, Phone) VALUES
('Ali Yýlmaz', 'ali@example.com', '05001112233'),
('Ayþe Demir', 'ayse@example.com', '05002223344'),
('Mehmet Kaya', 'mehmet@example.com', '05003334455'),
('Zeynep Çelik', 'zeynep@example.com', '05004445566'),
('Ahmet Öz', 'ahmet@example.com', '05005556677'),
('Fatma Arslan', 'fatma@example.com', '05006667788'),
('Burak Þahin', 'burak@example.com', '05007778899'),
('Elif Güneþ', 'elif@example.com', '05008889900'),
('Can Koç', 'can@example.com', '05009990011'),
('Merve Aksoy', 'merve@example.com', '05001010112');

-- Restoranlar
INSERT INTO Restaurants (Name, Address, Rating) VALUES
('Pizza House', 'Ýstanbul Kadýköy', 5),
('Burger World', 'Ankara Çankaya', 4),
('Kebapçý Ali', 'Adana Seyhan', 5),
('Sushi Time', 'Ýzmir Konak', 3),
('Tatlýcý Hasan', 'Bursa Osmangazi', 4);

-- Kuryeler
INSERT INTO Couriers (Name, Phone) VALUES
('Ahmet Kurye', '05001110001'),
('Selim Kurye', '05002220002'),
('Deniz Kurye', '05003330003');

-- Menü Ürünleri (50 ürün örnek)
INSERT INTO MenuItems (RestaurantID, Name, Price) VALUES
(1, 'Margarita Pizza', 80),
(1, 'Sucuklu Pizza', 95),
(2, 'Cheeseburger', 70),
(2, 'Double Burger', 90),
(3, 'Adana Kebap', 60),
(3, 'Urfa Kebap', 55),
(4, 'California Roll', 120),
(4, 'Salmon Nigiri', 150),
(5, 'Baklava', 50),
(5, 'Kazandibi', 40);

-- Sipariþler (örnek 5 sipariþ, sen 100’e tamamlayabilirsin)
INSERT INTO Orders (CustomerID, RestaurantID, CourierID, TotalAmount, Status) VALUES
(1, 1, 1, 175, 'Teslim Edildi'),
(2, 2, 2, 90, 'Hazýrlanýyor'),
(3, 3, 3, 60, 'Teslim Edildi'),
(4, 4, 1, 270, 'Hazýrlanýyor'),
(5, 5, 2, 90, 'Teslim Edildi');

-- Sipariþ Detaylarý
INSERT INTO OrderDetails (OrderID, ItemID, Quantity, Price) VALUES
(1, 1, 1, 80),
(1, 2, 1, 95),
(2, 3, 1, 70),
(2, 4, 1, 90),
(3, 5, 1, 60);

-- Askýda Yemek Havuzu (örnek baðýþlar)
INSERT INTO AskidaYemekPool (DonorCustomerID, DonationType, Amount) VALUES
(1, 'Bakiye', 100),
(2, 'Yemek', 1),
(3, 'Bakiye', 50);

-- Ýhtiyaç Sahibi Kullanýcýlar
INSERT INTO Beneficiaries (CustomerID, Verified) VALUES
(6, 1),
(7, 1);

-- Askýda Yemek Kullanýmý
INSERT INTO AskidaYemekUsage (BeneficiaryID, PoolID, UsedAmount) VALUES
(1, 1, 50),
(2, 3, 30);
