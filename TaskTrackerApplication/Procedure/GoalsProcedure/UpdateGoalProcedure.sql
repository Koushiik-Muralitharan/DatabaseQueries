CREATE PROCEDURE UpdateGoal
    @goalID INT,           
    @goalName VARCHAR(50), 
    @goalAmount decimal(30,2),
	@result BIT OUTPUT

AS
BEGIN
    BEGIN TRY
        
        UPDATE Goals
        SET 
            GoalName = @goalName,
            GoalAmount = @goalAmount
        WHERE 
            GoalID = @goalID;

        IF @@ROWCOUNT = 0
        BEGIN
            
            SET @result = 0;
        END
		ELSE
		BEGIN
            SET @result = 1; 
		END;
    END TRY
    BEGIN CATCH
        SET @result = 0;  
    END CATCH
END;