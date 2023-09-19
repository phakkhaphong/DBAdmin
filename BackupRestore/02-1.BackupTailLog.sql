 --Backup Tail-Log
 BACKUP LOG [AdventureWorks]
 TO DISK = 'D:\Backups\Adv-Taillog.bak'
 WITH CONTINUE_AFTER_ERROR;
 GO
