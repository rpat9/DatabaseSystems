-- add sql queries under the appropriate comment

-- ###Data Definition###


-- statement to create database
CREATE DATABASE rpatelINC
USE rpatelINC;

-- statement to create table 1
CREATE TABLE Employee (
    id SMALLINT UNSIGNED AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    companyEmail VARCHAR(100) NOT NULL UNIQUE,
    salary DECIMAL(10, 2),
    PRIMARY KEY (id)
);

-- statement to create table 2
CREATE TABLE Department (
    departmentName VARCHAR(50) NOT NULL,
    managerID SMALLINT UNSIGNED,
    assistantManagerID SMALLINT UNSIGNED,
    FOREIGN KEY (managerID) REFERENCES Employee(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (assistantManagerID) REFERENCES Employee(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CHECK (managerID <> assistantManagerID)
);

-- statements to insert data into tables
INSERT INTO Employee (firstName, lastName, companyEmail, salary) VALUES 
    ('Donald', 'Trump', 'dontrump@gmail.com', 150000.00),  
    ('Jimmy', 'John', 'jimjohn@gmail.com', 50000.00),
    ('Warren', 'Buffet', 'warbuff@yahoo.com', 100000.00),
    ('Elon', 'Musk', 'elonmusk@gmail.com', 200000.00);

INSERT INTO Department (departmentName, managerID, assistantManagerID) VALUES
    ('Finance', 1, 4),
    ('Sales', 3, 1),
    ('Food', 2, 3);