create table Users(
username varchar(20) primary key,
pass_word  varchar(20),
first_name varchar(20),
last_name varchar(20),
email varchar(50)
)

create table User_mobile_numbers(
mobile_number int,
username varchar(20),
primary key(mobile_number,username),
foreign key(username) references Users on delete cascade on update cascade
)

create table User_Addresses(
user_address varchar(20),
username varchar(20),
primary key(user_address, username),
foreign key(username) references Users on delete cascade on update cascade
)

create table Customer(
username varchar(20),
points int default 0,
primary key(username),
foreign key(username) references Users on delete cascade on update cascade
)

create table Admins(
username varchar(20),
primary key(username),
foreign key(username) references Users on delete cascade on update cascade
)

create table Vendor(
username varchar(20),
activated bit,
company_name varchar(20),
bank_acc_no  varchar(20),
admin_username varchar(20),
primary key(username),
foreign key(username) references Users on delete no action on update no action,
foreign key(admin_username) references Admins on delete no action on update no action
)

create table Delivery_Person(
username varchar(20),
is_active bit,
primary key(username),
foreign key(username) references Users on delete cascade on update cascade
)

create table Credit_Card(
number varchar(20) primary key ,
exp_date datetime,
cvc_code varchar(4)
)

create table Delivery(
id int primary key identity,
del_tybe varchar(20),
time_duration int,
fees decimal(5,3),
username varchar(20),
foreign key(username) references Admins on delete cascade on update cascade
)

create table GiftCard(
code varchar(10) primary key,
exp_date datetime,
amount int,
username varchar(20),
foreign key(username) references Admins on delete cascade on update cascade
)

Create table Orders (
order_no int primary key identity,
order_date datetime, 
total_amount decimal(10,2),
cash_amount decimal(10,2), 
creadit_amount decimal(10,2),
payment_type varchar(20),
order_status varchar(20),
remaining_days int,
time_limit datetime,
gift_card_code varchar(10),
customer_name varchar(20),
delivery_id int,
credit_card_number varchar(20),
foreign key(gift_card_code) references GiftCard ,
foreign key(credit_card_number) references Credit_Card ,
foreign key(delivery_id) references Delivery ,
foreign key(customer_name) references Customer 
)

create table Product(
serial_no int primary key identity,
product_name varchar(20),
category varchar(20),
product_description text, 
price decimal(10,2),
final_price decimal(10,2),
color varchar(20),
available bit,
rate int,
vendor_username varchar(20),
customer_username varchar(20),
customer_order_id int,
foreign key(vendor_username) references Vendor,
foreign key(customer_order_id) references Orders,
foreign key(customer_username) references Customer
)

create table CustomerAddstoCartProduct(
serial_no int,
customer_name varchar(20),
primary key(serial_no, customer_name),
foreign key(serial_no) references Product,
foreign key(customer_name) references Customer
)

create table Todays_Deals(
deal_id int primary key identity,
deal_amount int,
exp_date datetime,
admin_username varchar(20),
foreign key(admin_username) references Admins
)

create table Todays_Deals_Product(
deal_id int,
serial_no int,
primary key(deal_id, serial_no),
foreign key(deal_id) references Todays_Deals,
foreign key(serial_no) references Product
)

create table offer(
offer_id int primary key identity,
offer_amount int,
exp_date datetime
)

create table offersOnProduct(
offer_id int,
serial_no int,
primary key(offer_id, serial_no),
foreign key(offer_id) references offer,
foreign key(serial_no) references Product
)

create table Customer_Question_Product(
serial_no int,
customer_name varchar(20),
question varchar(50),
answer text,
primary key(serial_no, customer_name),
foreign key(serial_no) references Product,
foreign key(customer_name) references Customer
)

create table Wishlist(
username varchar(20),
wish_name varchar(20),
primary key(username, wish_name),
foreign key(username) references Customer
)

create table Wishlist_Product(
username varchar(20),
wish_name varchar(20),
serial_no int,
primary key(username, wish_name, serial_no),
foreign key(username,wish_name) references Wishlist
)

