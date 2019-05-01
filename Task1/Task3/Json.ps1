param(
    [Parameter(Mandatory=$true)]
    [string]$FilePath,
    [Parameter(Mandatory=$true)]
    [string]$keyOrValue
)
$json=Get-Content $FilePath | ConvertFrom-Json
for($i=0;$i -lt $json.Count;$i++) {$json[$i]| Where-Object {$_ -like "*$keyOrValue*"} |  ForEach-Object {
    echo ""
    Write-Host RgName "=" $_.RgName 
    Write-Host AppName "=" $_.AppName
    Write-Host Name "=" $_.Name
    echo ""
}
}