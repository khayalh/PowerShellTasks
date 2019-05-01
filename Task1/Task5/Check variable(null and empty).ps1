param(
    [Parameter(Mandatory = $true)]
    [string]$Newvar
)

$Newvar = $Newvar.TrimStart().TrimEnd()
if (!$Newvar) {Write-Host " Variable value is Null or Empty"}

elseif ($Newvar) {
    Write-Host "Variable value isn't null";
    Write-Host "Variable value is $Newvar" 
}