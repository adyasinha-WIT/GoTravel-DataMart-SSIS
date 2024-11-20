Use [DS7502Ass2-2024Staging]

CREATE VIEW vw_CustomerWithRegion AS
SELECT c.CustomerKey, c.FirstName, c.LastName, c.Gender, c.BirthDate, c.AddressLine1 AS StreetAddress, 
       ct.CityName, ct.RegionName, ct.RegionID
FROM Customer c
JOIN City ct ON c.CityID = ct.CityID

