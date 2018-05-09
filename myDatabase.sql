create database mydb;

use mydb;

create table customers (
	customerNumber int auto_increment,
    customerName varchar(30),
    contactLastName varchar(30),
    contactFirstName varchar(30),
    phone varchar(30),
    addressLine1 varchar(30),
    addressLine2 varchar(30),
    city varchar(30),
    state varchar(30),
    postalCode int,
    country varchar(30),
    salesRepEmployeeNumber int,
    creditLimit int,
	primary key(customerNumber)
);

create table productlines (
	productLine int auto_increment primary key,
    textDescription varchar(30),
    htmlDescription varchar(30),
    image varchar(30)
);

create table products (
	productCode int auto_increment primary key,
    productName varchar(30),
    productLine int,
    productScale varchar(30),
    productVendor varchar(30),
    productDescription varchar(30),
    quantityInStock varchar(30),
    buyPrice int
);

create table orders (
	orderNumber int auto_increment ,
    orderDate Date,
    requiredDate Date,
    shippedDate Date,
    state varchar(30),
    comments varchar(30),
	customerNumber int,
    primary key(orderNumber)
);

create table payments(
	checkNumber int auto_increment primary key,
    customerNumber int,
    paymentDate Date,
    amount varchar(30)
);

create table employees (
	employeeNumber int auto_increment primary key,
    lastName varchar(30),
	firstName varchar(30),
    extension varchar(30),
    email varchar(30),
    officeCode int,
    reportsTo int,
    jobTitle varchar (30)
);

create table offices (
	officeCode int auto_increment primary key,
    city varchar(30),
    phone varchar(30),
    addressLine1 varchar(30),
    addressLine2 varchar(30),
    state varchar(30),
    country varchar(30),
    postalCode int,
    territory varchar(30)
);


create table orderdetails (
	orderNumber int,
    productCode int,
    quantityOrdered varchar(30),
    priceEach int,
    orderLineNumber int
);

alter table customers
	add foreign key (salesRepEmployeeNumber) references employees(employeeNumber);

alter table products
	add constraint foreign key (productLine) references productlines(productLine);
    
alter table orders    
	add constraint foreign key (customerNumber) references customers(customerNumber);
    
alter table payments
	add constraint foreign key (customerNumber) references customers(customerNumber);
  
alter table employees
	add constraint foreign key (officeCode) references offices(officeCode),
    add constraint foreign key (reportsTo) references employees(employeeNumber);
 
alter table orderdetails
	add constraint foreign key(orderNumber) references orders(orderNumber),
    add constraint foreign key(productCode) references products(productCode)