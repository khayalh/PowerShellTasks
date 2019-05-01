param (
    [Parameter(Mandatory = $true)]
    [string]$username,
    [Parameter(Mandatory = $true)]
    [securestring]$password,
    [Parameter(Mandatory = $true)]
    [string]$fullName,
    [Parameter(Mandatory = $true)]
    [string]$localGroup
)
New-LocalUser -Name $username -Password $password -FullName $fullName
Add-LocalGroupMember -Group $localGroup -Member $username