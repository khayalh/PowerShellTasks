param (
    [Parameter(Mandatory = $true)]
    [int]$First,
    [Parameter(Mandatory = $true)]
    [string]$Act,   
    [Parameter(Mandatory = $true)]
    [int]$Second
)
Import-Module C:\Scripts\Task8\PSM.psm1
get-calculate -FirstNumber $First -SecondNumber $Second -ActionSymbol $Act