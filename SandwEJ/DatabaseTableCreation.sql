CREATE DATABASE SandwEJ
USE SandwEJ

CREATE TABLE MsStaff(
	StaffID CHAR(5) PRIMARY KEY,
	StaffName VARCHAR(MAX) NOT NULL,
	StaffGender VARCHAR(6) NOT NULL,
	StaffSalary INT NOT NULL,
	StaffPhoneNumber VARCHAR(15) NOT NULL,

	CONSTRAINT sIdCheck CHECK(StaffId LIKE 'ST[0-9][0-9][0-9]'),
)

CREATE TABLE MsChef(
	ChefID CHAR(5) PRIMARY KEY,
	ChefName VARCHAR(MAX) NOT NULL,
	ChefExp VARCHAR(11) NOT NULL,

	CONSTRAINT cIdCheck CHECK(ChefId LIKE 'CH[0-9][0-9][0-9]'),
	CONSTRAINT cXpCheck CHECK(ChefExp IN ('Beginner','Advance','Expert'))
)

CREATE TABLE MsCustomer(
	CustomerID CHAR(5) PRIMARY KEY,
	CustomerName VARCHAR(MAX) NOT NULL,
	CustomerGender VARCHAR(6) NOT NULL,
	CustomerDateOfBirth DATE NOT NULL,
	CustomerPhoneNumber CHAR(12) NOT NULL,

	CONSTRAINT genderCheck CHECK (CustomerGender IN ('Male','Female')),
	CONSTRAINT custPhoneCheck CHECK (LEN(CustomerPhoneNumber) = 12)
)

CREATE TABLE MsVendor(
	VendorID CHAR(5) PRIMARY KEY,
	VendorName VARCHAR(MAX) NOT NULL,
	VendorAddress VARCHAR(MAX) NOT NULL,
	VendorPhoneNumber VARCHAR(15) NOT NULL,
	VendorEmail VARCHAR(MAX) NOT NULL,

	CONSTRAINT vIdCheck CHECK(VendorId LIKE 'VE[0-9][0-9][0-9]'),
	CONSTRAINT vEmailCheck CHECK(VendorEmail LIKE '[^@]%@[^.com]%.com')
)

CREATE TABLE MsIngredient(
	IngredientID CHAR(5) PRIMARY KEY,
	IngredientName VARCHAR(MAX) NOT NULL,
	IngredientPrice INT NOT NULL,

	CONSTRAINT iIdCheck CHECK(IngredientId LIKE 'IG[0-9][0-9][0-9]')
)

CREATE TABLE MsSandwich(
	SandwichID CHAR(5) PRIMARY KEY,
	SandwichName VARCHAR(MAX) NOT NULL,
	SandwichSauce VARCHAR(MAX) NOT NULL,
	SandwichPrice INT NOT NULL,

	CONSTRAINT swIdCheck CHECK(SandwichId LIKE 'SW[0-9][0-9][0-9]'),
	CONSTRAINT sPrice CHECK(SandwichPrice BETWEEN 5000 AND 500000)
)

CREATE TABLE HeaderSalesTransaction(
	SalesID CHAR(5) PRIMARY KEY,
	TransactionDate DATE NOT NULL,
	StaffID CHAR(5) REFERENCES MsStaff(StaffID),
	ChefID CHAR(5) REFERENCES MsChef(ChefID),
	CustomerID CHAR(5) REFERENCES MsCustomer (CustomerID),
	

	CONSTRAINT saIdCheck CHECK(SalesId LIKE 'SH[0-9][0-9][0-9]'),
	CONSTRAINT sDate CHECK (DATEDIFF(day,TransactionDate,GETDATE()) >= 0) 
)

CREATE TABLE DetailSalesTransaction( --CHECK THIS AGAIN
	SalesID CHAR(5),
	SandwichQuantitySold INT NOT NULL,
	SandwichID CHAR(5) REFERENCES MsSandwich (SandwichID),
	
	FOREIGN KEY (SalesID) REFERENCES HeaderSalesTransaction(SalesID)
)	

CREATE TABLE HeaderPurchaseTransaction(
	PurchaseID CHAR(5) PRIMARY KEY,
	TransactionDate DATE NOT NULL,
	StaffID CHAR(5) REFERENCES MsStaff(StaffID),

	
	CONSTRAINT pIdCheck CHECK(PurchaseId LIKE 'PH[0-9][0-9][0-9]'),
	CONSTRAINT pDate CHECK (DATEDIFF(day,TransactionDate,GETDATE()) >= 0) 
)

CREATE TABLE DetailPurchaseTransaction(
	PurchaseID CHAR(5),
	QuantityPurchase INT NOT NULL,
	IngredientID CHAR(5) REFERENCES MsIngredient(IngredientID),
	VendorID CHAR(5) REFERENCES MsVendor(VendorID),

	FOREIGN KEY (PurchaseID) REFERENCES HeaderPurchaseTransaction(PurchaseID)
)


DROP TABLE DetailPurchaseTransaction
DROP TABLE DetailSalesTransaction
DROP TABLE HeaderPurchaseTransaction
DROP TABLE HeaderSalesTransaction
DROP TABLE MsChef
DROP TABLE MsCustomer
DROP TABLE MsIngredient
DROP TABLE MsStaff
DROP TABLE MsVendor
DROP TABLE MsSandwich

