param (
    [Parameter(mandatory = $true)]
    [string]$certlocalPath,
    [Parameter(mandatory = $true)]
    [securestring]$certpass,
    [Parameter(mandatory = $true)]
    [string]$certStoreLocation
)
(Import-PfxCertificate -FilePath $certlocalPath -CertStoreLocation $certStoreLocation -Password $certpass).Thumbprint