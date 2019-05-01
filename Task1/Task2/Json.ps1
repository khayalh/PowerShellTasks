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
$json | Out-File "C:\Scripts\Task2\json.json"
$json= get-content "C:\Scripts\Task2\json.json" | ConvertFrom-Json
$atribs=$json.glossary.GlossDiv.GlossList.GlossEntry
foreach($atrib in $atribs) {$atribs.SortAs= 'OMPL'}
$json |ConvertTo-Json -Depth 100 | Out-File -FilePath C:\Scripts\Task2\jsonchanged.json