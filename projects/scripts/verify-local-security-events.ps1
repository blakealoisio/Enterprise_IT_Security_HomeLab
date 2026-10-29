# Project 001: Windows Authentication Investigation
# Purpose: Verify that Windows authentication events are recorded locally.
# Event ID 4624 = Successful logon
# Event ID 4625 = Failed logon
# Retrieves up to five matching events from the previous 30 minutes.
# Run in an elevated PowerShell session if required to access the Security log.

Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    Id = 4624,4625
    StartTime = (Get-Date).AddMinutes(-30)
} -MaxEvents 5 |
Select-Object TimeCreated, Id, ProviderName
