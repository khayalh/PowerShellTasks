$filepath = "C:\Scripts\Task4\Tast4.txt"
$url="https://drive.google.com/uc?authuser=0&id=1wo1cyEEONsWL48dCMcDxNyxeaR6O1SOP&export=download"
$output="C:\Users\Khayal\Desktop\test.txt"
$printer="\\printsrv01.atl.lan\Xerox_7830_(City Point IT)"
$start_time = Get-Date 
$file = Test-Path $filepath 
if($file) {
   Get-Content $filepath | Out-Printer -Name $printer
}
else {
Invoke-WebRequest -Uri $url -OutFile $output
}
Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"