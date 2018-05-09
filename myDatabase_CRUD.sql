create database mydb;

use mydb;

-- import table custormers.sql vao database mydb

select * from customers;

-- Hiển thị một số trường dữ liệu trong bảng customers như mã khách hàng (customernumber), họ (contactlastname), tên (contactfirstname), số điện thoại (phone), thành phố (city):
select customernumber, contactlastname, contactfirstname, phone, city 
from customers;

-- Hiển thị mã khách hàng, tên, họ, số điện thoại của tất cả khách hàng có tên là Peter và sống ở thành phố Melbourne:
select customernumber, contactlastname, contactfirstname, phone, city 
from customers 
where contactfirstname = 'Peter' and city = 'Melbourne';

-- Hiển thị thông tin khách hàng có tên chứa ký tự a/A:
select customernumber, contactlastname, contactfirstname, phone, city 
from customers 
where contactfirstname like '%A%';

-- Hiển thị thông tin các khách hàng có mã trong khoảng từ 103 đến 125:
select customernumber, contactlastname, contactfirstname, phone, city 
from customers 
where customernumber between 103 and 125;

-- Hiển thị thông tin các khách hàng sống ở USA, France, Spain:
select customernumber, contactlastname, contactfirstname, phone, city 
from customers 
where city in ('USA', 'France', 'Spain') ;

-- Hiển thị mã khách hàng, tên, họ, số điện thoại, quốc gia của các khách hàng sống tại quốc gia USA hoặc France:
select customernumber, contactlastname, contactfirstname, phone, city 
from customers 
where country = 'USA' or country = 'France';

-- Hiển thị tất cả các khách hàng theo thứ tự từ a – z của tên:
select customernumber, contactlastname, contactfirstname, phone, city 
from customers 
order by contactfirstname asc ;

-- Hiển thị 10 khách hàng đầu tiên theo thứ tự từ z – a của tên:
select customernumber, contactlastname, contactfirstname, phone, city 
from customers 
order by contactfirstname desc limit 10 ;

-- Đếm xem có bao nhiêu khách hàng sống ở France:
select count(country) as 'Số khách hàng số ở France' 
from customers 
where city = 'France' ;

--  Chèn khách hàng mới có mã 500, tên công ty: AgileLead, tên: Lan, họ: Trần, điện thoại: 0978822683, địa chỉ 1: Hàm Nghi, thành phố: Hà Nội, quốc gia: Việt Nam.
insert into customers (customernumber, customername, contactfirstname, contactlastname, phone, addressline1, city, country) 
values (500, 'AgileLead', 'Lan', 'Trần', '0978822683', 'Hàm Nghi', 'Hà Nội', 'Việt Nam' );

-- Cập nhập lại trường customername thành Baane Mini Imports cho  khách hàng có mã là 103:
update customers 
set customername = 'Baane Mini Imports'
where customernumber = 103;

-- Xóa các khách hàng sống ở thành phố Nantes:
delete from customers
where city = 'Nantes' ;


