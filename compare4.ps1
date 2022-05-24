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
    write-host "Rezultat"
    if (($email -like "$eID*") -and ($eid -ne $null)) {
        if ($eID -like $sam) {Write-Host "SamAccountName: $sam"; Write-Host "EmailAddress: $email"; Write-Host "EmployeeID: $eid"}
        else {Write-Host "EmailAddress: $email"; Write-Host "EmployeeID: $eid"}
        }
    elseif ($email -like "*$sam*") {Write-Host "SamAccountName: $sam"; Write-Host "EmailAddress: $email"}
    elseif ($eID -like $sam){Write-Host "SamAccountName: $sam"; Write-Host "EmployeeID: $eid"}
                          
Read-Host          
}