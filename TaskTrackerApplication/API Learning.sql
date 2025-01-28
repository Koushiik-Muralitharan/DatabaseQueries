CREATE DATABASE EMPLOYEE_DETAILS;

-- table creation

CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),  -- Auto-incremented ID
    FirstName NVARCHAR(50) NOT NULL,          -- Employee's first name
    LastName NVARCHAR(50) NOT NULL,           -- Employee's last name
    Email NVARCHAR(100) UNIQUE NOT NULL,      -- Employee's email (unique)
    HireDate DATE NOT NULL                    -- Date of hire
);

GO

-- stored procedure to add a employee


CREATE PROCEDURE AddEmployee
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @Email NVARCHAR(100),
    @HireDate DATE
AS
BEGIN
    BEGIN TRY
        INSERT INTO EmployeeDetails (FirstName, LastName, Email, HireDate)
        VALUES (@FirstName, @LastName, @Email, @HireDate);

        SELECT SCOPE_IDENTITY() AS NewEmployeeID; -- Returns the new EmployeeID
    END TRY
    BEGIN CATCH
        -- Handle errors and return error message
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;

Select * from EmployeeDetails;