create table Admin_Customer_Giftcard(
code varchar(10),
customer_name varchar(20),
admin_username varchar(20),
remaining_points int default 0,
primary key(code,customer_name,admin_username),
foreign key(code) references GiftCard,
foreign key(customer_name) references Customer,
foreign key(admin_username) references Admins
)

create table Admin_Delivery_Order(
delivery_username varchar(20),
order_no int,
admin_username varchar(20),
delivery_window varchar(50),
primary key(delivery_username, order_no),
foreign key(delivery_username) references Delivery_Person,
foreign key(order_no) references Orders,
foreign key(admin_username) references admins
)

create table Customer_CreditCard(
customer_name varchar(20),
cc_number varchar(20),
primary key(customer_name, cc_number),
foreign key(customer_name) references Customer,
foreign key(cc_number) references  Credit_Card
)



-----proceduers 

go
create PROC customerRegister
@username varchar(20),
@firstname varchar(20),
@lastname varchar(20),
@password varchar(20),
@email varchar(50),
@success int output
as
if(exists (select * from users where @username=username))
begin 
set @success =1
end
else begin
insert into users(username,pass_word,first_name,last_name,email)
values (@username,@password,@firstname,@lastname,@email)
insert into  customer(username,points)
values (@username,0)
set @success =0
end
go




go
create PROC vendorRegister
@username varchar(20),
@firstname varchar(20),
@lastname varchar(20),
@password varchar(20),
@email varchar(50),
@company_name varchar(20),
@bank_acc_no varchar(20),
@success int output
as
if(exists (select * from users where username =@username))
begin 
set @success =1
end
else
begin
insert into users(username,pass_word,first_name,last_name,email)
values (@username,@password,@firstname,@lastname,@email)
insert into  vendor(username,activated,company_name,bank_acc_no)
values (@username,0,@company_name,@bank_acc_no)
set @success =0
end
go



go
create PROC userLogin
@username varchar(20),
@password varchar(20),
@type INT OUTPUT ,
@success BIT OUTPUt
as

if(EXISTS (select * 
from customer c inner join users u on c.username =u.username
where @username=c.username and @password=u.pass_word ))
begin
set @type =0
set @success =1
end

else if(EXISTS (select * 
from vendor v inner join users u on v.username =u.username
where @username=v.username and @password=u.pass_word ))
begin
set @type =1
set @success =1
end

else if(EXISTS (select * 
from admins a inner join users u on a.username =u.username
where @username=a.username and @password=u.pass_word ))
begin
set @type =2
set @success =1
end

else if(EXISTS (select * 
from Delivery_Person d inner join users u on d.username =u.username
where @username=d.username and @password=u.pass_word))
begin
set @type =3
set @success =1
end

else
begin
set @success =0
set @type =-1
end
go



go
create PROC addMobile
@username varchar(20),
@mobile_number varchar(20),
@success int output
as
if(exists(select * from  User_mobile_numbers where @mobile_number=mobile_number and @username=username ))
begin
set @success=1
end
else
begin
set @success=0
insert into User_mobile_numbers values (@mobile_number,@username)
end
go

go
create PROC  addAddress
@username varchar(20),
@address varchar(20)
as
insert into User_Addresses values(@address,@username)
go


go
create PROC  showProducts
as
select *
from product
go


go
create PROC ShowProductsbyPrice
as
select *
from product
order by price
go


go
create PROC searchbyname
@text varchar(20)
AS
select *
from Product
where @text=product_name
go

go
create PROC AddQuestion
@serial int,
@customer varchar(20),
@Question varchar(50)
AS
insert into Customer_Question_Product(serial_no,customer_name,question)
values(@serial,@customer,@Question)
go


go
create PROC addToCart
@serial int,
@customer_name varchar(20),
@success int output
AS
if(exists(select p.*
from product p
where p.serial_no=@serial))
begin
if(exists(select *
from CustomerAddstoCartProduct
where serial_no=@serial and @customer_name=customer_name))
begin
set @success=1
end
else
begin
insert into CustomerAddstoCartProduct(serial_no,customer_name)
values(@serial,@customer_name)
set @success=0
end
end
go


