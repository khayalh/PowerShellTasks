param (
    [int]$FirstNumber,
    [string]$Actionsymbol,   
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