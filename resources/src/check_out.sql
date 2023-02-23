CREATE PROCEDURE checkout_book
@book_id INT,
@member_id INT

AS 
BEGIN 
DECLARE 
@available INT,
@due_date DATE,
@loan_date DATE 


SELECT
    @available 
FROM
    Book
WHERE
    book_id = @book_id;

	SET 
	@due_date = DATEADD(day, 14, @loan_date)

	SET
	@loan_date =GETDATE()

IF @available > 0 
THEN

INSERT INTO
    Rental (book_id, member_id, loan_date, due_date)
VALUES
    (
        @book_id,
        @member_id,
        @loan_date,
        @due_date)
    );

UPDATE
    Book
SET
    availble =@available  - 1
WHERE
    book_id = @book_id;

PRINT
    'You checkout is successful.'

ELSE
PRINT
    'The book you are trying to checkout is not available at the moment'

END