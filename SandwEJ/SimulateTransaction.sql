
-- PURCHASE
BEGIN TRAN

	INSERT INTO HeaderPurchaseTransaction VALUES ('PH016',GETDATE(),'ST001');

	INSERT INTO DetailPurchaseTransaction VALUES ('PH016', 6, 'IG006', 'VE001');
	INSERT INTO DetailPurchaseTransaction VALUES ('PH016', 2, 'IG010', 'VE001');
	INSERT INTO DetailPurchaseTransaction VALUES ('PH016', 4, 'IG007', 'VE001');

	SELECT * FROM HeaderPurchaseTransaction
	SELECT * FROM DetailPurchaseTransaction
-- commit
COMMIT

-- roll back
ROLLBACK

-- SALES
BEGIN TRAN
	
	INSERT INTO HeaderSalesTransaction VALUES ('SH016', GETDATE(), 'ST007', 'CH004', 'CS005');

	INSERT INTO DetailSalesTransaction VALUES ('SH016', 2, 'SW002');
	INSERT INTO DetailSalesTransaction VALUES ('SH016', 8, 'SW007');
	INSERT INTO DetailSalesTransaction VALUES ('SH016', 4, 'SW009');

	SELECT * FROM HeaderSalesTransaction
	SELECT * FROM DetailSalesTransaction

-- commit
COMMIT

-- roll back
ROLLBACK