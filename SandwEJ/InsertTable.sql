USE SandwEJ

-- MsChef
INSERT INTO MsChef VALUES('CH001', 'Yukihira Souma', 'Expert');
INSERT INTO MsChef VALUES('CH002', 'Nakiri Erina', 'Expert');
INSERT INTO MsChef VALUES('CH003', 'Tadakoro Megumi', 'Expert');
INSERT INTO MsChef VALUES('CH004', 'Gordon Ramsey', 'Expert');
INSERT INTO MsChef VALUES('CH005', 'Abad Symon', 'Advance');
INSERT INTO MsChef VALUES('CH006', 'Abate Keith', 'Advance');
INSERT INTO MsChef VALUES('CH007', 'Yoshi Tabo', 'Beginner');
INSERT INTO MsChef VALUES('CH008', 'Takase Eiji', 'Advance');
INSERT INTO MsChef VALUES('CH009', 'Trevor Tack', 'Beginner');
INSERT INTO MsChef VALUES('CH010', 'Zolivia Ang', 'Beginner');

-- MsIngredient
INSERT INTO MsIngredient VALUES('IG001', 'Egg', 9000);
INSERT INTO MsIngredient VALUES('IG002', 'Ham', 25000);
INSERT INTO MsIngredient VALUES('IG003', 'Bread', 5000);
INSERT INTO MsIngredient VALUES('IG004', 'Butter', 20000);
INSERT INTO MsIngredient VALUES('IG005', 'Tomato', 8000);
INSERT INTO MsIngredient VALUES('IG006', 'Cucumber', 2000);
INSERT INTO MsIngredient VALUES('IG007', 'Sausage', 20000);
INSERT INTO MsIngredient VALUES('IG008', 'Cheese', 21000);
INSERT INTO MsIngredient VALUES('IG009', 'Onion', 7000);
INSERT INTO MsIngredient VALUES('IG010', 'Chicken', 19000);

-- MsVendor
INSERT INTO MsVendor VALUES ('VE001', 'PT.Telor Telar', 'Jl. S. Wiryopranoto No. 37, Sawah Besar,Jakarta Barat Indonesia', '083870239357', 'telor.telar@yahoo.com');
INSERT INTO MsVendor VALUES ('VE002', 'Kanzler Company', 'Jl. Hayam Wuruk No. 100,Jakarta Barat', '081219550857', 'kanzler@gmail.com');
INSERT INTO MsVendor VALUES ('VE003', 'PT.Indofood Indonesia', 'Jl. Buaran Raya Blok D No. 1 Duren Sawit Jakarta Timur', '083870815121', 'corporate@indofood.com');
INSERT INTO MsVendor VALUES ('VE004', 'Purefood Company', 'Jl. Benda No. 20D, Kemang Jakarta Selatan', '085282470182', 'pure.food@gmail.com');
INSERT INTO MsVendor VALUES ('VE005', 'Freshqo Inc.', 'Jl. Alam Segar 3 No. 8, Pondok Indah Jakarta Selatan', '082347126017', 'fresh.qo@gmail.com');
INSERT INTO MsVendor VALUES ('VE006', 'GreenTribe Company', 'Jl. Kebon Jeruk Raya No. 44 Jakarta Barat. ', '082143233069', 'green.tribe@yahoo.com');
INSERT INTO MsVendor VALUES ('VE007', 'Tablewright Company', 'Jl. Raya Pasar Minggu Jakarta Selatan, Sebelah Makam Pahlawan Kalibata Jakarta Selatan', '085249693948', 'table.wright@yahoo.com');
INSERT INTO MsVendor VALUES ('VE008', 'Veg Gible Company', 'Jl. KH Asahari, Pinang Ciledug Tangerang', '082330508465', 'veggi.ble@gmail.com');
INSERT INTO MsVendor VALUES ('VE009', 'PT. Oni-on', 'Jl. Arya Putra, Kedaung Ciputat Tangerang', '089630309951', 'oni@gmail.com');
INSERT INTO MsVendor VALUES ('VE010', 'Gin Ful Inc.', 'Jl. Pulo Lentut Kav. II-E/4, Pulogadung,Jakarta Timur Indonesia', '085286237915', 'support@ginful.com');

