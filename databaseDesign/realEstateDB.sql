-- Creating the Database

DROP DATABASE IF EXISTS realEstateDB;
CREATE DATABASE realEstateDB;
USE realEstateDB;

-- Creating the PropertyType Table

CREATE TABLE PropertyType (
    TypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeDescription VARCHAR(255) NOT NULL
);

-- Creating the Agents Table

CREATE TABLE Agents (
    AgentID INT PRIMARY KEY AUTO_INCREMENT,
    AgentName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    Experience INT CHECK (Experience >=0)
);

-- Creating the Properties Table

CREATE TABLE Properties (
    PropertyID INT PRIMARY KEY AUTO_INCREMENT,
    Address VARCHAR(255) NOT NULL,
    Price DECIMAL(15, 2) NOT NULL,
    Bedrooms INT CHECK (Bedrooms >=0),
    Bathrooms INT CHECK (Bathrooms >=0),
    PropertyTypeID INT,
    AgentID INT,
    FOREIGN KEY (PropertyTypeID) REFERENCES PropertyType(TypeID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Creating the Clients Table

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    ClientName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL,
    MaxBudget DECIMAL(15, 2) NOT NULL CHECK (MaxBudget >=0)
);

-- Creating the Transactions Table

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    PropertyID INT,
    ClientID INT,
    SalePrice DECIMAL(15, 2) NOT NULL CHECK (SalePrice >=0),
    TransactionDate DATE NOT NULL,
    FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID)
        ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- Creating indexes for frequenty used fields

CREATE INDEX id_Property_Address ON Properties(Address);
CREATE INDEX id_Transaction_SalePrice ON Transactions(SalePrice);

-- Inserting Data into all the tables

INSERT INTO PropertyType (TypeDescription) VALUES
    ('Single-Family Home'),
    ('Townhouse'),
    ('Condo'),
    ('Apartment'),
    ('Land');

INSERT INTO Agents (AgentName, Email, PhoneNumber, Experience) VALUES
    ('Rudra Patel', 'rudraAgent@realEstateDB.com', '123-456-7890', 2),
    ('Mike Smith', 'MikeAgent@realEstateDB.com', '129-451-7822', 4),
    ('John Doe', 'JohnAgent@realEstateDB.com', '221-432-7190', 8);

INSERT INTO Properties (Address, Price, Bedrooms, Bathrooms, PropertyTypeID, AgentID) VALUES
    ('123 Main St', 200000.00, 3, 2, 1, 1),
    ('456 Elm St', 150000.00, 2, 1, 2, 2),
    ('789 Oak St', 300000.00, 4, 3, 3, 3);

INSERT INTO Clients (ClientName, Email, PhoneNumber, MaxBudget) VALUES
    ('Alice Smith', 'aliceClient@realEstateDB.com', '987-654-3210', 250000.00),
    ('Bob Johnson', 'bobClient@realEstateDB.com', '555-555-5555', 180000.00),
    ('Charlie Brown', 'charlieClient@realEstateDB.com', '111-111-1111', 350000.00);

INSERT INTO Transactions (PropertyID, ClientID, SalePrice, TransactionDate) VALUES
    (1, 1, 200000.00, '2024-01-01'),
    (2, 2, 150000.00, '2024-03-02'),
    (3, 3, 300000.00, '2024-05-03');

-- Creating a user and grant access to the database

DROP USER IF EXISTS 'pythonuser'@'localhost';
CREATE USER 'pythonuser'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON realEstateDB.* TO 'pythonuser'@'localhost';
FLUSH PRIVILEGES;