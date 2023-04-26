USE [master]
RESTORE DATABASE [AdventureWorks] FROM  DISK = N'D:\Backups\myDevice.bak' WITH  FILE = 1,  NORECOVERY,REPLACE
RESTORE DATABASE [AdventureWorks] FROM  DISK = N'D:\Backups\myDevice.bak' WITH  FILE = 9,  NORECOVERY
RESTORE LOG [AdventureWorks] FROM  DISK = N'D:\Backups\myDevice.bak' WITH  FILE = 10,  NORECOVERY
RESTORE LOG [AdventureWorks] FROM  DISK = N'D:\Backups\myDevice.bak' WITH  FILE = 11,NORECOVERY
GO

RESTORE LOG [AdventureWorks] FROM  DISK = N'D:\Backups\adv_taillog.bak' WITH NORECOVERY

RESTORE LOG [AdventureWorks]  WITH RECOVERY



