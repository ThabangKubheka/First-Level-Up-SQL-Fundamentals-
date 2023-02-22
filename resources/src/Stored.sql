CREATE PROCEDURE checkout_book
@book_id INT,
@member_id INT,
@loan_date DATE 
AS 
BEGIN 
DECLARE 
@quantity INT

SELECT
    @quantity INTO quantity
FROM
    Book
WHERE
    book_id = @book_id;

IF @quantity > 0 
THEN

INSERT INTO
    Rental (book_id, member_id, loan_date, due_date)
VALUES
    (
        @book_id,
        @member_id,
        CURDATE(),
        DATEADD(day, 15, CURDATE())
    );

UPDATE
    Book
SET
    quantity = quantity - 1
WHERE
    book_id = book_id;

PRINT
    'You checkout is successful.'

ELSE
PRINT
    'The book you are trying to checkout is not available at the moment'

END
-----------------
CREATE PROCEDURE calculate_late_fee
	@rental_id INT 
	
	AS BEGIN DECLARE 
	@due_date DATE,
	@late_fee MONEY,
	@loan_date DATE

	SELECT @loan_date FROM Rental
	where rental_id =@rental_id

	SET 
	@due_date = DATEADD(DAY,15,@loan_date)

	IF @loan_date < @due_date

	BEGIN
	SET 
	@late_fee = DATEDIFF(DAY,@due_date,@loan_date)*0.50;


	PRINT 'The Late fee for the rental is '+ CAST(@rental_id AS VARCHAR) + 'is  R'+CAST(@late_fee AS VARCHAR)

	END
	ELSE
	BEGIN 
	SET @late_fee =0

	PRINT 'There is no late fee for rental: '+ CAST(@rental_id AS VARCHAR)
	END

END

--EXEC calculate_late_fee 21;


CREATE PROCEDURE get_due_date
	@book_id INT 

	AS BEGIN DECLARE 
	@loan_date DATE,
	@due_date DATE

	SELECT 
	@loan_date = loan_date
	FROM 
	RENTAL 
	WHERE 
	book_id =@book_id

	SET 
	@due_date = DATEADD(DAY,15,@loan_date)

	PRINT 'You borrowed the book on '+ CAST(@loan_date AS VARCHAR) +' .You will have to return the book on :' + CAST(@due_date AS VARCHAR)

END

---EXEC get_due_date 2;




