USE YemekSiparisPlatformu;

-- Askýda Yemek Havuzu Tablosu
CREATE TABLE AskidaYemekPool (
    PoolID INT PRIMARY KEY IDENTITY(1,1),
    DonorCustomerID INT NULL, -- baðýþ yapan müþteri (anonim olabilir)
    DonationType NVARCHAR(20) CHECK (DonationType IN ('Yemek','Bakiye')),
    Amount DECIMAL(10,2) CHECK (Amount > 0),
    DonationDate DATETIME DEFAULT GETDATE(),
    IsActive BIT DEFAULT 1,
    FOREIGN KEY (DonorCustomerID) REFERENCES Customers(CustomerID)
);

-- Ýhtiyaç Sahibi Kullanýcýlar Tablosu
CREATE TABLE Beneficiaries (
    BeneficiaryID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL, -- doðrulanmýþ müþteri
    Verified BIT DEFAULT 0,  -- doðrulama durumu
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Askýda Yemek Kullaným Tablosu
CREATE TABLE AskidaYemekUsage (
    UsageID INT PRIMARY KEY IDENTITY(1,1),
    BeneficiaryID INT NOT NULL,
    PoolID INT NOT NULL,
    UsedAmount DECIMAL(10,2) CHECK (UsedAmount > 0),
    UsageDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (BeneficiaryID) REFERENCES Beneficiaries(BeneficiaryID),
    FOREIGN KEY (PoolID) REFERENCES AskidaYemekPool(PoolID)
);
