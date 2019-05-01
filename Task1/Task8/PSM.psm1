#This Script Calculate 2 values
function get-calculate {
param (
    [Parameter(Mandatory = $true)]
    [int]$FirstNumber,
    [Parameter(Mandatory = $true)]
    [string]$Actionsymbol,
    [Parameter(Mandatory = $true)]
    [int]$SecondNumber
)
if ($Actionsymbol -eq "+") {
    $total=$FirstNumber + $SecondNumber
    Write-Host "Total is $total"
}
elseif ($Actionsymbol -eq "-") {
    $total=$FirstNumber - $SecondNumber
    Write-Host "Total is $total"
}
elseif ($Actionsymbol -eq "*") {
    $total=$FirstNumber * $SecondNumber
    Write-Host "Total is $total"
}
elseif ($Actionsymbol -eq "/") {
    $total=$FirstNumber / $SecondNumber
    Write-Host "Total is $total"
}
}