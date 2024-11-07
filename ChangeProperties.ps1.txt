#1# ChangeDatabaseProperties
Clear-Host;
Import-Module SQLPS;

#2# Navigate to the Databases collection in the default instance of SQL Server
# We are using the PowerShell provider for SQL Server to do this
Set-Location SQLSERVER:
Set-Location \SQL\localhost\DEFAULT\Databases;

#3# Get the database that we want to work with
# This is an SMO object and so we can access its properties and methods
$databaseName = "AdventureWorks2016";
$database = Get-Item -Path $databaseName;
    
#4# Change some of the database properties
$database.CompatibilityLevel = [Microsoft.SqlServer.Management.Smo.CompatibilityLevel]::Version120;
$database.Alter();
Write-Host "Changed database properties";
Write-Host $database.CompatibilityLevel

#5# Change some of the database options
$database.DatabaseOptions.AnsiNullsEnabled = $false;
$database.DatabaseOptions.AutoShrink = $true;
$database.DatabaseOptions.ReadOnly = $true;
$database.DatabaseOptions.RecoveryModel = [Microsoft.SqlServer.Management.Smo.RecoveryModel]::Full;
$database.Alter();
Write-Host "Changed database options";
