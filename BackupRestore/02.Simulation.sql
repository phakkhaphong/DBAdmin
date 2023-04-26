USE Master;
--Full Backup Sat 22:00
BACKUP DATABASE [AdventureWorks] TO  [MyDevice] 
WITH FORMAT, INIT,  MEDIANAME = N'My Media';
GO

--TLOG Backup Mon 9:00-18:00
BACKUP LOG [AdventureWorks] TO  [MyDevice] 
WITH MEDIANAME = N'My Media';

WAITFOR DELAY '00:00:10';

BACKUP LOG [AdventureWorks] TO  [MyDevice] 
WITH MEDIANAME = N'My Media';

WAITFOR DELAY '00:00:10'

BACKUP LOG [AdventureWorks] TO  [MyDevice] 
WITH MEDIANAME = N'My Media';
GO

--Diff Mon 22:00
BACKUP DATABASE [AdventureWorks] TO  [MyDevice] 
WITH DIFFERENTIAL,  MEDIANAME = N'My Media';

--TLOG Backup Tue 9:00-18:00

BACKUP LOG [AdventureWorks] TO  [MyDevice] 
WITH MEDIANAME = N'My Media';

WAITFOR DELAY '00:00:10';

BACKUP LOG [AdventureWorks] TO  [MyDevice] 
WITH MEDIANAME = N'My Media';

WAITFOR DELAY '00:00:10'

BACKUP LOG [AdventureWorks] TO  [MyDevice] 
WITH MEDIANAME = N'My Media';

--Diff Tue 22:00
USE AdventureWorks
GO

INSERT INTO Person.ContactType([Name])
VALUES ('IT Auditor');

USE Master;
GO
BACKUP DATABASE [AdventureWorks] TO  [MyDevice] 
WITH DIFFERENTIAL,  MEDIANAME = N'My Media';

--TLOG Backup Wed 9:00-18:00

BACKUP LOG [AdventureWorks] TO  [MyDevice] 
WITH MEDIANAME = N'My Media';

WAITFOR DELAY '00:00:10';

BACKUP LOG [AdventureWorks] TO  [MyDevice] 
WITH MEDIANAME = N'My Media';

----Update Person.Person 12:14
USE AdventureWorks;
UPDATE Person.Person
SET ModifiedDate=GETDATE()
----Crash Simulation 12:30

/* STEP 2 
	1. Stop Service
	2. Delete Data File (.mdf)
	3. Start Service
	4. Backup Tail-Log
 STEP 3 Restore

 */

 --Backup Tail-Log
 BACKUP LOG [AdventureWorks]
 TO DISK = 'D:\Backups\Adv-Taillog.bak'
 WITH CONTINUE_AFTER_ERROR;
 GO
