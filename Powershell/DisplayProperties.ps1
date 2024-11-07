#1# Display database properties
Clear-Host;
Import-Module SQLPS;

#2# Navigate to the Databases collection in the default instance of SQL Server
# We are using the PowerShell provider for SQL Server to do this
Set-Location SQLSERVER:
Set-Location \SQL\localhost\DEFAULT\Databases;

#3# Get the database that we want to work with
# This is an SMO object and we can access its properties and methods
$databaseName = "AdventureWorks";
$database = Get-Item -Path $databaseName;

#4# Display some of the database properties
Write-Host;
Write-Host "Database properties:";
Write-Host "--------------------";
Write-Host ("Name", $database.Name) -Separator ": ";
Write-Host ("Collation", $database.Collation) -Separator ": ";
Write-Host ("CompatibilityLevel", $database.CompatibilityLevel) -Separator ": ";
Write-Host ("CreateDate", $database.CreateDate) -Separator ": ";
Write-Host ("DataSpaceUsage", $database.DataSpaceUsage) -Separator ": ";
Write-Host ("LastBackupDate", $database.LastBackupDate) -Separator ": ";
Write-Host ("Status", $database.Status) -Separator ": ";

#5# Display some of the database options
Write-Host;
Write-Host "Database options:";
Write-Host "-----------------";
Write-Host ("AnsiNullsEnabled", $database.DatabaseOptions.AnsiNullsEnabled) -Separator ": ";
Write-Host ("AnsiPaddingEnabled", $database.DatabaseOptions.AnsiPaddingEnabled) -Separator ": ";
Write-Host ("AnsiWarningEnabled", $database.DatabaseOptions.AnsiWarningsEnabled) -Separator ": ";
Write-Host ("AutoShrink", $database.DatabaseOptions.AutoShrink) -Separator ": ";
Write-Host ("QuotedIdentifiersEnabled", $database.DatabaseOptions.QuotedIdentifiersEnabled) -Separator ": ";
Write-Host ("ReadOnly", $database.DatabaseOptions.ReadOnly) -Separator ": ";
Write-Host ("RecoveryModel", $database.DatabaseOptions.RecoveryModel) -Separator ": ";
Write-Host ("RecursiveTriggersEnabled", $database.DatabaseOptions.RecursiveTriggersEnabled) -Separator ": ";
Write-Host ("SnapshotIsolationState", $database.DatabaseOptions.SnapshotIsolationState) -Separator ": ";