-- MsSandwich
INSERT INTO MsSandwich VALUES ('SW001' ,'Club Sandwich' ,'Barbeque' ,80000);
INSERT INTO MsSandwich VALUES ('SW002' ,'Crab Cake Sandwich' ,'Mushroom' ,65000);
INSERT INTO MsSandwich VALUES ('SW003' ,'Ham Sandwich' ,'Black Pepper' ,50000);
INSERT INTO MsSandwich VALUES ('SW004' ,'Cudighi Sandwich' ,'Truffle' ,500000);
INSERT INTO MsSandwich VALUES ('SW005' ,'Cuban Sandwich' ,'Mustard' ,30000);
INSERT INTO MsSandwich VALUES ('SW006' ,'Clam Roll Sandwich' ,'Black Pepper' ,77000);
INSERT INTO MsSandwich VALUES ('SW007' ,'French Dip Sandwich' ,'Mushroom' ,98000);
INSERT INTO MsSandwich VALUES ('SW008' ,'Horseshoe Sandwich' ,'Cheese' ,69000);
INSERT INTO MsSandwich VALUES ('SW009' ,'Italian Sandwich' ,'Barbeque' ,43000);
INSERT INTO MsSandwich VALUES ('SW010' ,'Pilgrim Sandwich' ,'Cranberry' ,88000);

-- MsStaff
INSERT INTO MsStaff VALUES ('ST001' ,'Raymond Wood' ,'Male' ,3000000, '089694938291');
INSERT INTO MsStaff VALUES ('ST002' ,'Deangelo Valentine' ,'Male' ,2000000, '085327333861 ');
INSERT INTO MsStaff VALUES ('ST003' ,'Marco Coffey' ,'Male' ,3300000, '085399275281');
INSERT INTO MsStaff VALUES ('ST004' ,'Yareli Nelson' ,'Male' ,3800000, '085240233277');
INSERT INTO MsStaff VALUES ('ST005' ,'Tyrese Ewing' ,'Female' ,3090000, '085399074249');
INSERT INTO MsStaff VALUES ('ST006' ,'Helena Martinez' ,'Female' ,4000000, '085329804377');
INSERT INTO MsStaff VALUES ('ST007' ,'Cloe Franklin' ,'Male' ,3100000, '021-6888367');
INSERT INTO MsStaff VALUES ('ST008' ,'Justice Olson' ,'Male' ,3700000, '085213200303');
INSERT INTO MsStaff VALUES ('ST009' ,'Tory Downs' ,'Female' ,3400000, '085696228417');
INSERT INTO MsStaff VALUES ('ST010' ,'Joaquin Boone' ,'Female' ,3120000, '085813221927');

-- MsCustomer
INSERT INTO MsCustomer VALUES ('CS001', 'Claudia Moran', 'Female', '1971-10-12', '085257344607');
INSERT INTO MsCustomer VALUES ('CS002', 'Bill Berry', 'Male', '1974-12-02', '082113720777');
INSERT INTO MsCustomer VALUES ('CS003', 'Herman Page', 'Male', '1979-11-28', '089755327567');
INSERT INTO MsCustomer VALUES ('CS004', 'Bryant Farmer', 'Male', '1980-01-11', '085397243555');
INSERT INTO MsCustomer VALUES ('CS005', 'Edwin Butler', 'Male', '1980-03-03', '085776422447');
INSERT INTO MsCustomer VALUES ('CS006', 'Gene Garrett', 'Female', '1981-01-24', '081219550857');
INSERT INTO MsCustomer VALUES ('CS007', 'Lisa Munoz', 'Female', '1984-04-01', '085213931566');
INSERT INTO MsCustomer VALUES ('CS008', 'Travis Foster', 'Male', '1989-02-11', '082190730146');
INSERT INTO MsCustomer VALUES ('CS009', 'Randal Andrews', 'Male', '1993-04-27', '081219550857');
INSERT INTO MsCustomer VALUES ('CS010', 'Phil Simpson', 'Male', '1996-02-21', '085338534457');

