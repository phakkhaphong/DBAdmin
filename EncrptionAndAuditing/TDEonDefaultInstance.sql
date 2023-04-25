--Step 1 Create DMK (Database Master Key) on Default Instance

USE master;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'fghf!@dhbgfSDFGbcv5454';
GO

--No need to backup DMK

--Step 2 Create Certificate 

CREATE CERTIFICATE TDE_cert WITH SUBJECT = 'TDE certificate';
GO

--Step 3 Backup Certificate
BACKUP CERTIFICATE TDE_cert 
TO FILE = 'D:\BACKUPS\TDE_cert.bak'
WITH PRIVATE KEY 
(
    FILE = 'D:\BACKUPS\TDE_cert_pk.bak',
    ENCRYPTION BY PASSWORD = 'Pa55w.rd'
);
GO

--Step 4 Create DEK (Database Encryption Key) on Target Database

USE InternetSales;
GO
CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE TDE_cert;
GO