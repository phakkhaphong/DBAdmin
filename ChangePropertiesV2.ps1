# ChangeDatabaseProperties.ps1
# สคริปต์นี้ใช้ปรับคุณสมบัติและตัวเลือกของฐานข้อมูล SQL Server ด้วย PowerShell
# ตัวอย่างนี้เพิ่มโครงสร้าง error handling และข้อความอธิบายแต่ละขั้นตอน

[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    [string]$InstanceName = "localhost",
    
    [Parameter(Mandatory=$true)]
    [string]$DatabaseName = "AdventureWorks",
    
    [Parameter()]
    [switch]$Verbose
)

try {
    # 1. ล้างหน้าจอและโหลดโมดูล SQLPS
    Clear-Host
    Import-Module SQLPS -ErrorAction Stop
    Write-Verbose "นำเข้าโมดูล SQLPS สำเร็จ"

    # 2. เปลี่ยนไปยังที่อยู่ของฐานข้อมูลใน instance ที่ระบุ
    $dbPath = "SQLSERVER:\SQL\$InstanceName\DEFAULT\Databases"
    Set-Location $dbPath -ErrorAction Stop
    Write-Verbose "เปลี่ยนเส้นทางไปยัง $dbPath เรียบร้อย"

    # 3. รับวัตถุฐานข้อมูลโดยใช้ SMO
    $database = Get-Item -Path $DatabaseName -ErrorAction Stop
    Write-Verbose "ดึงฐานข้อมูล $DatabaseName สำเร็จ"

    # 4. ปรับ CompatibilityLevel และบันทึก
    $targetCompat = [Microsoft.SqlServer.Management.Smo.CompatibilityLevel]::Version160
    if ($database.CompatibilityLevel -ne $targetCompat) {
        $database.CompatibilityLevel = $targetCompat
        $database.Alter()
        Write-Host "ปรับ CompatibilityLevel ของฐานข้อมูล $DatabaseName เป็น $targetCompat แล้ว"
    } else {
        Write-Verbose "CompatibilityLevel เท่ากับค่าเป้าหมายอยู่แล้ว"
    }

    # 5. ปรับค่าตัวเลือกต่าง ๆ และบันทึก
    $database.DatabaseOptions.AnsiNullsEnabled = $false
    $database.DatabaseOptions.AutoShrink       = $true
    $database.DatabaseOptions.ReadOnly         = $true
    $database.DatabaseOptions.RecoveryModel    = [Microsoft.SqlServer.Management.Smo.RecoveryModel]::Full

    $database.Alter()
    Write-Host "เปลี่ยนตัวเลือกของฐานข้อมูล $DatabaseName สำเร็จ"
}
catch {
    # จัดการข้อผิดพลาด: แสดงข้อความและสิ้นสุดสคริปต์
    Write-Error "เกิดข้อผิดพลาดระหว่างการประมวลผล: $($_.Exception.Message)"
    # หากต้องการ log รายละเอียดเพิ่ม สามารถเพิ่มการเขียน log file ในส่วนนี้
}
finally {
    # ทำความสะอาดหรือคืนค่า Location เดิม
    Set-Location $PSScriptRoot
}
