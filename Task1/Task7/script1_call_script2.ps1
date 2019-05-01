param (
    [Parameter(Mandatory = $true)]
    [int]$First,
    [Parameter(Mandatory = $true)]
    [string]$Act,   
    [Parameter(Mandatory = $true)]
    [int]$Second
)
if ($Act -match "\W" -and $Act  -match "\S") {
    C:\Scripts\Task7\call_script2_from_first.ps1 -FirstNumber $First -Actionsymbol $Act -SecondNumber $Second
}
else {
    Write-Host "Your action value isn't Right"
}