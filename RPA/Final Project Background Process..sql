Create DATABASE RPA_JOB_TASK;

CREATE TABLE JOB_DETAILS (Sno int identity(1,1) primary key, Reference varchar(20), CurrentDateAndTime DATETIME DEFAULT GETDATE(), TransactionStatus varchar(20) DEFAULT 'Adding to queue', ModifiedDateTime DATETIME );

DROP TABLE JOB_DETAILS;
GO

CREATE PROCEDURE SP_ADD_JOB_DETAILS
@Reference varchar(200),
@TransactionStatus varchar(200),
@JobId int
AS
BEGIN
INSERT INTO JOB_DETAILS(Reference,TransactionStatus, JobId) VALUES(@Reference, @TransactionStatus, @JobId)
END;
go

CREATE PROCEDURE SP_UPDATE_STATUS
@Reference varchar(200)
AS
BEGIN
     UPDATE JOB_DETAILS set TransactionStatus = 'Progress'
	 where Reference = @Reference;
END;
go

CREATE PROCEDURE SP_UPDATE_STATUS_COMPLETED
@Reference varchar(200)
AS
BEGIN
     UPDATE JOB_DETAILS set TransactionStatus = 'Completed'
	 where Reference = @Reference;
END;
go

SELECT * FROM JOB_DETAILS;