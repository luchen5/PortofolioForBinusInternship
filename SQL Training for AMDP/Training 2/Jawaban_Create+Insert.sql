use JDShop

/* Soal 1 */
select top 2 *
from MsProduct
order by Price desc

/* Soal 2 */
select *
from TrShop
where right(IDShop,1) = 'Y'
order by owner desc

/* Soal 3 */
Create View vw_CreditCardDoneTransaction
as
	select * from TrTransaction 
	where Done = 1 and PaymentMethod = 'Credit Card'

select * from vw_CreditCardDoneTransaction

/* Soal 4 */
select [Owner Name] = REPLACE(Owner,Substring(Owner,1,CHARINDEX(' ',Owner,1)-1),IDShop)
from TrShop
where isOfficial = 1

/* Soal 5 */
select IDProduct, Name, Stock, 
[Price] =  'Rp. ' + CAST(Price as VARCHAR)
from MsProduct
where Stock >50

/* Soal 6 */
select	distinct a.IDShop, 
		[Name] = a.Name + CASE WHEN isOfficial = 1 Then
		' (Official)' else ' (Non-Official)' END
		,Owner,Address
from TrShop a
JOIN MsProduct b
on a.IDShop = b.IDShop
where b.Price > 1000000

/* Soal 7 */
select IDTransaction, IDProduct, IDCustomer,
[Transaction Date]=CONVERT(VARCHAR,TransactionDate,106), Qty, TotalPrice,PaymentMethod
from TrTransaction
where DATENAME(Month, TransactionDate) In ('September','November') 

/* Soal 8 */