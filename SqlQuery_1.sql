create table Users(
    username varchar(20) primary key, 
    ﬁrst_name varchar(20),
    last_name varchar(20),
    password varchar(20),
    email varchar(50)
)
 create table User_Mobile_Numbers(
    mobile_number int ,
    username varchar(20) , 
    foreign key (username) references Users(username),
    primary key(mobile_number, username)

)
 create table User_Addresses(
    address varchar(50) ,
    username varchar(20), 
    foreign key (username)  references Users (username),
    primary key(address, username)
)

create table Customer(
   username varchar(20) primary key, 
   points int,
   foreign key (username)  references Users (username)
)
create table Admins(
   username varchar(20) primary key, 
   foreign key (username)  references Users (username)
)

create table Vendor(
   activated bit,
   company_name varchar(20) ,
   bank_acc_no int,
   admin_username varchar(20),
   username varchar(20) primary key, 
   foreign key (username)  references Users (username),
   foreign key (admin_username)  references Admins (username)
)

create table Delivery_Person(
   username varchar(20) primary key , 
   is_activated bit,
   foreign key (username)  references Users (username)
)

create table Credit_Card(
   number int primary key ,
   expiry_date date,
   cvv_code  varchar(20)
)

create table Delivery(
   id  int primary key identity(1,1), 
   time_duration date, 
   fees float,
   username varchar(20),
   foreign key (username)  references Admins(username)
)
create table Orders(
   order_no int primary key identity(1,1),
   order_date date, 
   total_amount float, 
   cash_amount float, 
   credit_amount float,
   payment_type varchar(20),
   order_status varchar(20),
   remaining_days float, 
   time_limit timestamp,
   Gift_Card_code_used int,
   customer_name varchar(20),
   delivery_id int, 
   creditCard_number int ,
   foreign key (customer_name)  references Customer (username),
   foreign key (delivery_id)  references Delivery (id),
   foreign key (creditCard_number) references Credit_Card (number),
   foreign key (Gift_Card_code_used) references Giftcard (code)
   /* Code is the one who reference the GiftCard not Username*/
)

create table Product (
    serial_no varchar(20) primary key, 
    product_name varchar(20), 
    category varchar(20), 
    product_description varchar(100), 
    final_price float, 
    color varchar(20),
    available bit, 
    rate float, 
    vendor_username varchar(20), 
    customer_username varchar(20),
    customer_order_id int,
    FOREIGN KEY (vendor_username) references Vendor(username),
    FOREIGN KEY (customer_user) references customer(username),
    FOREIGN KEY (customer_order_id) references Orders(order_no)
)
 
create table CustomerAddstoCartProduct(
    serial_no int ,
    customer_name varchar(20),
    primary key (serial_no, customer_name),
    FOREIGN KEY (serial_no) references Product(serial_no),
    FOREIGN KEY (customer_name) references Customer(username)
)
create table Todays_Deals(
    deal_id int,
    deal_amount float, 
    expiry_date date,
    admin_username varchar(20),
    primary key (deal_id,deal_amount),
    FOREIGN KEY (admin_username) references Admins(username)
)

CREATE TABLE Todays_Deals_Product(​
    deal_id int, 
    serial_no​ varchar(20), 
    issue_date DATE ,
    PRIMARY KEY (deal_id, serial_no),
    foreign KEY (deal_id) References Todays_Deals (deal_id) ,
    FOREIGN KEY (serial_no) References Product (serial_no)
)


create table offer(
    offer_id int ,
    offer_amount float, 
    expiry_date date
    primary key (offer_id)
)

create table offersOnProduct (
    offer_id int    ,
    serial_no VARCHAR(20), 
    PRIMARY KEY (offer_id, serial_no),
    FOREIGN KEY (offer_id) REFERENCES offer (offer_id),
    FOREIGN KEY (serial_no) REFERENCES Product (serial_no)
)

create TABLE Customer_Question_Product (
/* serial_no can't be number it has be in compatible with Product(serial_no) which is the varchar)*/
    serial_no varchar(20) ,
    customer_name VARCHAR(20) ,
    question VARCHAR(150) ,
    answer VARCHAR (150),
    PRIMARY KEY (serial_no , customer_name) ,
    FOREIGN KEY (serial_no) REFERENCES Product (serial_no) ,
    FOREIGN KEY (customer_name) REFERENCES Customer (username)
)

CREATE TABLE Wishlist (
    username VARCHAR(20) ,
    name VARCHAR(20) ,
    PRIMARY KEY (username, name) ,
    FOREIGN KEY (username) REFERENCES Customer (username)
)

Create Table Giftcard (
    code int ,
    expiry_date date ,
    amount float,
    username VARCHAR(20),
    PRIMARY KEY (code) ,
    FOREIGN KEY (username) REFERENCES Customer (username)
)

CREATE TABLE Wishlist_Product (
/* username and wish_name both references username, name*/
    username VARCHAR(20),
    wish_name VARCHAR(20),
    serial_no VARCHAR(20),
    PRIMARY KEY (username, wish_name, serial_no),
    FOREIGN KEY (username) REFERENCES Wishlist(username,name),
    FOREIGN KEY (wish_name) REFERENCES Wishlist(name),
    FOREIGN KEY (serial_no) REFERENCES Product (serial_no)
)
create table Admin_Customer_Giftcard(
    code int,
    customer_name varchar(20),
    admin_username varchar(20),
    remaining_points int,
    PRIMARY KEY (code, customer_name, admin_username) ,
    FOREIGN KEY (code) REFERENCES Giftcard (code) ,
    FOREIGN KEY (customer_name) REFERENCES Customer (username) ,
    FOREIGN KEY (admin_username) REFERENCES Admins (username)
)
Create TABLE Admin_Delivery_Order (
    delivery_username VARCHAR(20), 
    order_no​ int , 
    admin_username VARCHAR(20), 
    delivery_window TIMESTAMP,
    PRIMARY KEY (delivery_username, order_no​) ,
    FOREIGN KEY (delivery_username) REFERENCES Delivery_Person (username),
    FOREIGN KEY (order_no) REFERENCES Orders(order_no),
    FOREIGN KEY (admin_username) REFERENCES Admins (username)
)

CREATE TABLE Customer_CreditCard (
    ​customer_name varchar(20), 
    cc_number​ int ,
    PRIMARY KEY (customer_name, cc_number​) ,
    FOREIGN KEY (​customer_name) REFERENCES Customer (username) ,
    FOREIGN KEY (cc_number​) REFERENCES Credit_Card (number)
)