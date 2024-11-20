--DROP DATABASE IF EXISTS GoTravelDM;

--CREATE DATABASE GoTravelDM;
--GO

USE GoTravelDM;
GO

-- Create CountryDim table
CREATE TABLE CountryDim (
    CountryID INT PRIMARY KEY,
    CountryName NVARCHAR(100)
);

-- Create CityDim table
CREATE TABLE CityDim (
    CityID INT PRIMARY KEY,
    CityName NVARCHAR(100),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES CountryDim(CountryID)
);

-- Create AirportDim table
CREATE TABLE AirportDim (
    AirportID INT PRIMARY KEY,
    AirportName NVARCHAR(100),
    Length INT,
    Elevation INT,
    GeoLocation NVARCHAR(50),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES CityDim(CityID)
);

-- Create AirlineDim table
CREATE TABLE AirlineDim (
    AirlineID INT PRIMARY KEY,
    AirlineCode NVARCHAR(10),
    AirlineName NVARCHAR(100),
    CarrierCode NVARCHAR(10)
);

-- Create BranchDim table
CREATE TABLE BranchDim (
    BranchID INT PRIMARY KEY,
    BranchName NVARCHAR(100),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES CityDim(CityID)
);

-- Create AgentDim table
CREATE TABLE AgentDim (
    AgentID INT PRIMARY KEY,
    LastName NVARCHAR(50),
    FirstName NVARCHAR(50),
    Gender NVARCHAR(10),
    DOB DATE,
    HireDate DATE,
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES BranchDim(BranchID)
);

-- Create CustomerDim table
CREATE TABLE CustomerDim (
    CustomerID INT PRIMARY KEY,
    LastName NVARCHAR(50),
    FirstName NVARCHAR(50),
    Gender NVARCHAR(10),
    DOB DATE,
    StreetAddress NVARCHAR(100),
    RegionName NVARCHAR(50),
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES CityDim(CityID)
);


-- Create DateDim table
CREATE TABLE DateDim (
    PK_Date INT PRIMARY KEY,
    Year_Name VARCHAR(50),
    Quarter_Name VARCHAR(50),
    Month_Name VARCHAR(50),
);


-- Create BookingFact table
CREATE TABLE BookingFact (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    DepartureAirportID INT,
    DestinationAirportID INT,
    AirlineID INT,
    AgentID INT,
    DepartureDateID INT,
    ReturnDateID INT,
    SalesAmount MONEY,
    Discount MONEY,
    GST MONEY,
    FOREIGN KEY (CustomerID) REFERENCES CustomerDim(CustomerID),
    FOREIGN KEY (DepartureAirportID) REFERENCES AirportDim(AirportID),
    FOREIGN KEY (DestinationAirportID) REFERENCES AirportDim(AirportID),
    FOREIGN KEY (AirlineID) REFERENCES AirlineDim(AirlineID),
    FOREIGN KEY (AgentID) REFERENCES AgentDim(AgentID),
    FOREIGN KEY (DepartureDateID) REFERENCES DateDim(PK_Date),
    FOREIGN KEY (ReturnDateID) REFERENCES DateDim(PK_Date)
);



