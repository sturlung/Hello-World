
function ramka ($shit){

$le = $shit.text

$l = $le.length +2

$frame = "+" + ("-" * $l) + "+"

return $frame

}


function kolory {

$c = Get-Random(1,2,3,4)

switch ($c) {
1 {$color = "Blue";break}
2 {$color = "Red";break}
3 {$color = "green"; break}
4 {$color = "white"; break}
}
return $color
}

function display ($shit, $color, $frame, $time){

$shait = $shit.text

write-host $frame -ForegroundColor Green
write-host ("| $shait |")
write-host $frame -foregroundcolor $color
write-host
write-host "Ta reklama wyświetlana jest przez $time sekund"

Start-Sleep -Seconds $time
cls
}

$bull = Import-Csv -Path ".\data-reklamy.csv"

$all = 0

foreach ($wpis in $bull) {$all = $all + $wpis.czas} 

While($true){

foreach ($shit in $bull){             #to nie komentarz do samego zadania, raczej mojej niechęci do reklam ;)

$frame = ramka $shit
$color = kolory
[double]$t = (($shit.czas)/$all)*3600
$time = [math]::Round($t)

display $shit $color $frame $time

}
}

