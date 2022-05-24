
function ramka ($shit){

$l = $shit.length +2

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

function display ($shit, $color, $frame){

write-host $frame -ForegroundColor Green
write-host ("| $shit |")
write-host $frame -foregroundcolor $color

Start-Sleep -Seconds 7
cls
}

$bull = Get-Content -Path ".\data-reklamy.txt"

While($true){

foreach ($shit in $bull){             #to nie komentarz do samego zadania, raczej mojej niechęci do reklam ;)

$frame = ramka $shit
$color = kolory

display $shit $color $frame

}
}

