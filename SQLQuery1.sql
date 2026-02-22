create database task7
go
use task7
go
create table employees
(
	id int ,
	name varchar(50),
	department varchar(50),
	salary decimal(6,4)
)
alter table employees
drop column salary
EXEC sp_rename 'employees.department' , 'deptname', 'column';
create table Projects
(
projectID int ,
projectName varchar(50),
)
alter table employees
add constraint PK_employees_id primary key (id)

alter table employees
add constraint UQ_employees_name unique (name)
create table Customers
(
customerID int ,
firstName varchar(50),
lastName varchar(50),
email varchar(50),
status varchar(20)
)
alter table Customers
add constraint uk_customer_name unique (firstName, lastName)
create table Orders
(
orderID int ,
customerID int ,
orderDate datetime,
totalAmount decimal(10,2)
)
alter table Orders
add constraint check_totalAmount CHECK (totalAmount > 0)
go
create schema sales;
go
alter schema sales transfer dbo.Orders;
EXEC sp_rename 'sales.orders' , 'salesorders';
\\======================question2===============================\\
create database movies
go	
use movies
go
create table actors
(
actorID int primary key ,
firstName char(20),
lastName char(20),
actgender char(1)
);
create table movies
(
mov_id INT PRIMARY KEY,
    mov_title CHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);
CREATE TABLE director (
    dir_id INT PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);
CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name CHAR(30)
);
CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title CHAR(20)
);
CREATE TABLE movie_cast (
    act_id INT,
    mov_id INT,
    role CHAR(30),

    PRIMARY KEY (act_id, mov_id),

    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);
create table movie_direction
(
dir_id int,
mov_id int,
primary key (dir_id, mov_id),
foreign key (dir_id) references director(dir_id),
foreign key (mov_id) references movies(mov_id)
);
create table movie_genres
(
    mov_id INT,
    gen_id INT,

    PRIMARY KEY (mov_id, gen_id),

    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);
CREATE TABLE rating (
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,

    PRIMARY KEY (mov_id, rev_id),

    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);

    