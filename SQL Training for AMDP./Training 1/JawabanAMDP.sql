--1.	Tampilkan top 2 dariEmployeeID, EmployeeName, Gender dimana Gender adalah 'F' 
--		(top, like)

SELECT TOP 2 EmployeeID , EmployeeName , Gender FROM MsEmployee
WHERE Gender LIKE 'F'


--2. 	Tampilkan tabel MsEmployee dimana digit terakhir dari Phone adalah kelipatan 5 dan 
--		salary lebih besar dari 4000000

SELECT * FROM MsEmployee
WHERE Salary > 4000000 AND RIGHT(Phone,1) % 5 = 0


--3.	Buatlah view dengan nama view_1 lalu tampilkan tabel MsMusicIns dimana price
--antara 5000000 dan 10000000, dengan MusicIns diawali dengan kata Yamaha.
--Tampilkan view tersebut dan buat syntax untuk menghapus view tersebut
--(create view, between, like) 

CREATE VIEW view_1 AS
SELECT * FROM MsMusicIns
WHERE Price BETWEEN 5000000 AND 10000000 AND MusicIns LIKE 'Yamaha%'

SELECT * FROM view_1

--4.	Tampilkan BranchEmployee ( didapat dari employeename dan nama depan employeename diganti dengan branchID )
--dimana employeename memiliki minimal 3 kata. (replace, substring, charindex, like)

SELECT [BranchEmployee] = REPLACE(EmployeeName,SUBSTRING(EmployeeName,0,CHARINDEX(' ',EmployeeName,0)),BranchID) FROM MsEmployee 
WHERE EmployeeName LIKE '% % %'


--5.	Tampilkan Brand (didapat dari kata pertama MusicIns), Price (didapat dari price ditambahkan kata 'Rp. ' didepannya),
--Stock, Instrument Type(didapat dari MusicInsType) (substring,charindex,cast)

SELECT [Brand] = SUBSTRING(MusicIns,0,CHARINDEX(' ',MusicIns,0)) , [Price] = 'Rp. ' + CAST(Price AS VARCHAR) , Stock , MusicInsType
FROM MsMusicIns a
JOIN MsMusicInsType b ON a.MusicInsTypeID = b.MusicInsTypeID


--6.	Tampilkan EmployeeName, Employee Gender(didapat dari gender), Tanggal dengan format dd mm yyyy,
--CustomerName dimana Gender merupakan 'Male' dan EmployeeName memiliki 2 kata atau lebih.
--(convert, join, like, order by)


SELECT EmployeeName , [EmployeeGender] = CASE WHEN Gender = 'M' THEN 'Male' ELSE 'Female' END ,
[TransactionDate] = CONVERT(VARCHAR,TransactionDate,106) , CustomerName FROM MsEmployee a
JOIN HeaderTransaction b ON a.EmployeeID = b.EmployeeID
WHERE EmployeeName LIKE '% %' AND Gender LIKE 'M'
ORDER BY EmployeeName


--7.	Tampilkan EmployeeID, EmployeeName, DateofBirth dengan format dd mm yyyy, CustomerName, Transactiondate dimana
--DateOfBirth adalah bulan ‘December’ dan TransactionDate adalah tanggal 16. (convert, join, datename, month, day) 

SELECT a.EmployeeID , EmployeeName , [DateOfBirth] = CONVERT(VARCHAR,DateOfBirth,106) , CustomerName , [TransactionDate] = CONVERT(VARCHAR,TransactionDate,106)  FROM MsEmployee a
JOIN HeaderTransaction b ON a.EmployeeID = b.EmployeeID
WHERE DATENAME(MONTH, DateOfBirth) LIKE 'December' AND DATENAME(DAY,TransactionDate) LIKE 16


--8.	Tampilkan BranchName,EmployeeName dimana transaksi terjadi bulan Oktober dan Qty lebih dari sama dengan 5.
--(exists, in, datename, month) 

SELECT BranchName , EmployeeName FROM MsEmployee a
JOIN MsBranch b ON a.BranchID = b.BranchID
WHERE EXISTS(
	SELECT * FROM HeaderTransaction x
	JOIN DetailTransaction y ON x.TransactionID = y.TransactionID
	WHERE DATENAME(MONTH, TransactionDate) IN ('October') AND Qty >= 5
	AND a.EmployeeID = x.EmployeeID
)


--9.	Buatlah store procedure untuk fungsi search dengan nama search yang menampilkan EmployeeName,
--Address, Phone, Gender. Fungsi ini akan mencari ke seluruh kolom sesuai inputan. (create procedure, like)


CREATE PROC search
@input VARCHAR(MAX) = ''
AS
BEGIN
		SELECT EmployeeName , Address , Phone , Gender FROM MsEmployee
		WHERE EmployeeName LIKE '%' + @input +'%' OR
		Address LIKE '%' + @input + '%' OR
		Phone LIKE '%' + @input + '%' OR
		Gender LIKE '%' + @input + '%'
END


--10.	Buatlah Stored Procedure dengan nama “Check_Transaction” yang menampilkan data CustomerName,
--EmployeeName, BranchName, MusicIns, Price berdasarkan TransactionID yang diinput.

