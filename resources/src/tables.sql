CREATE TABLE Book(
book_id int UNIQUE IDENTITY (1,1) NOT NULL,
title varchar(50) NOT NULL,
author_id int NOT NULL,
publisher_id int NOT NULL,
publish_date datetime NOT NULL,
isbn int NOT NULL,
quantity int NOT NULL,
author_id int FOREIGN KEY REFERENCES Author(author_id),
publisher_id int FOREIGN KEY REFERENCES Publisher(publisher_id)
);

CREATE TABLE Member(
member_id int UNIQUE IDENTITY(1,1) NOT NULL,
firstname varchar(50) NOT NULL,
lastname varchar(50) NOT NULL,
email_address varchar(64) NOT NULL,
cellphone_number char(10) NOT NULL,
status bit NOT NULL
);

CREATE TABLE Author(
author_id int UNIQUE IDENTITY(1,1) NOT NULL,
firstname varchar(50) NOT NULL,
lastname varchar(50) NOT NULL,
);

CREATE TABLE Publisher(
publisher_id int UNIQUE IDENTITY (1,1) NOT NULL,
name varchar(50) NOT NULL
);

CREATE TABLE Genre (
genre_id int UNIQUE IDENTITY (1,1) NOT NULL,
name varchar(50) NOT NULL,
description varchar(140)
);


CREATE TABLE Book_Author(
book_author_id int UNIQUE IDENTITY (1,1) NOT NULL,
author_id int NOT NULL
book_id int NOT NULL,
);


CREATE TABLE Rental(
rental_id int UNIQUE IDENTITY (1,1) NOT NULL,
book_id int NOT NULL,
member_id int NOT NULL, 
loan_date datetime NOT NULL
);


CREATE TABLE Book_Genre(
book_genre_id int UNIQUE IDENTITY (1,1) NOT NULL,
genre_id int NOT NULL,
book_id int NOT NULL
);