go
create PROC removefromCart
@serial int,
@customer_name varchar(20),
@success int output
AS
if(exists(select *
from CustomerAddstoCartProduct
where serial_no=@serial and @customer_name=customer_name))
begin
set @success=0
delete 
from CustomerAddstoCartProduct
where @serial=serial_no AND @customer_name=customer_name
end
else
begin
set @success=1
end
go

go
create PROC  createWishlist
@customer_name varchar(20), 
@name varchar(20),
@success int output
AS
if(exists (select * from  Wishlist where @customer_name=username and wish_name=@name))
begin
set @success=1
end
else
begin
insert into Wishlist(username,wish_name)
values(@customer_name,@name)
set @success =0
end
go


go
create PROC AddtoWishlist
@serial int,
@customer_name varchar(20),
@wishlistname varchar(20),
@success int output
AS
if(exists(select * from Wishlist_Product where @serial=serial_no and @customer_name=username and @wishlistname=wish_name))
begin
set @success =1
end
else
begin
insert into Wishlist_Product(username,wish_name,serial_no)
values(@customer_name,@wishlistname,@serial)
set @success =0
end
go

go
create PROC removefromWishlist
@serial int,
@customer_name varchar(20),
@wishlistname varchar(20),
@success int output
AS
if(exists(select * from Wishlist_Product where @serial=serial_no and @customer_name=username and @wishlistname=wish_name))
begin
delete 
from Wishlist_Product
where @serial=serial_no and username=@customer_name and @wishlistname=wish_name
set @success =0
end
else
begin
set @success =1
end
go

go
create PROC showWishlistProduct
@customer_name varchar(20),
@wishlistname varchar(20)
AS
select p.*
from Product p inner join Wishlist_Product wp on p.serial_no=wp.serial_no
where wp.username=@customer_name and wp.wish_name=@wishlistname
go


go
create PROC viewMyCart
@customer_name varchar(20)
AS
select p.*
from Product p inner join CustomerAddstoCartProduct ca on p.serial_no=ca.serial_no
where ca.customer_name=@customer_name
go



go
create PROC calculatepriceOrder
@customer_name varchar(20),
@sum decimal(10,2) output
AS
select @sum=sum(p.final_price)
from Product p inner join CustomerAddstoCartProduct ca on p.serial_no=ca.serial_no
where ca.customer_name=@customer_name
go


go
create PROC productsinorder
@customer_name varchar(20),
@orderID int
AS
select p.*
from Product p inner join CustomerAddstoCartProduct ca on p.serial_no=ca.serial_no
where ca.customer_name=@customer_name

update product 
set customer_username=@customer_name ,customer_order_id=@orderID , available=0
where serial_no IN
(
select ca1.serial_no
from CustomerAddstoCartProduct ca1
where ca1.customer_name=@customer_name
)

delete 
from CustomerAddstoCartProduct
where @customer_name<>customer_name  and serial_no IN
(
select ca1.serial_no
from CustomerAddstoCartProduct ca1
where ca1.customer_name=@customer_name
)
go




go
create PROC emptyCart
@customer_name varchar(20)
AS
delete 
from CustomerAddstoCartProduct
where @customer_name=customer_name
exec viewMyCart @customer_name
go

go
create PROC makeOrder
@customer_name varchar(20),
@total decimal(10,2)  output,
@id int  output
AS 
exec calculatepriceOrder @customer_name , @total output
insert into Orders(order_date,total_amount,order_status,customer_name)
values (CURRENT_TIMESTAMP,@total,'not processed',@customer_name)
select @id=max(order_no)
from orders
exec  productsinorder @customer_name , @id
exec emptyCart @customer_name
go

go 
create proc Viewmyorders_no
@customername varchar(20)
as 
select *
from orders 
where @customername=customer_name
go

