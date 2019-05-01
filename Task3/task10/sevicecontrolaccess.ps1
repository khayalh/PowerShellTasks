param (
    [Parameter(Mandatory=$true)]
    [string]$user,
    [Parameter(Mandatory=$true)]
    [string]$serviceName,
    [Parameter(Mandatory=$true)]
    [string]$serviceAccessRights
)
Import-Module PowerShellAccessControl
Get-Service $serviceName | Get-EffectiveAccess -Principal $user
Get-Service $serviceName | Add-AccessControlEntry -ServiceAccessRights $serviceAccessRights -Principal $user