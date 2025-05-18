-- Create Categories table
CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    CategoryDescription VARCHAR(100)
);

-- Create Dealers table
CREATE TABLE Dealers (
    Dealer_ID INT PRIMARY KEY,
    Dealer_Name VARCHAR(250),
    Email VARCHAR(250),
    Phone VARCHAR(100),
    Region VARCHAR(100),
    Location VARCHAR(100),
    Address VARCHAR(600),
    Product_Line VARCHAR(100)
);

-- Create Products table
CREATE TABLE Products (
    Product_ID INT NOT NULL PRIMARY KEY,
    Product_Name VARCHAR(250),
    Product_Description VARCHAR(600),
    Product_Price NUMERIC(10,2),
    Category_ID INT FOREIGN KEY REFERENCES Categories(Category_ID),
    In_Stock_NOW BIT,
    Rating NUMERIC(10,2)
);

-- Create Sales table
CREATE TABLE Sales (
    Market VARCHAR(100),
    Region VARCHAR(5),
    Year INT,
    Product VARCHAR(100),
    Product_ID INT FOREIGN KEY REFERENCES Products(Product_ID),
    Value MONEY,
    Dealer_ID INT FOREIGN KEY REFERENCES Dealers(Dealer_ID),
    Country VARCHAR(50)
);

-- Create Network_type table
CREATE TABLE Network_type (
    ID_Network INT PRIMARY KEY,
    Network_type VARCHAR(50),
    Link VARCHAR(300),
    Short_description VARCHAR(300)
);

-- Create Socials_results table
CREATE TABLE Socials_results (
    ID_REC INT PRIMARY KEY,
    Year INT,
    ID_Network INT FOREIGN KEY REFERENCES Network_type(ID_Network),
    Reach INT,
    Engagement INT,
    Likes INT,
    Followers INT
);

-- Drop and recreate Socials_FLW table
DROP TABLE IF EXISTS Socials_FLW;

CREATE TABLE Socials_FLW (
    ID_REC INT PRIMARY KEY,
    Year INT,
    ID_Network INT FOREIGN KEY REFERENCES Network_type(ID_Network),
    Region VARCHAR(10),
    Location VARCHAR(80),
    Number_followers INT
);

-- Create KPIs table
CREATE TABLE KPIs (
    ID_KPI INT PRIMARY KEY,
    KPI_Name VARCHAR(50),
    Year INT,
    Quarter INT,
    Value INT
);
