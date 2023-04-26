USE [master]
RESTORE DATABASE [AdventureWorks] FROM  DISK = N'D:\Backups\myDevice.bak' WITH  FILE = 1,  NORECOVERY,REPLACE
RESTORE DATABASE [AdventureWorks] FROM  DISK = N'D:\Backups\myDevice.bak' WITH  FILE = 9,  NORECOVERY
RESTORE LOG [AdventureWorks] FROM  DISK = N'D:\Backups\myDevice.bak' WITH  FILE = 10,  NORECOVERY
RESTORE LOG [AdventureWorks] FROM  DISK = N'D:\Backups\myDevice.bak' WITH  FILE = 11, RECOVERY
GO





