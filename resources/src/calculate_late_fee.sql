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
