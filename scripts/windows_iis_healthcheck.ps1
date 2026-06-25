# Basic Windows Server and IIS health check example.
# Run in PowerShell as Administrator for full results.

Write-Host "===== BASIC SERVER INFORMATION ====="
Get-ComputerInfo | Select-Object CsName, WindowsProductName, OsVersion

Write-Host "`n===== DISK USAGE ====="
Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free

Write-Host "`n===== IMPORTANT SERVICES ====="
Get-Service | Where-Object { $_.Name -in @("W3SVC", "WinRM") } | Select-Object Name, Status, StartType

Write-Host "`n===== IIS WEBSITE STATUS ====="
if (Get-Module -ListAvailable -Name WebAdministration) {
    Import-Module WebAdministration
    Get-Website | Select-Object Name, State, PhysicalPath, Bindings
} else {
    Write-Host "IIS WebAdministration module is not installed."
}
