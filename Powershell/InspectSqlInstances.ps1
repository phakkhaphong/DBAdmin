# InspectSqlInstances

#1# Import SQL Module
Clear-Host;
Import-Module SQLPS;

#2# Navigate to the Databases collection in the default instance of SQL Server
# We are using the PowerShell provider for SQL Server to do this
cd SQLSERVER:
cd \SQL\localhost;


#3# Display all the instances of SQL Server
# In this demonstration we only have one machine, but we could write a script that would look at more than one machine
# SQL2 and SQL3 only have system databases, but they are still listed
Get-ChildItem | ForEach-Object { $_.Databases | Select-Object -Property Name | Write-Output };

#4# Displays a formatted list of SQL Server instances. 
Get-ChildItem | Select-Object -Property @{Name="InstanceName"; Expression={$_.Name}} -ExpandProperty Databases;

#5# Displays a list of databases in descending order of size
Get-ChildItem | Select-Object -ExpandProperty Databases | Select-Object -Property @{Name="InstanceName"; Expression={$_.Parent.DisplayName}}, Name, Status, CompatibilityLevel, RecoveryModel, Collation, Size, IndexSpaceUsage, ActiveConnections | Sort-Object -Property Size -Descending;

#6# A tabular formatted view of databases in descending order of size
Get-ChildItem | Select-Object -ExpandProperty Databases | Select-Object -Property @{Name="InstanceName"; Expression={$_.Parent.DisplayName}}, Name, Status, CompatibilityLevel, RecoveryModel, Collation, Size, IndexSpaceUsage, ActiveConnections | Sort-Object -Property Size -Descending | Format-Table;

#7# Output to a text file
Get-ChildItem | Select-Object -ExpandProperty Databases | Select-Object -Property @{Name="InstanceName"; Expression={$_.Parent.DisplayName}}, Name, Status, CompatibilityLevel, RecoveryModel, Collation, Size, IndexSpaceUsage, ActiveConnections | Sort-Object -Property Size -Descending | Out-File -FilePath "D:\Demofiles\Mod11\Demo\Dbs.txt";

#8# Output to an XML file
(Get-ChildItem | Select-Object -ExpandProperty Databases | Select-Object -Property @{Name="InstanceName"; Expression={$_.Parent.DisplayName}}, Name, Status, CompatibilityLevel, RecoveryModel, Collation, Size, IndexSpaceUsage, ActiveConnections | Sort-Object -Property Size -Descending | ConvertTo-XML).Save("D:\Demofiles\Mod11\Demo\Dbs.xml");

#9# Output to a CSCV file, which can then be opened in Excel
Get-ChildItem | Select-Object -ExpandProperty Databases | Select-Object -Property @{Name="InstanceName"; Expression={$_.Parent.DisplayName}}, Name, Status, CompatibilityLevel, RecoveryModel, Collation, Size, IndexSpaceUsage, ActiveConnections | Sort-Object -Property Size -Descending | ConvertTo-CSV | Out-File -FilePath "D:\Demofiles\Mod11\Demo\Dbs.csv";

