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

ALTER DATABASE Adventureworks SET RECOVERY FULL WITH NO_WAIT
GO

-- Step 3 CREATE Folder D:\backups

-- Step 4 Prepare Backup Media
IF EXISTS(SELECT * FROM sys.backup_devices WHERE [name]=N'myDevice')
	EXEC master.dbo.sp_dropdevice @logicalname = N'myDevice';

EXEC master.dbo.sp_addumpdevice  @devtype = N'disk', @logicalname = N'myDevice'
, @physicalname = N'D:\Backups\myDevice.bak'
GO
