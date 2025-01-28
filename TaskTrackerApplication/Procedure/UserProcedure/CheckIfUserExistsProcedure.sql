CREATE PROCEDURE dbo.CheckUserPresence
@UserEmail varchar(50)
AS
BEGIN
    DECLARE @IsPresent bit;

    IF EXISTS (SELECT 1 FROM UserDetails WHERE userEmail = @UserEmail)
    BEGIN
        SET @IsPresent = 1;
    END
    ELSE
    BEGIN
        SET @IsPresent = 0;
    END

    SELECT @IsPresent;
END;
