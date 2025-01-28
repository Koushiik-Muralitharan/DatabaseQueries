USE [RPA_JOB_TASK]
GO
/****** Object:  StoredProcedure [dbo].[SP_ADD_JOB_DETAILS]    Script Date: 12-11-2024 17:16:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_ADD_JOB_DETAILS]
@Reference varchar(20),
@TransactionStatus varchar(200),
@JobId int
AS
BEGIN
INSERT INTO JOB_DETAILS(Reference,TransactionStatus, JobId) VALUES(@Reference, @TransactionStatus, @JobId)
END;