go
CREATE PROC cancelOrder
@orderid INT,
@success int output
AS
if(not exists (select *from orders where @orderid=order_no))
begin 
set @success=1
end
else
begin
set @success=0
DECLARE @C VARCHAR(20)
DECLARE @T DATETIME
DECLARE @V INT
DECLARE @X VARCHAR(20)
DECLARE @CASH DECIMAL(10,2)
DECLARE @CREDIT DECIMAL(10,2)
DECLARE @PRICE INT
SELECT @X = order_status
FROM Orders
WHERE @orderid =order_no

IF(@X IN ('not processed','in process'))
BEGIN
SELECT @C= gift_card_code
FROM Orders
WHERE order_no= @orderid
IF(EXISTS(SELECT *
FROM GiftCard
WHERE @C= code))
BEGIN
SELECT @T = exp_date
FROM GiftCard
WHERE  code = @C
IF(@T > CURRENT_TIMESTAMP)
BEGIN
SELECT @CASH = cash_amount ,@CREDIT = creadit_amount , @PRICE =total_amount
FROM  Orders
WHERE order_no  = @orderid
IF(@CASH=0)
BEGIN
UPDATE Admin_Customer_Giftcard
SET remaining_points = remaining_points+ (@PRICE - @CREDIT)
UPDATE Customer 
SET points=points+(@PRICE - @CREDIT)
END
ELSE
BEGIN
UPDATE Admin_Customer_Giftcard
SET remaining_points = remaining_points+ (@PRICE - @CASH)
UPDATE Customer 
SET points=points+(@PRICE - @CASH)
END
END
END
UPDATE Product
SET customer_username = NULL ,customer_order_id = NULL,rate = NULL
WHERE customer_order_id =  @orderid 
DELETE 
FROM Orders
WHERE order_no=@orderid
END
end
GO

go
CREATE PROC ShowproductsIbought
@customername varchar(20)
AS
SELECT*
FROM Product
WHERE customer_username = @customername 
GO

go
CREATE PROC rate
@serialno INT,
@rate INT,
@customername varchar(20)
AS
UPDATE Product
SET rate = @rate
WHERE customer_username = @customername  AND serial_no =@serialno
GO

go
CREATE PROC AddCreditCard
@cc varchar(20),
@ex  dATE,
@cvv varchar(4),
@username varchar(20),
@success int output
AS
if(exists (select * from Credit_Card where @cc=number))
begin
set @success =1
end
else
begin
INSERT INTO Credit_Card VALUES(@cc,@ex,@cvv)
INSERT INTO Customer_CreditCard VALUES (@username,@cc)
set @success =0
end
GO

select *
from Credit_Card


go
CREATE PROC  vewDeliveryTypes
AS
SELECT distinct del_tybe,time_duration,fees
FROM Delivery
GO
 
 go
 CREATE PROC specifydeliverytype
 @orderID INT,
 @deliveryID INT
 AS
 DECLARE @P INT
 
 SELECT @P = time_duration 
 FROM Delivery
 WHERE id = @deliveryID
 UPDATE Orders
 SET remaining_days =@P , delivery_id = @deliveryID
 WHERE order_no = @orderID
 GO

 go
 CREATE PROC SpecifyAmount
 @customername VARCHAR(20),
 @ORDERID INT,
 @CASH DECIMAL(10,2),
 @CREDIT DECIMAL(10,2)
 AS
 UPDATE Orders
 SET cash_amount = @CASH , creadit_amount = @CREDIT 
 WHERE order_no = @ORDERID
 
 DECLARE @X INT
 DECLARE @Y INT

 SELECT @X = POINTS
 FROM Customer 
 WHERE username = @customername
 
 SELECT @Y = total_amount
 FROM Orders
 WHERE order_no =@ORDERID

 IF(@X>0)
 BEGIN
  IF(@CASH=0)
  BEGIN 
 UPDATE Admin_Customer_Giftcard
 SET remaining_points = remaining_points - (@Y-@CREDIT)
 WHERE customer_name = @customername
 UPDATE Customer
 SET points=points- (@Y-@CREDIT)
 WHERE username =  @customername
 END
  ELSE
  BEGIN
  UPDATE Admin_Customer_Giftcard
 SET remaining_points = remaining_points - (@Y-@CASH)
 WHERE customer_name = @customername 
 UPDATE Customer
 SET points=points- (@Y-@CASH)
 WHERE username = @customername
 END
 END
