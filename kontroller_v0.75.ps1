Add-Type -AssemblyName System.Windows.Forms

$tryb = $args

if ($tryb -eq "s") {

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

    

