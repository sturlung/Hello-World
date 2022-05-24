Add-Type -AssemblyName System.Windows.Forms

$tryb = $args

if ($tryb -eq "s") {

        while ($true) {

            $s = Get-PnpDevice | where {$_.instanceid -like "USB\VID_045E&PID_028E\5&307070B4&0&3"}

            if ($($s.Status) -ne "OK") {[System.Windows.Forms.MessageBox]::Show('Kontroler nieaktywny', 'Status kontolera')}


            Start-Sleep -Seconds 15
}
}
else {
        $s = Get-PnpDevice | where {$_.instanceid -like "USB\VID_045E&PID_028E\5&307070B4&0&3"}
        
        if ($s.Status -eq "OK"){[System.Windows.Forms.MessageBox]::Show('Kontroler aktywny', 'Status kontolera')}

        else {[System.Windows.Forms.MessageBox]::Show('Kontroler nieaktywny', 'Status kontolera')}
    }

    

    


