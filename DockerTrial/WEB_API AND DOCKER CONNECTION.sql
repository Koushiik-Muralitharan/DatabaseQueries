CREATE DATABASE STUDENT_DETAILS

USE STUDENT_DETAILS

CREATE TABLE STUDENT_TABLE (
   Roll_no VARCHAR(10) PRIMARY KEY,
   Student_name VARCHAR(20) NOT NULL, 
   Official_email VARCHAR(255) UNIQUE NOT NULL,
   Gender VARCHAR(10) NOT NULL CHECK (Gender IN ('Male', 'Female', 'Other')),
   Year_of_study INT NOT NULL CHECK (Year_of_study > 0),
   Address_of_communication VARCHAR(255) NOT NULL,
   Phone_no VARCHAR(10) NOT NULL CHECK (LEN(Phone_no) = 10)
);

GO

CREATE  PROCEDURE ADD_STUDENTS_SP
@roll_no VARCHAR(10),
@name VARCHAR(20),
@email VARCHAR(255),
@gender VARCHAR(10),
@year INT,
@address VARCHAR(255),
@phone_no VARCHAR(10)
AS
BEGIN
      INSERT INTO STUDENT_TABLE (Roll_no,Student_name,Official_email,Gender,Year_of_study,Address_of_communication,Phone_no) VALUES (@roll_no, @name, @email, @gender, @year, @address, @phone_no);
END

GO

CREATE PROCEDURE DISPLAY_STUDENTS_SP
AS
BEGIN
   SELECT * FROM STUDENT_TABLE;
END

EXEC DISPLAY_STUDENTS_SP;


EXEC ADD_STUDENTS_SP 
   @roll_no = '717821F110', 
   @name = 'Ashok Kumar M',
   @email = 'ashok@gmail.com', 
   @gender = 'Male', 
   @year = 4, 
   @address = 'Madurai', 
   @phone_no = '9876543217';

