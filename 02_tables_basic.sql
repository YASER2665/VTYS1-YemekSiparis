USE YemekSiparisPlatformu;

-- Müþteri Tablosu
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Phone NVARCHAR(15) UNIQUE NOT NULL,
    IsActive BIT DEFAULT 1
);

-- Restoran Tablosu
CREATE TABLE Restaurants (
    RestaurantID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Address NVARCHAR(200),
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    IsActive BIT DEFAULT 1
);

-- Kurye Tablosu
CREATE TABLE Couriers (
    CourierID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50) NOT NULL,
    Phone NVARCHAR(15) UNIQUE NOT NULL,
    IsActive BIT DEFAULT 1
);