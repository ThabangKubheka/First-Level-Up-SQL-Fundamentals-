--CREATE DATABASE xyz;
--USE xyz;

CREATE TABLE Author(
author_id int UNIQUE IDENTITY(1,1) NOT NULL,
firstname varchar(50) NOT NULL,
lastname varchar(50) NOT NULL,
);


CREATE TABLE Publisher(
publisher_id int UNIQUE IDENTITY (1,1) NOT NULL,
name varchar(50) NOT NULL
);

CREATE TABLE Book(
book_id int UNIQUE IDENTITY (1,1) NOT NULL,
title varchar(50) NOT NULL,
publisher_id int NOT NULL,
publish_date datetime NOT NULL,
isbn int NOT NULL,
quantity int NOT NULL,
);

CREATE TABLE Member(
member_id int UNIQUE IDENTITY(1,1) NOT NULL,
firstname varchar(50) NOT NULL,
lastname varchar(50) NOT NULL,
email_address varchar(64) NOT NULL,
cellphone_number char(10) NOT NULL,
status bit NOT NULL
);


CREATE TABLE Genre (
genre_id int UNIQUE IDENTITY (1,1) NOT NULL,
name varchar(50) NOT NULL,
description varchar(140)
);


CREATE TABLE Book_Author(
book_author_id int UNIQUE IDENTITY (1,1) NOT NULL,
author_id int NOT NULL,
book_id int NOT NULL,
);

CREATE TABLE Rental(
rental_id int UNIQUE IDENTITY (1,1) NOT NULL,
book_id int NOT NULL,
member_id int NOT NULL, 
loan_date datetime NOT NULL,
);

CREATE TABLE Book_Genre(
book_genre_id int UNIQUE IDENTITY (1,1) NOT NULL,
genre_id int NOT NULL,
book_id int NOT NULL
);

-- Book Genre
ALTER TABLE Book_Genre
ADD CONSTRAINT fk_book_id_genre FOREIGN KEY (book_id) REFERENCES Book (book_id);

ALTER TABLE Book_Genre
ADD CONSTRAINT fk_genre_id_genre FOREIGN KEY (genre_id) REFERENCES Genre(genre_id);
--

-- Rental --
ALTER TABLE Rental
ADD CONSTRAINT fk_book_id_rental FOREIGN KEY (book_id) REFERENCES Book (book_id);
ALTER TABLE Rental
ADD CONSTRAINT fk_member_id_rental FOREIGN KEY (member_id) REFERENCES Member(member_id);
--

-- Book --
ALTER TABLE Book
ADD CONSTRAINT fk_publisher_id_book FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id);
--


-- Book Author --
ALTER TABLE Book_Author
ADD CONSTRAINT fk_author_id_book_author FOREIGN KEY (author_id) REFERENCES Author(author_id);

ALTER TABLE Book_Author
ADD CONSTRAINT fk_book_id_book_author FOREIGN KEY (book_id) REFERENCES Book(book_id);


