--CREATE DATABASE abc;
--USE abc;

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


-----------------------------------INSERTING INTO TABLES

INSERT INTO Member (firstname, lastname,email_address,cellphone_number,status)
VALUES ('Claudia','Cole','cole@gmail.com','0765541167','true'),
       ('Thami','Bhengu', 'ngcolosi@gmail.com','0620276778','true'),
	   ('Brad','Davis','davis@gmail.com','0722495064','true'),
	   ('Daniel','Mckee','mckee@gmail.com','0743781780','true'),
	   ('Sarah','Moyo','moyo@gmail.com','0836759087','true'),
	   ('Taylor','Hamilton','hamilton@gmail.com','0786759078','true'),
	   ('Emily','Jackson','jackson@gmail.com','0825825269','true'),
	   ('Michele','Walker','walker@gmail.com','0621233614','true'),
	   ('Kristin','Thomas','thomas@gmail.com','0671125590','true'),
	   ('Dale','Williams','williams@gmail.com','0728822546','true');

INSERT INTO Publisher
VALUES ('MusicRoom'),
       ('Pearson'),
	   ('NOLO'),
	   ('Amazon Publishing'),
	   ('Kids Discover'),
	   ('Museum of Mordern Art'),
	   ('Ashmolean Museum'),
	   ('Taschen Books'),
	   ('Thomson Reuter'),
	   ('Chronicle Books');


INSERT INTO Author( firstname,lastname)
VALUES ('Dean', 'KoontZ'),
       ('Dudu','Dube'),
       ('Robert', 'Greene'),
	   ('Ian','Beck'),
	   ('Louise', 'Cooper'),
	   ('Nakanjani','Sibiya'),
	   ('Anne','Rice'),
	   ('David','Almond'),
	   ('Sboniso','Mbatha'),
	   ('Stephen','King');
	   
     

INSERT INTO Genre(name )
VALUES ('Thriller'),
       ('Horror'),
	   ('Adventure'),
	   ('Comedy'),
	   ('Romance'),
	   ('Mistery'),
	   ('Scientific Fiction'),
	   ('Western'),
	   ('Historical Fiction'),
	   ('Fantasy');

 
 INSERT INTO Book (title,publisher_id,publish_date ,isbn ,quantity )
 VALUES ('48 Laws of Power',3,'1998-02-25',55734,20),
        ('Heaven Eyes', 1,'2000-09-12',88907,20),
		('Insizi Yezinsizi',10,'1986-12-18',73255,20),
		('The Vampire Lestat',8,'1985-09-25',99087,20),
		('The Heart of Dust',6,'2019-07-17',34523,20),
		('Hlomu: The Wife',5,'2005-08-19',67689,20),
		('Bengithi Lizokuna',2,'1999-04-9',76763,20),
		('Pastworld',7,'2000-05-29',55678,20),
		('The Outsider',9,'2004-07-05',11232,20);



INSERT INTO Rental(book_id,member_id,loan_date )
VALUES (25,19,'2023-02-21'),
       (4,10,'2021-04-17'),
	   (24,18,'2019-06-21'),
	   (17,11,'2023-01-25'),
	   (23,17,'2022-01-09'),
	   (18,12,'2023-02-18'),
	   (22,16,'2022-12-22'),
	   (19,13,'2020-09-19'),
	   (20,15,'2021-03-06'),
	   (21,14,'2021-06-28');

Select * From Book_Genre 
Select * From Book 
INSERT INTO Book_Genre (genre_id ,book_id )
VALUES (10,4),
       (1,25),
	   (9,17),
	   (2,24),
	   (8,18),
	   (7,23),
	   (3,19),
	   (6,22),
	   (5,20),
	   (4,21);


INSERT INTO Book_Author (author_id ,book_id )	
VALUES  (1,25),
		(10,4),
		(2,17),
		(9,24),
		(3,18),
		(8,23),
		(4,19),
		(7,22),
		(6,20),
		(5,21);

