param (
    [Parameter(mandatory = $true)]
    [string]$displayName,
    [Parameter(mandatory = $true)]
    [string]$direction,
    [Parameter(mandatory = $true)]
    [string]$action,
    [Parameter(mandatory = $true)]
    [string]$protocol,
    [Parameter(mandatory = $true)]
    [string]$localport
)
New-NetFirewallRule -DisplayName $displayName -Direction $direction -Action $action -Protocol $protocol -LocalPort $localport