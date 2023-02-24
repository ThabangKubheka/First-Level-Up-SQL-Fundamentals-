CREATE VIEW aAB AS
SELECT
    b.book_id, b.title, g.name AS genre, p.name AS publisher, b.publication_date, b.isbn, CONCAT(a.firstname, ' ', a.lastname) AS author, dbo.isAvailable(b.book_id) Status    
	FROM
        Book b
    INNER JOIN
        Publisher p ON b.publisher_id = p.publisher_id
    INNER JOIN
        Genre g ON b.genre_id = g.genre_id
    INNER JOIN
        Credit c ON b.book_id = c.book_id
    INNER JOIN
        Author a ON a.author_id = c.author_id;