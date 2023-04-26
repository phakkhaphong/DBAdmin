/*
	Prepare Adventureworks Database
*/

USE Master;
GO

EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'AdventureWorks';
DROP DATABASE IF EXISTS Adventureworks;
GO

---Step 1 CREATE Folder D:\adv

--Step 2 Restore AdventureWorks to D:\adv
RESTORE DATABASE AdventureWorks
FROM  DISK = N'D:\Setupfiles\AdventureWorks.bak' 
WITH  
	MOVE N'AdventureWorks' TO N'D:\Adv\AdventureWorks.mdf'
,	MOVE N'AdventureWorks_Log' TO N'D:\Adv\AdventureWorks_log.ldf'
GO

--Step 3 Prepare Backup Media
EXEC master.dbo.sp_addumpdevice  @devtype = N'disk', @logicalname = N'myMedia'
, @physicalname = N'D:\Backups\myMedia.bak'
GO