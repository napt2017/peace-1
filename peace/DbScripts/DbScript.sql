create database peace;
use peace;

#Create table user for login 
/*All User's gets stored in APP_USER table*/
create table APP_USER (
   id BIGINT NOT NULL AUTO_INCREMENT,
   username VARCHAR(30) NOT NULL,
   password VARCHAR(100) NOT NULL,
   first_name VARCHAR(30) NOT NULL,
   last_name  VARCHAR(30) NOT NULL,
   email VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (sso_id)
);

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

/* USER_ROLE table contains all possible roles */ 
create table USER_ROLE(
   role_id BIGINT NOT NULL AUTO_INCREMENT,
   type VARCHAR(30) NOT NULL,
   PRIMARY KEY (id),
   UNIQUE (type)
);

/* Populate USER_PROFILE Table */
INSERT INTO USER_ROLE(type)
VALUES ('USER');
  
INSERT INTO USER_ROLE(type)
VALUES ('ADMIN');
  
INSERT INTO USER_ROLE(type)
VALUES ('DBA');


/* JOIN TABLE for MANY-TO-MANY relationship*/  
CREATE TABLE APP_USER_USER_ROLE (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT FK_APP_USER FOREIGN KEY (user_id) REFERENCES APP_USER (id),
    CONSTRAINT FK_USER_PROFILE FOREIGN KEY (role_id) REFERENCES USER_ROLE (role_id)
);

/* Populate JOIN Table */
INSERT INTO APP_USER_USER_ROLE (user_id, role_id)
  SELECT user.id, role.role_id FROM app_user user, user_role role
  where user.username='sam' and role.type='ADMIN';