CREATE PROC Check_Transaction
@input VARCHAR(MAX) = ''
AS
BEGIN
	SELECT CustomerName , EmployeeName , BranchName , MusicIns , Price FROM HeaderTransaction a
	JOIN MsEmployee b ON a.EmployeeID = b.EmployeeID
	JOIN MsBranch c ON b.BranchID = c.BranchID
	JOIN DetailTransaction d ON a.TransactionID = d.TransactionID
	JOIN MsMusicIns e ON d.MusicInsID = e.MusicInsID
	WHERE a.TransactionID LIKE @input
END



--11.	Tampilkan data yang menunjukan detail jumlah transaksi musicins per employee

SELECT [JumlahTransaksi] = COUNT(a.TransactionID) , EmployeeName FROM HeaderTransaction a
JOIN DetailTransaction b ON a.TransactionID = b.TransactionID
JOIN MsEmployee c ON a.EmployeeID = c.EmployeeID
GROUP BY EmployeeName


--12.	Buatlah Stored Procedure dengan nama "Add_Stock_MusicIns" untuk menambah stock MusicIns.
--Jika stock yang diinput lebih kecil atau sama dengan 0, maka akan dimunculkan pesan
--"Stok yang di input harus lebih besar dari 0"

CREATE PROC Add_Stock_MusicIns
@inputID VARCHAR(MAX),
@inputStock int
AS
BEGIN
	IF(EXISTS(SELECT * FROM MsMusicIns WHERE MusicInsID = @inputID))
	BEGIN
		IF(@inputStock <= 0)
		BEGIN
			PRINT('Stok yang di input harus lebih besar dari 0')
		END

		ELSE
		BEGIN
			UPDATE MsMusicIns
			SET Stock = Stock + @inputStock
			WHERE MusicInsID LIKE @inputID
		END
	END
	
	ELSE
	BEGIN
		PRINT('Data tidak ditemukan / Kode yang dimasukan salah')
	END
END


--13.	Buatlah Store Procedure dengan nama "Check_Music_Code" yang digunakan untuk menampilkan informasi
--dari kode yang dimasukan. Kode yang dimasukan berupa MusicInsID atau MusicInsTypeID, 
--jika kode yang dimasukan tidak terdaftar atau salah maka akan ditampilkan pesan "Data tidak ditemukan / Kode yang dimasukan salah"
--( Gunakan dynamic query agar lebih mudah )


CREATE PROC Check_Music_Code
@input VARCHAR(MAX) = ''
AS
DECLARE
@Table VARCHAR(MAX),
@Where VARCHAR(MAX),
@Query VARCHAR(MAX)
BEGIN
	IF(EXISTS(SELECT * FROM MsMusicIns a
	JOIN MsMusicInsType b ON a.MusicInsTypeID = b.MusicInsTypeID
	WHERE a.MusicInsID LIKE @input OR b.MusicInsTypeID LIKE @input ))
		BEGIN
		IF(@input LIKE 'MI%')
			BEGIN
				SET @Table = 'MsMusicIns'
				SET @Where = 'MusicInsID'
			END
		
		ELSE
			BEGIN
				SET @Table = 'MsMusicInsType'
				SET @Where = 'MusicInsTypeID'
			END
		
		SET @Query = 'SELECT * FROM ' + @Table + ' WHERE ' + @Where + ' LIKE ''' + @input + ''''

		EXEC(@Query)

		END
	ELSE
		BEGIN
			PRINT('Data tidak ditemukan / Kode yang dimasukan salah')
		END
END


--14.	Buatlah Stored Procedure dengan nama “Check_Sale” untuk melihat MusicInsType
--apa saja yang terjual pada bulan tertentu beserta jumlah yang terjualnya.

CREATE PROC Check_Sale
@input VARCHAR(MAX) = ''
AS
BEGIN
	SELECT MusicInsType , [Qty] = SUM(Qty)
	FROM MsMusicInsType a
	JOIN MsMusicIns b ON a.MusicInsTypeID = b.MusicInsTypeID
	JOIN DetailTransaction c ON b.MusicInsID = c.MusicInsID
	JOIN HeaderTransaction d ON c.TransactionID = d.TransactionID
	WHERE DATENAME(MONTH, TransactionDate) LIKE @input
	GROUP BY MusicInsType	
END


--15.	Buatlah Stored Procedured dengan nama “Check_Employee”
--yang berfungsi untuk memberikan informasi employeename, address, phone,
--DateOfBirth, dan BranchName berdasarkan TransactionID. Jika TransactionID
--tidak dimasukan, maka akan dimunculkan semua data employee yang ada.


CREATE PROC Check_Employee
@input VARCHAR(MAX) = ''
AS
BEGIN
	IF(@input NOT LIKE '')
			
			BEGIN
				SELECT EmployeeName , a.Address , a.Phone , [DateOfBirth] = CONVERT(VARCHAR,DateOfBirth,106) , BranchName FROM MsEmployee a
				JOIN MsBranch b ON a.BranchID = b.BranchID
				JOIN HeaderTransaction c ON a.EmployeeID = c.EmployeeID
				WHERE TransactionID = @input
			END
	ELSE
		BEGIN
			SELECT EmployeeName , a.Address , a.Phone , [DateOfBirth] = CONVERT(VARCHAR,DateOfBirth,106) , BranchName FROM MsEmployee a
			JOIN MsBranch b ON a.BranchID = b.BranchID
		END
END
