function Replace ([string]$Path, [string]$FirstValue, [string]$ChangeFirstValueTo, [string]$SecondValue, $ChangeSecondValueTo) {
    (get-content $Path) |
    ForEach-Object {$_.Replace("$FirstValue", "$ChangeFirstValueTo")} |
    ForEach-Object {$_.Replace("$SecondValue","$ChangeSecondValueTo")} |
    Set-Content $Path
}