param (
    [Parameter(mandatory = $true)]
    [string]$zipFileSourcePath,
    [Parameter(mandatory = $true)]
    [string]$zipFileDestinationPath
)
# Path for the workdir
$workdir = "c:\installer\"

# Check if work directory exists if not create it

If (Test-Path -Path $workdir -PathType Container)
{ Write-Host "$workdir already exists" -ForegroundColor Red}
ELSE
{ New-Item -Path $workdir  -ItemType directory }

# Download the installer

$source = "http://www.7-zip.org/a/7z1604-x64.msi"
$destination = "$workdir\7-Zip.msi"

# Check if Invoke-Webrequest exists otherwise execute WebClient

if (Get-Command 'Invoke-Webrequest') {
    Invoke-WebRequest $source -OutFile $destination
}
else {
    $WebClient = New-Object System.Net.WebClient
    $webclient.DownloadFile($source, $destination)
}

Invoke-WebRequest $source -OutFile $destination 

# Start the installation

msiexec.exe /i "$workdir\7-Zip.msi" /qn

# Wait XX Seconds for the installation to finish

Start-Sleep -s 35

# Remove the installer

rm -Force $workdir\7*
Function Expand-Archive([string]$zipFileSourcePath, [string]$zipFileDestinationPath) {
    $7z_Application = "C:\Program Files\7-Zip\7z.exe"
    $7z_Arguments = @(
        'x'							## eXtract files with full paths
        '-y'						## assume Yes on all queries
        "`"-o$($zipFileDestinationPath)`""		## set Output directory
        "`"$($zipFileSourcePath)`""				## <archive_name>
    )
    & $7z_Application $7z_Arguments 
    Remove-Item * -Include *.7z
}
Expand-Archive -zipFileSourcePath $zipFileSourcePath -zipFileDestinationPath $zipFileDestinationPath