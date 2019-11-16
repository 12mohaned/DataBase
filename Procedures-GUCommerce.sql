create procedure customerRegister 
@username varchar(20),
@first_name varchar(20),
@last_name varchar(20) ,
@password varchar(20),
@email varchar(50)
AS 
insert into Users(username,ﬁrst_name,last_name,password,email)
Values(@username,@first_name,@last_name,@password,@email)
insert into Customer(username)
Values(@username)
create procedure vendorRegister 
@username varchar(20), 
@first_name varchar(20) ,
@last_name varchar(20), 
@password varchar(20),
@email varchar(50), 
@company_name varchar(20),
@bank_acc_no varchar(20)
AS
insert into Users(username,ﬁrst_name,last_name,password,email)
Values(@username,@first_name,@last_name,@password,@email)
insert into Vendor(username,company_name,bank_acc_no)
Values(@username, @company_name,@bank_acc_no)

create procedure addMobile 
@username varchar(20),
@mobile_number Varchar(20) 
AS
insert into User_Mobile_Numbers(mobile_number,username)
values(@mobile_number,@username)

create procedure addAdress
@username varchar(20),
@address Varchar(100) 
AS
insert into User_Addresses(address,username)
values(@address,@username)

Create Procedure showProducts 
        AS
        Select * from Product;


Create PROCEDURE showProductsbyPrice
        AS
        SELECT * FROM Product order by price ASC


Create procedure searchbyname 
        @text VARCHAR(20)
        AS
        SELECT * FROM Product WHERE product_name = @text

Create procedure AddQuestion 
        @serial int,
        @customer VARCHAR(20),
        @question VARCHAR(50)
        AS
        Insert into Customer_Question_Product (serial_no, customer_name, question) VALUES(@serial, @customer, @question)


Create procedure addToCart 
        @customername VARCHAR(20),
        @serial int 
        AS
        insert into CustomerAddstoCartProduct (serial_no, customer_name) VALUES (@serial, @customername)


Create procedure removefromCart 
        @customername VARCHAR(20),
        @serial int 
        AS
        Delete FROM CustomerAddstoCartProduct  WHERE serial_no = @serial and customer_name = @customername


create procedure createWishlist 
        @customername VARCHAR(20),
        @name VARCHAR(20)
        AS
        insert into Wishlist (username, name) Values (@customername, @name)


Create procedure AddtoWishlist 
        @customername VARCHAR(20),
        @wishlistname VARCHAR(20),
        @serial int
        As 
        Insert into Wishlist_Product (username, wish_name, serial_no) Values (@customername, @wishlistname, @serial)


Create procedure removefromWishlist
        @customername VARCHAR(20),
        @wishlistname VARCHAR(20),
        @serial int
        As 
        Delete from Wishlist_Product Where username = @customername and wish_name = @wishlistname and serial_no =  @serial


Create procedure showWishlistProduct
        @customername VARCHAR(20),
        @name VARCHAR(20)
        AS
        SELECT Product.product_description from Product  join Wishlist_Product ON Product.serial_no = Wishlist_Product.serial_no
		where username = @customername and wish_name = @name 
		/* show list should show the product description not the wish list * info*/


Create procedure viewMyCart
        @customer VARCHAR(20)
        As 
        SELECT Product.serial_no, product_name, category, product_description, final_price, color From CustomerAddstoCartProduct Join Product 
                on  CustomerAddstoCartProduct.serial_no = Product.serial_no where customer_name = @customer 


Create procedure calculatepriceOrder 
  @customername VARCHAR(20),
  @sum decimal(10,2) OUTPUT
  AS
  SELECT Sum(price)From Product Join CustomerAddstoCartProduct on  CustomerAddstoCartProduct.serial_no = Product.serial_no and Product.customer_username = CustomerAddstoCartProduct.customer_name  WHERE customer_name = @customername 
/* some one needs to double check on the meaning behind it  Page 3 j) */

create procedure productsinorder 
@customername varchar(20),
@orderID int
AS
select * from CustomerAddstoCartProduct where customer_name = @customername 
Update Product set customer_order_id = @orderID, customer_username = @customername 

create procedure emptyCart 
        @customername VARCHAR(20)
        AS
        DELETE from CustomerAddstoCartProduct where customer_name = @customername

create procedure makeOrder 
@customername varchar(20)
AS
insert into Orders(customer_name)
Values(@customername)
set @orderid = (select order_no from Orders where customer_name = @customername)
EXEC productsinorder @customername = @customername, @orderID = @orderid
EXEC emptyCart @customername = @customername


create procedure cancelOrder 
@orderid int 
AS
delete from Orders where order_no = @orderid and order_status != 'not processed' or order_status != 'in process'