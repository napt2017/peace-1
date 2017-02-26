create database peace;
use peace;

#Create table user for login 
create table User
(
	id int not null primary key auto_increment,
    username nvarchar(20) not null,
    password nvarchar(20) not null,
    email nvarchar(20) not null,
    fullname nvarchar(30) not null,
    date date not null 
    
)

select * from user;

#The table for example
create table Department
(
	dept_id int not null primary key auto_increment,
	dept_no nvarchar(30) not null,
    dept_name nvarchar(30) not null,
    location nvarchar(30) 
)

drop table Contact;
#Table contact
create table Contact
(
	id int not null primary key auto_increment,
	email nvarchar(20) not null,
    name nvarchar(20) not null,
    phone nvarchar(20) not null,
    created_date date not null,
    exhibition_category nvarchar(100) not null,
    describe_content  nvarchar(200) not null 
)