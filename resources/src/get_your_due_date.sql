CREATE PROCEDURE get_due_date
	@book_id INT 

	AS BEGIN DECLARE 
	@loan_date DATE,
	@due_date DATE

	SELECT 
	loan_date
	FROM 
	RENTAL 
	WHERE 
	book_id =@book_id

	SET 
	@due_date = DATEADD(DAY,15,@loan_date)

	PRINT 'You borrowed the book on '+ CAST(@loan_date AS VARCHAR) +' .You will have to return the book on :' + CAST(@due_date AS VARCHAR)

END

---EXEC get_due_date 2;