-- HeaderPurchaseTransaction
INSERT INTO HeaderPurchaseTransaction VALUES ('PH001', '2019-01-29', 'ST001');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH002', '2019-03-07', 'ST002');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH003', '2019-03-28', 'ST003');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH004', '2019-04-04', 'ST004');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH005', '2019-04-07', 'ST001');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH006', '2019-04-18', 'ST002');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH007', '2019-04-28', 'ST005');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH008', '2019-05-24', 'ST007');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH009', '2019-06-30', 'ST009');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH010', '2019-07-06', 'ST010');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH011', '2019-08-10', 'ST002');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH012', '2019-08-29', 'ST003');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH013', '2019-11-07', 'ST008');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH014', '2019-12-23', 'ST006');
INSERT INTO HeaderPurchaseTransaction VALUES ('PH015', '2020-01-02', 'ST005');

-- HeaderSalesTransaction
INSERT INTO HeaderSalesTransaction VALUES ('SH001', '2019-03-22', 'ST001', 'CH001', 'CS010');
INSERT INTO HeaderSalesTransaction VALUES ('SH002', '2019-04-06', 'ST002', 'CH002', 'CS009');
INSERT INTO HeaderSalesTransaction VALUES ('SH003', '2019-05-08', 'ST003', 'CH003', 'CS008');
INSERT INTO HeaderSalesTransaction VALUES ('SH004', '2019-05-22', 'ST004', 'CH004', 'CS007');
INSERT INTO HeaderSalesTransaction VALUES ('SH005', '2019-06-15', 'ST005', 'CH005', 'CS006');
INSERT INTO HeaderSalesTransaction VALUES ('SH006', '2019-06-16', 'ST001', 'CH006', 'CS005');
INSERT INTO HeaderSalesTransaction VALUES ('SH007', '2019-06-26', 'ST002', 'CH007', 'CS004');
INSERT INTO HeaderSalesTransaction VALUES ('SH008', '2019-07-17', 'ST003', 'CH008', 'CS003');
INSERT INTO HeaderSalesTransaction VALUES ('SH009', '2019-08-17', 'ST010', 'CH009', 'CS002');
INSERT INTO HeaderSalesTransaction VALUES ('SH010', '2019-09-05', 'ST009', 'CH010', 'CS001');
INSERT INTO HeaderSalesTransaction VALUES ('SH011', '2019-09-13', 'ST008', 'CH001', 'CS010');
INSERT INTO HeaderSalesTransaction VALUES ('SH012', '2019-11-18', 'ST007', 'CH002', 'CS009');
INSERT INTO HeaderSalesTransaction VALUES ('SH013', '2019-12-22', 'ST006', 'CH003', 'CS008');
INSERT INTO HeaderSalesTransaction VALUES ('SH014', '2019-12-29', 'ST005', 'CH004', 'CS007');
INSERT INTO HeaderSalesTransaction VALUES ('SH015', '2020-01-01', 'ST004', 'CH005', 'CS006');