GO


go
CREATE PROC ChooseCreditCard
@creditcard VARCHAR(20),
@ORDERID INT
AS

IF(EXISTS (SELECT * 
FROM Credit_Card
WHERE number = @creditcard))
BEGIN
UPDATE Orders
SET credit_card_number = @creditcard
WHERE order_no = @ORDERID
END
GO

go
CREATE PROC returnProduct
@serialno INT,
@orderid INT
AS
DECLARE @C1 INT
DECLARE @C2 INT
DECLARE @T INT
DECLARE @NAME VARCHAR(20)

UPDATE Orders
SET total_amount = 0
WHERE order_no = @orderid
UPDATE Product
SET customer_username = NULL ,customer_order_id = NULL,rate = NULL
WHERE customer_order_id = @orderid

SELECT @C1 = cash_amount , @C2= creadit_amount, @T=total_amount
FROM Orders
WHERE order_no =@orderid

IF(@C1 <>  @T AND @C2 <>@T)
BEGIN
IF(@C1=0)
  BEGIN 
 UPDATE Admin_Customer_Giftcard
 SET remaining_points = remaining_points - (@T-@C2)
 WHERE customer_name = @NAME
 UPDATE Customer
 SET points=points- (@T-@C2)
 WHERE username = @NAME
 END
  ELSE
  BEGIN
  UPDATE Admin_Customer_Giftcard
 SET remaining_points = remaining_points - (@T-@C1)
 WHERE customer_name = @NAME
 UPDATE Customer
 SET points=points- (@T-@C1)
 WHERE username =  @NAME
 END
END
GO

go
CREATE PROC trackRemainingDays
@orderid INT,
@customername VARCHAR(20)
AS
DECLARE @DAYS INT
DECLARE @DAYS2 INT
DECLARE @DATE DATETIME 
SELECT @DATE = order_date , @DAYS2 = remaining_days
FROM Orders
WHERE order_no =@orderid

SET @DAYS = @DAYS2-(DAY(CURRENT_TIMESTAMP)-DAY(@DATE))
UPDATE Orders
SET remaining_days =@DAYS2
WHERE order_no =@orderid
PRINT @DAYS
GO


go
create proc recommmend
@customername varchar(20)
as
select *
from product 
where serial_no
in(
select p.serial_no 
from  Product p 
where p.serial_no in (
select top 3 p1.serial_no
from Wishlist_Product wp inner join Product p1 on wp.serial_no=p1.serial_no
where p1.category in (select top 3 p2.category
from CustomerAddstoCartProduct ca inner join Product p2 on ca.serial_no=p2.serial_no
where ca.customer_name=@customername
group by p2.category
order BY count(*) DESC
)
group by p1.serial_no
order BY count(*) DESC
)
union all 
select p.serial_no
from  Product p 
where p.serial_no in (
select top 3 p1.serial_no
from Wishlist_Product wp inner join Product p1 on wp.serial_no=p1.serial_no
where wp.username in (select c.username
from CustomerAddstoCartProduct ca inner join Customer c on ca.customer_name=c.username
where ca.customer_name<>@customername and ca.serial_no in(
select ca2.serial_no
from CustomerAddstoCartProduct ca2
where ca2.customer_name=@customername
)
)
group by p1.serial_no
order BY count(*) DESC
)
)
go


