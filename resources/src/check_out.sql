CREATE PROCEDURE checkout_book
@book_id INT,
@member_id INT

AS 
BEGIN 
DECLARE 
@available INT,
@due_date DATE,
@loan_date DATE,
@check INT,
@return_date DATE


SELECT
    @return_date =return_date
FROM
    Rental
WHERE
    book_id = @book_id;

SELECT
    @available =available
FROM
    Book
WHERE
    book_id = @book_id;

	SET
	@check =(SELECT
    COUNT(book_id)
FROM
    Rental
WHERE
    book_id = @book_id);

	SET
	@loan_date =GETDATE()

	SET 
	@due_date = DATEADD(day, 14, @loan_date)

IF (@available > 0) AND (@check<=1) AND (@return_date!=Null) AND (@return_date>@due_date)

BEGIN
INSERT INTO
    Rental (book_id, member_id, loan_date, due_date)
VALUES
    (
        @book_id,
        @member_id,
        @loan_date,
        @due_date
    );
	
UPDATE
    Book
SET
    available = @available  - 1
WHERE
    book_id = @book_id;

PRINT
    'You checkout is successful.'

END

ELSE
BEGIN
PRINT
    'The book you are trying to checkout is not available at the moment'
END

END



EXEC checkout_book 1,1

select * from Rental;