-- DetailPurchaseTransaction
INSERT INTO DetailPurchaseTransaction VALUES ('PH001', 2, 'IG001', 'VE001');
INSERT INTO DetailPurchaseTransaction VALUES ('PH001', 3, 'IG002', 'VE004');
INSERT INTO DetailPurchaseTransaction VALUES ('PH001', 4, 'IG003', 'VE005');
INSERT INTO DetailPurchaseTransaction VALUES ('PH001', 5, 'IG004', 'VE006');
INSERT INTO DetailPurchaseTransaction VALUES ('PH001', 1, 'IG005', 'VE007');
INSERT INTO DetailPurchaseTransaction VALUES ('PH002', 2, 'IG006', 'VE002');
INSERT INTO DetailPurchaseTransaction VALUES ('PH002', 2, 'IG007', 'VE003');
INSERT INTO DetailPurchaseTransaction VALUES ('PH002', 2, 'IG008', 'VE008');
INSERT INTO DetailPurchaseTransaction VALUES ('PH002', 4, 'IG009', 'VE009');
INSERT INTO DetailPurchaseTransaction VALUES ('PH003', 7, 'IG010', 'VE010');
INSERT INTO DetailPurchaseTransaction VALUES ('PH003', 7, 'IG010', 'VE001');
INSERT INTO DetailPurchaseTransaction VALUES ('PH004', 10, 'IG009', 'VE010');
INSERT INTO DetailPurchaseTransaction VALUES ('PH004', 2, 'IG008', 'VE002');
INSERT INTO DetailPurchaseTransaction VALUES ('PH005', 8, 'IG007', 'VE003');
INSERT INTO DetailPurchaseTransaction VALUES ('PH005', 2, 'IG006', 'VE004');
INSERT INTO DetailPurchaseTransaction VALUES ('PH006', 9, 'IG005', 'VE007');
INSERT INTO DetailPurchaseTransaction VALUES ('PH006', 8, 'IG004', 'VE008');
INSERT INTO DetailPurchaseTransaction VALUES ('PH007', 2, 'IG003', 'VE009');
INSERT INTO DetailPurchaseTransaction VALUES ('PH007', 3, 'IG002', 'VE005');
INSERT INTO DetailPurchaseTransaction VALUES ('PH008', 4, 'IG001', 'VE010');
INSERT INTO DetailPurchaseTransaction VALUES ('PH008', 6, 'IG003', 'VE004');
INSERT INTO DetailPurchaseTransaction VALUES ('PH009', 7, 'IG003', 'VE002');
INSERT INTO DetailPurchaseTransaction VALUES ('PH009', 9, 'IG003', 'VE001');
INSERT INTO DetailPurchaseTransaction VALUES ('PH010', 1, 'IG004', 'VE008');
INSERT INTO DetailPurchaseTransaction VALUES ('PH010', 2, 'IG005', 'VE009');

-- DetailSalesTransaction
INSERT INTO DetailSalesTransaction VALUES ('SH001', 2, 'SW001');
INSERT INTO DetailSalesTransaction VALUES ('SH001', 3, 'SW001');
INSERT INTO DetailSalesTransaction VALUES ('SH002', 4, 'SW002');
INSERT INTO DetailSalesTransaction VALUES ('SH002', 1, 'SW002');
INSERT INTO DetailSalesTransaction VALUES ('SH003', 6, 'SW003');
INSERT INTO DetailSalesTransaction VALUES ('SH003', 7, 'SW003');
INSERT INTO DetailSalesTransaction VALUES ('SH004', 8, 'SW004');
INSERT INTO DetailSalesTransaction VALUES ('SH004', 10, 'SW004');
INSERT INTO DetailSalesTransaction VALUES ('SH005', 22, 'SW005');
INSERT INTO DetailSalesTransaction VALUES ('SH005', 1, 'SW005');
INSERT INTO DetailSalesTransaction VALUES ('SH006', 3, 'SW006');
INSERT INTO DetailSalesTransaction VALUES ('SH006', 6, 'SW006');
INSERT INTO DetailSalesTransaction VALUES ('SH007', 9, 'SW007');
INSERT INTO DetailSalesTransaction VALUES ('SH007', 1, 'SW007');
INSERT INTO DetailSalesTransaction VALUES ('SH008', 8, 'SW008');
INSERT INTO DetailSalesTransaction VALUES ('SH008', 9, 'SW008');
INSERT INTO DetailSalesTransaction VALUES ('SH009', 3, 'SW009');
INSERT INTO DetailSalesTransaction VALUES ('SH010', 12, 'SW009');
INSERT INTO DetailSalesTransaction VALUES ('SH010', 11, 'SW010');
INSERT INTO DetailSalesTransaction VALUES ('SH011', 8, 'SW010');
INSERT INTO DetailSalesTransaction VALUES ('SH012', 3, 'SW001');
INSERT INTO DetailSalesTransaction VALUES ('SH013', 11, 'SW002');
INSERT INTO DetailSalesTransaction VALUES ('SH014', 1, 'SW003');
INSERT INTO DetailSalesTransaction VALUES ('SH014', 2, 'SW003');
INSERT INTO DetailSalesTransaction VALUES ('SH015', 7, 'SW004');