go
CREATE PROC postProduct
@vendorUsername varchar(20),
@product_name varchar(20),                                                --DONE
@category varchar(20),
@product_description text,
@price decimal(10,2),
@color varchar(20),
@success int output
AS
if(exists(select * from Vendor where @vendorUsername=username and activated=1))
begin
set @success=0
INSERT INTO Product(product_name, category, product_description, price, color,vendor_username)
VALUES ( @product_name, @category, @product_description, @price, @color,@vendorUsername)
end
else
begin
set @success=1
end
go

go
CREATE PROC vendorviewProducts
@vendorname varchar(20),
@success int output
AS
if(exists (select * from Vendor where username=@vendorname))
begin
SELECT p.*
FROM Product p
WHERE p.vendor_username= @vendorname
set @success=0
end
else 
begin
set @success=1
end
go


GO
CREATE PROC EditProduct
@vendorname varchar(20),
@serialnumber int,
@product_name varchar(20),                                        --DONE
@category varchar(20),
@product_description text,
@price decimal(10,2),
@color varchar(20)
AS
if(@vendorname is not null)
begin
update Product
set vendor_username=@vendorname                        --DONE
WHERE serial_no=@serialnumber
end
if(@product_name is not null)
begin
update Product
set product_name=@product_name
WHERE serial_no=@serialnumber
end
if(@category is not null)
begin
update Product
set category=@category
WHERE serial_no=@serialnumber
end
if(@product_description is not null)
begin
update Product
set product_description=@product_description
WHERE serial_no=@serialnumber
end
if(@price is not null)
begin
update Product
set price=@price
WHERE serial_no=@serialnumber
end
if(@color is not null)
begin
update Product
set color=@color
WHERE serial_no=@serialnumber
end
go


GO
CREATE PROC        deleteProduct
@vendorname varchar(20),
@serialnumber int                                                --DONE
AS
DELETE FROM Product WHERE serial_no= @serialnumber AND vendor_username= @vendorname
go


go
CREATE PROC   viewQuestions
@vendorname varchar(20)
AS                                                                                                        --DONE
SELECT q.question
FROM Customer_Question_Product q
INNER JOIN Product p ON p.serial_no= q.serial_no
INNER JOIN Vendor v ON p.vendor_username= v.username
WHERE v.username= @vendorname
go


go
CREATE PROC answerQuestions
@vendorname varchar(20),
@serialno int,
@customername varchar(20),                                                        --DONE
@answer text
AS
UPDATE Customer_Question_Product
SET answer=@answer
WHERE serial_no=@serialno AND customer_name=@customername
GO

go
CREATE PROC addOffer
@offeramount int,
@expiry_date datetime                                                                --DONE
AS
INSERT INTO offer(offer_amount, exp_date)
VALUES (@offeramount, @expiry_date)
GO


go
CREATE PROC checkOfferonProduct
@serial int,
@activeoffer bit output                                                                --DONE
AS
IF(EXISTS(SELECT * FROM offersOnProduct WHERE serial_no= @serial))
BEGIN
SET @activeoffer= 1
END
ELSE
BEGIN
SET @activeoffer= 0
END
GO

select *
from offer

go
CREATE PROC checkandremoveExpiredoffer
@offerid int
AS
DECLARE @date date
select @date=exp_date from offer where offer_id=@offerid
if(@date < CURRENT_TIMESTAMP)
begin
delete offer where offer_id=@offerid
end
GO



go
CREATE PROC applyOffer
@vendorname varchar(20),                --VENDOR NAME OBSOLETE BECAUSE I USED SERIAL NO. TO ACCESS PRODUCT
@offerid int,
@serial int
AS                                                                        
DECLARE @temp bit=0
DECLARE @date datetime
EXECUTE checkOfferonProduct @serial, @temp          --CHECK FOR EXISTING OFFER
select @date=exp_date from offer where @offerid=offer_id
IF(@temp=0 and @date >=CURRENT_TIMESTAMP)
BEGIN
DECLARE @product_price int
SELECT @product_price= price FROM Product where        serial_no=@serial
DECLARE @offer_amount int 
SELECT @offer_amount= offer_amount FROM offer WHERE @offerid=offer_id
DECLARE @final_price int
SELECT @final_price= final_price FROM Product WHERE @serial=serial_no
insert into offersOnProduct values (@offerid,@serial)
UPDATE Product
SET final_price=@product_price - (@offer_amount*@product_price/100)             --OFFER AMOUNT IS IN PERCENTAGE
WHERE serial_no=@serial
END
else 
begin
print ('The product has an active offer')
end
GO 


