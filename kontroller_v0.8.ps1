Add-Type -AssemblyName System.Windows.Forms

function argcount ($z) {

$s = $z.count

switch ($s) {

{$s -gt 1} {return "gt"; break}
{$s -eq 1} {return "eq"; break}
{$s -eq 0} {return "0";break}

}

}


function whatarg ($z) {

$dozwolone = @("u", "s")

if ($z[0] -notin $dozwolone) {return "wrong arg"}

}


function checkforerrors ($z){

$count = argcount $z

$jaki = whatarg $z

if ($count -eq "gt"){[System.Windows.Forms.MessageBox]::Show('Dozwolony jednorazowo jest tylko jeden argument', 'Zbyt wiele argumentów'); return "error"}
elseif ($count -eq "0"){[System.Windows.Forms.MessageBox]::Show('Wybierz argument', 'Brak argumentu'); return "error"}
else {

    if ($jaki -eq "wrong arg"){

        [System.Windows.Forms.MessageBox]::Show('Dozwolone są następujące argumenty:
    
        "u" - skrypt działa jednorazowo i informuje o statusie kontrolera

        "s" - skrypt działa w tle i sprawdza co 15 s status kontrolera 
        informuje wyłącznie o nieaktywnym kontrolerze

        Można uzyć tylko jednego argumentu', 'Błędny argument')

        return "error"

    }


}


}



$tryb = $args[0]

if ($(checkforerrors $args) -eq "error") {Write-Host "Spróbuj ponownie"}
elseif ($tryb -eq "s") {

        while ($true) {

            $s = Get-PnpDevice | where {$_.friendlyname -like "*xbox*"}

            if ("OK" -notin $s.Status) {[System.Windows.Forms.MessageBox]::Show('Kontroler nieaktywny', 'Status kontolera')}


            Start-Sleep -Seconds 15
}
}
else {
        $s = Get-PnpDevice | where {$_.friendlyname -like "*xbox*"}
        
        if ("OK" -in $s.Status){[System.Windows.Forms.MessageBox]::Show('Kontroler aktywny', 'Status kontolera')}

        else {[System.Windows.Forms.MessageBox]::Show('Kontroler nieaktywny', 'Status kontolera')}
    }

    

