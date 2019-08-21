param(
  [Parameter(Mandatory = $true)]
  [string]$jsonfilepath,
  [Parameter(Mandatory = $true)]
  [string]$changedjsonfilepath
)
$json=@"
{
    "glossary": {
     "title": "example glossary",
      "GlossDiv": {
       "title": "S",
        "GlossList": {
         "GlossEntry": {
           "ID": "SGML",
             "SortAs": "SGML",
             "GlossTerm": "Standard Generalized Markup Language",
             "Acronym": "SGML",
             "Abbrev": "ISO 8879:1986",
             "GlossDef": {
              "para": "A meta-markup language, used to create markup languages such as DocBook.",
             "GlossSeeAlso": ["GML", "XML"]
              },
              "GlossSee": "markup"
         }
        }
       }
     }
   }
   
"@
$json | Out-File $jsonfilepath
$json= get-content $jsonfilepath | ConvertFrom-Json
$atribs=$json.glossary.GlossDiv.GlossList.GlossEntry
foreach($atrib in $atribs) {$atribs.SortAs= 'OMPL'}
$json |ConvertTo-Json -Depth 100 | Out-File -FilePath $changedjsonfilepath