param (
    [Parameter(Mandatory = $true)]
    [string]$path,
    [Parameter(Mandatory = $true)]
    [string]$user
)
New-Item -ItemType Directory -Path $path
$Acl = Get-Acl $path

$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($user, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")

$Acl.SetAccessRule($Ar)
Set-Acl $path $Acl