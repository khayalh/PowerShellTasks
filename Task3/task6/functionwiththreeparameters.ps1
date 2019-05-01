function Replace ([string]$Path, [string]$firstValue, [string]$secondValue) {
    (get-content $Path) |
    ForEach-Object {$_.Replace("$firstValue", "Hesenov")} |
    ForEach-Object {$_.Replace("$secondValue","07.09.1995")} |
    Set-Content $Path
}