go
CREATE PROC activateVendors
@admin_username varchar(20),
@vendor_username varchar(20),
@vendor_exists bit output,
@admin_exists bit output,
@vendor_activated bit output
AS
set @vendor_exists = 1
set @admin_exists = 1
set @vendor_activated = 0
if(not exists (select * from Admins where username = @admin_username))
begin
set @admin_exists = 0
end
if(not exists(select * from Vendor where username = @vendor_username))
begin
set @vendor_exists = 0
end
if(exists (select * from Vendor where username = @vendor_username and activated = 1))
begin
set @vendor_activated = 1
end
if(exists(select * from Admins where username = @admin_username))
begin
UPDATE Vendor
SET        activated=1,
admin_username=@admin_username
WHERE username=@vendor_username
end
GO

go
CREATE PROC inviteDeliveryPerson
@delivery_username varchar(20),
@delivery_email varchar(50)
AS
INSERT INTO Users(username, email)
VALUES(@delivery_username,@delivery_email)                --DONE
INSERT INTO Delivery_Person(username)
VALUES(@delivery_username)
GO

go
CREATE PROC reviewOrders                --DONE
AS
SELECT R.* FROM Orders R
GO

go
CREATE PROC updateOrderStatusInProcess                --DONE
@order_no int,
@order_no_exists bit output,
@already_in_process bit output
AS
set @order_no_exists = 1
set @already_in_process = 0
if(not exists(select * from Orders where order_no = @order_no))
begin
set @order_no_exists = 0
end
if(exists(select * from Orders where order_status = 'in progress'))
begin
set @already_in_process = 1
end
UPDATE Orders
SET order_status='in progress'
WHERE order_no= @order_no
go



create proc addDelivery
@delivery_type varchar(20),
@time_duration int,
@fees decimal(5,3),
@admin_username varchar(20)
as
insert into Delivery(del_tybe,time_duration,fees,username)
values(@delivery_type,@time_duration,@fees,@admin_username)
go

create proc assignOrdertoDelivery
@delivery_username varchar(20),
@order_no int,
@admin_username varchar(20)
as
insert into Admin_Delivery_Order(delivery_username,order_no,admin_username)
values(@delivery_username,@order_no,@admin_username)
go

go
create proc createTodaysDeal
@deal_amount int,
@admin_username varchar(20),
@expiry_date datetime,
@admin_exists bit output
as
set @admin_exists = 1
if(not exists(select * from Admins where username = @admin_username))
begin
set @admin_exists = 0
end
if(exists(select * from Admins where username = @admin_username))
begin
insert into Todays_Deals values(@deal_amount,@expiry_date,@admin_username)
end
go

go
create proc checkTodaysDealOnProduct
@serial_no int,
@active_deal bit output
as
 if(exists(select deal_id from Todays_Deals_Product where serial_no = @serial_no))
 begin
	set @active_deal = 1
end
else
begin
	set @active_deal = 0
end
go

select *
from Product

select *
from Todays_Deals

go
create proc addTodaysDealOnProduct
@deal_id int,
@serial_no int,
@deal_exists bit output,
@product_exists bit output,
@product_already_activated bit output
as
set @deal_exists = 1
set @product_exists = 1
set @product_already_activated = 0
if(not exists(select * from Todays_Deals where deal_id = @deal_id))
begin
set @deal_exists = 0
end
if(not exists(select * from Product where serial_no = @serial_no))
begin
set @product_exists = 0
end
if(exists(select * from Todays_Deals_Product where serial_no = @serial_no))
begin
set @product_already_activated = 1
end
if (exists(select * from Product where serial_no = @serial_no) and exists(select * from Todays_Deals where deal_id = @deal_id) and not exists(select * from Todays_Deals_Product where serial_no = @serial_no))
begin
declare @amount decimal(10,2)
select @amount = deal_amount
from Todays_Deals
where deal_id = @deal_id
insert into Todays_Deals_Product values(@deal_id,@serial_no)
update Product
set final_price = (1.00-@amount/100)*final_price
where serial_no = @serial_no
end
go

