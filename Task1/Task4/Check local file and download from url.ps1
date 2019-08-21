param(
  [Parameter(Mandatory = $true)]
  [string]$filepath,
  [Parameter(Mandatory = $true)]
  [string]$url,
  [Parameter(Mandatory = $true)]
  [string]$printer
)
$start_time = Get-Date 
$file = Test-Path $filepath 
if($file) {
   Get-Content $filepath | Out-Printer -Name $printer
}
else {
Invoke-WebRequest -Uri $url -OutFile $filepath
}
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"