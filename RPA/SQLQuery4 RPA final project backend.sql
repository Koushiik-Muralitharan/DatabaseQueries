USE [RPA_JOB_TASK]
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_STATUS]    Script Date: 12-11-2024 17:17:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_UPDATE_STATUS]
@Reference varchar(200)
AS
BEGIN
     UPDATE JOB_DETAILS set TransactionStatus = 'Progress'
	 where Reference = @Reference;
END;