$tryb = $args

switch ($args) {

    "s" {
        $s = Get-PnpDevice | where {$_.instanceid -like "USB\VID_045E&PID_028E\5&307070B4&0&3"}
        if ($s.Status -eq "OK"){write-host "Kontoler podłączony"}

        else {Write-Host "Podłącz kontroler i sprawdź jeszcze raz"}
    }

    "u" {Get-PnpDevice | where {$_.instanceid -like "USB\VID_045E&PID_028E\5&307070B4&0&3"} | Out-GridView}

}
