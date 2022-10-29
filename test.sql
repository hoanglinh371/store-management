create database store_management_dev
use store_management_dev

create table customer
(
	id varchar(50) primary key,
	name nvarchar(50) not null,
	address nvarchar(200) not null,
	phone_number varchar(11) not null,
)
insert into customer(id, name, address, phone_number)
values ('KH01', N'Hoàng Văn K', N'Ngô Quyền, Hải Phòng', '0123456789'),
	   ('KH02', N'Trần Thị Thu P', 'Quận 10, TP. Hồ Chí Minh', '0235744432')

create table staff
(
	id varchar(50) primary key,
	name nvarchar(50) not null,
	email varchar(50) not null,
	password varchar(50) not null,
	address nvarchar(200) not null,
	phone_number varchar(11) not null,
	gender bit not null,
	dob date not null,
)
insert into staff(id, name, email, password, address, phone_number, gender, dob)
values ('NV01', N'Nguyễn Văn A', 'nv01@gmail.com', '123123', N'Thanh Xuân, Hà Nội', '0123456789', '1', '2000/01/01'),
	   ('NV02', N'Phạm Thị H', 'nv02@gmail.com', '123123', N'Cầu Giấy, Hà Nội', '0987654321', '0', '1999/12/21')

create table material
(
	id varchar(50) primary key,
	name nvarchar(50) not null,
)
insert into material(id, name)
values ('MA01', N'Vải Cotton')

create table product
(
	id varchar(50) primary key,
	name nvarchar(50) not null,
	material_id varchar(50) foreign key references material(id),
	inventory int,
	import_price float not null,
	sale_price float not null,
	image_url varchar(255),
	note nvarchar(100)
)
insert into product(id, name, material_id, inventory, import_price, sale_price, image_url, note)
values ('PR01', 'Brown Brim', 'MA01', '100', '20000', '25000', 'https://i.ibb.co/ZYW3VTp/brown-brim.png', ''),
	   ('PR02', 'Grey Jean Jacket', 'MA01', '100', '90000', '150000', 'https://i.ibb.co/N71k1ML/grey-jean-jacket.png', '')
select * from product

create table sale_receipt
(
	id varchar(50) primary key,
	staff_id varchar(50) foreign key references staff(id),
	customer_id varchar(50) foreign key references customer(id),
	sale_date date not null,
	total float not null,
)
	

create table sale_receipt_detail
(
	sale_receipt_id varchar(50) foreign key references sale_receipt(id),
	product_id varchar(50) foreign key references product(id),
	quantity int not null,
	price float not null,
	discount float,
	unit_price float,
)


delete from sale_receipt
delete from sale_receipt_detail

select * from sale_receipt
select * from sale_receipt_detail
delete from sale_receipt