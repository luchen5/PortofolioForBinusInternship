USE SandwEJ

--1
SELECT CustomerName, CustomerPhoneNumber
FROM MsCustomer mc JOIN HeaderSalesTransaction hst ON mc.CustomerId = hst.CustomerId
	JOIN DetailSalesTransaction dst ON dst.SalesID = hst.SalesID
WHERE DATEPART(YEAR,TransactionDate) = 2019
GROUP BY CustomerName, CustomerPhoneNumber
HAVING SUM(SandwichQuantitySold) > 3

--2
SELECT StaffName, [TrasanctionCount] = COUNT(SalesID)
FROM MsStaff ms JOIN HeaderSalesTransaction hst ON ms.StaffID = hst.StaffID
	JOIN MsCustomer mc ON mc.CustomerID = hst.CustomerID
WHERE CustomerName LIKE 'T%' AND DATEPART(MONTH,CustomerDateOfBirth) > 9
GROUP BY StaffName

--3
SELECT [ChefName] = LOWER(ChefName), [Average Sandwich Per Transaction] = AVG(SandwichQuantitySold)
FROM MsChef mc JOIN HeaderSalesTransaction hst ON mc.ChefID = hst.ChefID
	JOIN DetailSalesTransaction dst ON dst.SalesID = hst.SalesID
WHERE ChefExp <> 'Beginner' 
GROUP BY ChefName
HAVING SUM(SandwichQuantitySold) > 3

--4 
SELECT [Vendor Code] = SUBSTRING(mv.VendorID,3,3), [VendorName] = REPLACE(VendorName, 'Company', 'Co.'), 
		[Minimum Item Price] = MIN(IngredientPrice), [Maximum Item Price] = MAX(IngredientPrice)
FROM MsVendor mv JOIN DetailPurchaseTransaction dpt ON mv.VendorID = dpt.VendorID
	JOIN MsIngredient mi ON mi.IngredientID = dpt.IngredientID
WHERE VendorEmail LIKE '%@gmail.com' AND VendorName LIKE '% % %'
GROUP BY mv.VendorID, VendorName

--5
SELECT [Staff Nickname] = SUBSTRING(StaffName,1,1) + SUBSTRING(StaffName,LEN(StaffName),1), StaffSalary
FROM MsStaff ms JOIN 
		(SELECT StaffID,CustomerGender 
		FROM MsCustomer mc JOIN HeaderSalesTransaction hst ON hst.CustomerID = mc.CustomerID 
		WHERE CustomerGender LIKE 'Female') cg ON cg.StaffID = ms.StaffID
WHERE StaffSalary > (SELECT AVG(StaffSalary) FROM MsStaff)

--6
SELECT CustomerName, [CustomerAge] = DATEDIFF(YEAR,CustomerDateOfBirth,GETDATE()), SandwichName, [Quantity] = CAST(SandwichQuantitySold AS varchar) + 'Piece(s)'
FROM MsCustomer mc JOIN HeaderSalesTransaction hst ON hst.CustomerID = mc.CustomerID
	JOIN DetailSalesTransaction dst ON dst.SalesID = hst.SalesID
	JOIN MsSandwich ms ON ms.SandwichID = dst.SandwichID
WHERE SandwichQuantitySold < 5 AND DATEDIFF(YEAR,CustomerDateOfBirth,GETDATE()) > (SELECT AVG(custAge.CustomerAge) FROM (SELECT DATEDIFF(YEAR,CustomerDateOfBirth,GETDATE()) AS CustomerAge FROM MsCustomer) AS custAge)

--7
SELECT [Price] = (SandwichPrice + small.Smallest), SandwichName
FROM MsSandwich, (SELECT [Smallest] = MIN(SandwichPrice) FROM MsSandwich) AS Small
WHERE SandwichName LIKE '% %' AND SandwichID IN (SELECT SandwichID FROM DetailSalesTransaction GROUP BY SandwichID HAVING SUM(SandwichQuantitySold) BETWEEN 5 AND 25)

--8
SELECT StaffName, [Staff Salary] = 'Rp. ' + CAST(StaffSalary AS varchar), [Gender] = SUBSTRING(StaffGender,1,1)
FROM MsStaff ms, (SELECT [maleMin] = MIN(StaffSalary), [maleAVG] = AVG(StaffSalary) FROM MsStaff WHERE StaffGender LIKE 'Male') AS maleAVG
WHERE StaffSalary BETWEEN maleAVG.maleMin AND maleAVG.maleAVG

--9
CREATE VIEW Staff_Sales_Statistic
AS
SELECT StaffName, SandwichName, [Sales Count] = COUNT(dst.SalesID), [Sales Total] = SUM(SandwichQuantitySold)  
FROM MsStaff ms JOIN HeaderSalesTransaction hst ON hst.StaffID = ms.StaffID
	JOIN DetailSalesTransaction dst ON dst.SalesID = hst.SalesID
	JOIN MsSandwich msd ON msd.SandwichID = dst.SandwichID
WHERE SandwichName LIKE '% %'
GROUP BY StaffName, SandwichName
HAVING SUM(SandwichQuantitySold) > 1

--10
CREATE VIEW Vendor_Statistic
AS
SELECT VendorName, priceRange.[Price Range], [Minimum Item Purchase] = MIN(QuantityPurchase), [Maximum Item Purchased] = MAX(QuantityPurchase)
FROM MsVendor mv JOIN DetailPurchaseTransaction dpt ON dpt.VendorID = mv.VendorID
	JOIN MsIngredient mi ON mi.IngredientID = dpt.IngredientID, (SELECT [Price Range] = MAX(IngredientPrice) - MIN(IngredientPrice) FROM MsIngredient) AS priceRange
WHERE VendorAddress NOT LIKE '%Gold%' AND priceRange.[Price Range] > 0
GROUP BY VendorName, priceRange.[Price Range]
