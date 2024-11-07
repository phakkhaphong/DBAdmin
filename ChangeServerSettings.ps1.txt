#1# ExamineAndChangeServerSettings
Clear-Host;
Import-Module SQLPS;

#2# Navigate to the Databases collection in the default instance of SQL Server
# We're using the PowerShell provider for SQL Server to do this
cd SQLSERVER:
cd \SQL\localhost;

#3# Get the server object
# This is an SMO object and we can access its properties and methods
$server = Get-Item -Path DEFAULT;

#4# Examine the Settings object
# The server is the top-level object in the SMO hierarchy, so we use the settings object 
$server.Settings | Get-Member -MemberType Property;

$server.Settings | Format-List;


#5# Change LoginMode to mixed
$server.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Mixed;
$server.Settings.Alter();
$server.Settings.LoginMode;

#6# Change LoginMode back to Integrated
$server.Settings.LoginMode = [Microsoft.SqlServer.Management.Smo.ServerLoginMode]::Integrated;
$server.Settings.Alter();
$server.Settings.LoginMode;

#7# Examine the UserOptions object
$userOptions = $server.UserOptions;
$userOptions | Get-Member;
$userOptions | Get-Member -MemberType Property;
$userOptions | Format-List;


#8# UserOption object
# Change some properties
$userOptions.AnsiNulls = $true;
$userOptions.AnsiPadding = $true;
$userOptions.AnsiWarnings = $true;
$userOptions.QuotedIdentifier = $true;

$userOptions.Alter();

$userOptions | Select-Object -Property AnsiNulls, AnsiPadding, AnsiWarnings, QuotedIdentifier | Format-List;

#9# UserOption object
# Change some properties
# Change the properties back to their original values
$userOptions.AnsiNulls = $false;
$userOptions.AnsiPadding = $false;
$userOptions.AnsiWarnings = $false;
$userOptions.QuotedIdentifier = $false;

$userOptions.Alter();

$userOptions | Select-Object -Property AnsiNulls, AnsiPadding, AnsiWarnings, QuotedIdentifier | Format-List;







