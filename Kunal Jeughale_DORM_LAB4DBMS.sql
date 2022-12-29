# Kunal Jeughale Lab 4 MySQL
create database ECOM_website;
CREATE TABLE IF NOT EXISTS supplier (
    supp_id INT NOT NULL,
    supp_name VARCHAR(50) NOT NULL,
    supp_city VARCHAR(50) NOT NULL,
    supp_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (supp_id)
);
CREATE TABLE IF NOT EXISTS customer(
  cus_id int not null,
  cus_name varchar(50) not null,
  cus_phone varchar(50) not null,
  cus_city varchar(50) not null,
  cus_gender char,
  PRIMARY KEY (cus_id)
);

CREATE TABLE IF NOT EXISTS category(
  cat_id int not null,
  cat_name varchar(50) not null,
  PRIMARY KEY (cat_id)
);

CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT NOT NULL,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    PRIMARY KEY (PRO_ID),
    FOREIGN KEY (CAT_ID)
        REFERENCES category (CAT_ID)
);
CREATE TABLE IF NOT EXISTS supplier_pricing(
  PRICING_ID int not null,
  PRO_ID  int,
  SUPP_ID int,
  SUPP_PRICE int default 0,
  PRIMARY KEY (PRICING_ID),
  FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);
CREATE TABLE IF NOT EXISTS orders(
  ORD_ID int not null,
  ORD_AMOUNT  int not null,
  ORD_DATE date not null,
  CUS_ID int,
  PRICING_ID int,
  PRIMARY KEY (ORD_ID),
  FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
  FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating(
  RAT_ID int not null,
  ORD_ID  int,
  RAT_RATSTARS int not null,
  PRIMARY KEY (RAT_ID),
  FOREIGN KEY (ORD_ID) REFERENCES orders (ORD_ID)
);

insert into supplier values(1,'Rajesh Retails','Delhi','1234567890');
insert into supplier values(2,'Appario Ltd.','Mumbai','2589631470');
insert into supplier values(3,'Knome products','Banglore','9785462315');
insert into supplier values(4,'Bansal Retails','Kochi','8975463285');
insert into supplier values(5,'Mittal Ltd.','Lucknow','7898456532');

insert into customer values(1,'AAKASH','9999999999','DELHI', 'M');
insert into customer values(2,'AMAN','9785463215','NOIDA','M');
insert into customer values(3,'NEHA','9999999999','MUMBAI', 'F');
insert into customer values(4,'MEGHA','9994562399','KOLKATA', 'F');
insert into customer values(5,'PULKIT','7895999999','LUCKNOW','M');

insert into category values(1,'BOOKS');
insert into category values(2,'GAMES');
insert into category values(3,'GROCERIES');
insert into category values(4,'ELECTRONICS');
insert into category values(5,'CLOTHES');

insert into product values(1,'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into product values(2,'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
insert into product values(3,'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
insert into product values(4,'OATS', 'Highly Nutritious from Nestle',3);
insert into product values(5,'HARRY POTTER', 'Best Collection of all time by J.K Rowling',1);
insert into product values(6,'MILK', '1L Toned MIlk', 3);
insert into product values(7,'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
insert into product values(8,'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into product values(9,'Project IGI','compatible with windows 7 and above', 2);
insert into product values(10,'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into product values(11,'Rich Dad Poor Dad', 'Written by RObert Kiyosaki',1);
insert into product values(12,'Train Your Brain', 'By Shireen Stephen',1);

insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5, 4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);

insert into orders values(101,1500, '2021-10-06', 2, 1);
insert into orders values(102,1000, '2021-10-12', 3, 5);
insert into orders values(103,30000, '2021-09-16', 5, 2);
insert into orders values(104,1500, '2021-10-05', 1, 1);
insert into orders values(105,3000, '2021-08-16', 4, 3);
insert into orders values(106,1450, '2021-08-18', 1, 9);
insert into orders values(107,789, '2021-09-01',  3, 7);
insert into orders values(108,	780, '2021-09-07',	5, 6);
insert into orders values(109, 3000, '2021-09-10',	5, 3);
insert into orders values(110, 2500, '2021-09-10',	2, 4);
insert into orders values(111, 1000, '2021-09-15',	4, 5);
insert into orders values(112, 789, '2021-09-16',	4, 7);
insert into orders values(113, 31000, '2021-09-16',1, 8);
insert into orders values(114, 1000, '2021-09-16',	3, 5);
insert into orders values(115, 3000, '2021-09-16',	5, 3);
insert into orders values(116, 99, '2021-09-17', 2, 14);

insert into rating values(1, 101, 4);
insert into rating values(2, 102, 3);
insert into rating values(3, 103, 1);
insert into rating values(4, 104, 2);
insert into rating values(5, 105, 4);
insert into rating values(6, 106, 3);
insert into rating values(7, 107, 4);
insert into rating values(8, 108,	4);
insert into rating values(9, 109, 3);
insert into rating values(10, 110, 5);
insert into rating values(11, 111, 3);
insert into rating values(12, 112, 4);
insert into rating values(13, 113, 2);
insert into rating values(14, 114, 1);
insert into rating values(15, 115, 1);
insert into rating values(16, 116, 0);

# Q3
SELECT COUNT(cust.cus_id) AS total_customer, cust.cus_gender
FROM orders odr
INNER JOIN customer cust ON odr.cus_id = cust.cus_id
WHERE odr.ORD_AMOUNT >= 3000 GROUP BY cust.cus_gender;

# Q4
SELECT odr.*, p.PRO_NAME
FROM orders odr INNER JOIN SUPPLIER_PRICING sp ON sp.PRICING_ID = odr.PRICING_ID
INNER JOIN product p ON p.PRO_ID = sp.PRO_ID WHERE odr.cus_id = 2;

# Q5
select s.* from supplier s inner join SUPPLIER_PRICING sp on s.SUPP_ID = sp.SUPP_ID 
group by sp.SUPP_ID having count(sp.PRICING_ID) > 1;

# Q6
select c.CAT_ID as 'category id', c.cat_name as 'cat_name', p.pro_name as 'product name', spo.SUPP_PRICE 
from product p inner join category c on c.cat_id= p.cat_id 
inner join SUPPLIER_PRICING spo on spo.pro_id= p.pro_id 
inner join (select min(SUPP_PRICE) as SUPP_PRICE, CAT_ID from product p 
inner join SUPPLIER_PRICING sp  on sp.pro_id = p.pro_id
group by CAT_ID) as temp on p.CAT_ID = temp.CAT_ID 
and spo.SUPP_PRICE = temp.SUPP_PRICE ;

# Q7
select p.pro_id, pro_name from orders odr inner join SUPPLIER_PRICING sp on sp.PRICING_ID = odr.PRICING_ID 
inner join product p on p.pro_id = sp.pro_id where odr.ORD_DATE > '2021-10-05';

# Q8
select cus_name, cus_gender from customer where cus_name like 'A%' or cus_name like '%A';

# Q9
DELIMITER //
CREATE PROCEDURE displayProductRating()
BEGIN
select odr.ORD_ID as 'order id' , s.supp_id as 'supplier id', s.supp_name as 'supplier id', r.RAT_RATSTARS as rating, 
case 
when r.RAT_RATSTARS = 5 then 'Excellent Service' when r.RAT_RATSTARS >4
then 'Good Service'  when r.RAT_RATSTARS >2 then 'Average Service' else 'Poor Service' end Type_of_Service
from orders odr inner join supplier_pricing sp on sp.pricing_ID = odr.pricing_ID inner join supplier s on sp.SUPP_ID = s.SUPP_ID 
inner join rating r on r.ORD_ID = odr.ORD_ID;
END //
DELIMITER ; 

call displayProductRating()
