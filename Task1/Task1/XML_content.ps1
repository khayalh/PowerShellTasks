param(
  [Parameter(Mandatory = $true)]
  [string]$xmlfilepath,
  [Parameter(Mandatory = $true)]
  [string]$changedxmlpath
)
$xml=[xml]@"
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
  <h2>My CD Collection</h2>
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Title</th>
      <th>Artist</th>
    </tr>
    <tr>
      <td>.</td>
      <td>.</td>
    </tr>
  </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>

"@
Write-Output $xml
$xml.Save($xmlfilepath)
for ($a = 0; $a -lt 26; $a++) 
{[char](65+$a)
$b=([char](65+$a))
$filePathToTask = $xmlfilepath
$xml=New-Object xml
$xml.Load($filePathToTask)
$element =  $xml.SelectSingleNode("//th")
$element.InnerText = "$b"
$xml.Save("$changedxmlpath\xml$b.xml")
}