go
create proc removeExpiredDeal
@deal_id int,
@deal_exists bit output,
@deal_removed bit output
as
set @deal_exists = 1
set @deal_removed = 0
if(not exists(select * from Todays_Deals where deal_id = @deal_id))
begin
set @deal_exists = 0
end
declare @exp datetime
declare @serialNo int
select @exp = exp_date
from Todays_Deals
where deal_id = @deal_id
if(CURRENT_TIMESTAMP>=@exp and exists(select * from Todays_Deals where deal_id = @deal_id))
begin
	set @deal_removed = 1
	select @serialNo = serial_no
	from Todays_Deals_Product
	where deal_id = @deal_id
	delete from Todays_Deals_Product where deal_id = @deal_id
	delete from Todays_Deals where deal_id = @deal_id 
	update Product
	set final_price = price
	where serial_no = @serialNo
end
go


create proc createGiftCard
@code varchar(10),
@expiry_date datetime,
@amount int,
@admin_username varchar(20)
as
insert into GiftCard(code, exp_date,amount,username)
values(@code,@expiry_date,@amount,@admin_username)
go


create proc removeExpiredGiftCard
@code varchar(10)
as
declare @expDate datetime
declare @points int
select @expDate = exp_date,@points = amount
from GiftCard
where code = @code
if(@expDate<= CURRENT_TIMESTAMP)
begin
	update Customer 
	set points = points-@points
	where exists (select * from Admin_Customer_Giftcard where customer_name = username and code = @code)
	delete from Admin_Customer_Giftcard
	where code = @code
	delete from GiftCard
	where code = @code
end
go


create proc checkGiftCardOnCustomer
@code varchar(10),
@activeGiftCard bit output
as
if(exists(select * from Admin_Customer_Giftcard where code = @code))
begin
set @activeGiftCard = 1
end
else
begin
set @activeGiftCard = 0
end
go


create proc giveGiftCardToCustomer
@code varchar(10),
@customer_name varchar(20),
@admin_username varchar(20)
as
declare @points int
select @points = amount
from GiftCard
where code = @code
insert into Admin_Customer_Giftcard(code,customer_name,admin_username,remaining_points)
values(@code,@customer_name,@admin_username,@points)
update Customer
set points = points+@points
where username = @customer_name
go


create proc acceptAdminInvitation
@delivery_username varchar(20)
as
update Delivery_Person
set is_active = 1
where username = @delivery_username
go



create proc deliveryPersonUpdateInfo
@username varchar(20),
@first_name varchar(20),
@last_name varchar(20),
@password varchar(20),
@email varchar(50)
as
insert into Users(username,first_name,last_name,pass_word,email)
values(@username,@first_name,@last_name,@password,@email)
go


create proc viewmyorders
@delivery_person varchar(20)
as
select O.*
from Delivery_Person D inner join Admin_Delivery_Order ADM on D.username = ADM.delivery_username
	inner join Orders O on O.order_no = ADM.order_no
where D.username = @delivery_person
go



create proc specifyDeliveryWindow
@delivery_username varchar(20), 
@order_no int,
@delivery_window varchar(50)
as
update Admin_Delivery_Order
set delivery_window = @delivery_window
where delivery_username = @delivery_username and order_no = @order_no
go



create proc updateOrderStatusOutForDelivery
@order_no int
as
update Orders
set order_status = 'Out for delivery'
where order_no = @order_no
go


create proc updateOrderStatusDelivered
@order_no int
as
update Orders
set order_status = 'Delivered'
where order_no = @order_no
go








