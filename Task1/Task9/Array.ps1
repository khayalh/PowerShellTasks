function get-compinfo {
param (
    [Parameter(Mandatory=$true)]
    [string[]]$ComputerName
)
foreach($Computer in $ComputerName){
    $LogicDisk=Get-WmiObject -ComputerName $Computer -Class win32_logicaldisk -Filter "DeviceID='C:'"
    $PhysicalMemory=Get-WmiObject -ComputerName $Computer -Class win32_physicalmemory
}
$myarray=[ordered]@{
    'ComputerName'=$Computer
    'Disk ID'=$LogicDisk.DeviceID
    'FreeSpace Disc C'=$LogicDisk.FreeSpace /1gb -as [int]
    'MemorySize First RAM'=$PhysicalMemory[0].Capacity /1gb -as [int]
    'First RAM Manufacturer'=$PhysicalMemory[0].Manufacturer
    'MemorySize Second RAM'=$PhysicalMemory[1].Capacity /1gb -as [int]
    'Second RAM Manufacturer'=$PhysicalMemory[1].Manufacturer
}
Write-Output $myarray
}