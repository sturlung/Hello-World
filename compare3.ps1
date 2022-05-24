$users = Get-ADUser -Filter * -Properties 'EmployeeID', 'EmailAddress' | select 'SamAccountName', 'EmailAddress', 'EmployeeID'


foreach ($user in $users){
    write-host "Dane wejściowe"
    $email = $user.EmailAddress
    write-host "email: $email"
    $sam = $user.SamAccountName
    write-host "sam: $sam"
    $eID = $user.EmployeeID
    Write-host "eid: $eID"
    Read-host
    $a = 0
    write-host "Rezultat"
    if (($email -like "$eID*") -and ($eid -ne $null)) {write-host "EmailAddress: $email"; Write-Host "EmployeeID: $eid"; $a = 1}
    elseif (($email -like "*$sam*") -and ($sam -ne $null)) {write-host "EmailAddress: $email"; Write-Host "SamAccountName: $sam"; $a = 2}
    if ($eID -like $sam) {If ($a -eq 1) {Write-Host "SamAccountName: $sam"} 
                          elseif ($a -eq 2){Write-Host "EmployeeID: $eid"}
                          else {Write-Host "EmployeeID: $eid"; Write-Host "SamAccountName: $sam"}}
Read-Host          
}