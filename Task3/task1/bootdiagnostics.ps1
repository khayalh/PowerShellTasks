param (
    [Parameter(mandatory = $true)]
    [string]$resourceGroupName,
    [Parameter(mandatory = $true)]
    [string]$vmName,
    [Parameter(mandatory = $true)]
    [string]$logsPath
)
$saname = (Get-AzureRmStorageAccount -ResourceGroupName $resourceGroupName).StorageAccountName
$vm = Get-AzureRmVM -ResourceGroupName $resourceGroupName -Name $vmname
Set-AzureRmVMBootDiagnostics `
    -VM $vm `
    -Enable `
    -ResourceGroupName $resourceGroupName `
    -StorageAccountName $saname
$connection = (Get-AzureRmStorageAccount -ResourceGroupName $resourceGroupName -Name $saname).Context.ConnectionString
$context = New-AzureStorageContext -ConnectionString $connection 
$containername = (Get-AzureStorageContainer -Name *bootdiagnostics* -Context $context).Name
$blobs = Get-AzureStorageblob -Container $containername -Context $context 
New-item -ItemType Directory -Path $logspath
foreach ($blob in $blobs) {   
    Get-AzureStorageBlobContent `
        -Container $containername `
        -Blob $blob.Name `
        -Destination $logspath `
        -Context $context
}
get-content -Path $logspath\*.log | select-string "EVENT" -CaseSensitive