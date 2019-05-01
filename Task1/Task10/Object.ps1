function get-compinfo {
param (
    [Parameter(Mandatory=$true)]
    [string[]]$ComputerName
)
foreach($Computer in $ComputerName){
    $LogicDisk=Get-WmiObject -ComputerName $Computer -Class win32_logicaldisk -Filter "DeviceID='C:'"
    $OS=Get-WmiObject -ComputerName $Computer -Class win32_operatingsystem
}
$prop=[ordered]@{
    'ComputerName'=$Computer
    'User'=$os.RegisteredUser
    'Serial Number'=$os.serialnumber
    'FreeSpace'=$LogicDisk.FreeSpace /1gb -as [int]

}
$obj= New-Object -TypeName PSObject -Property $prop
Write-Output $obj
}