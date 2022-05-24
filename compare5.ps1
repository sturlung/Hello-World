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

    $rezultat = @{}

    #Sam AccountName nie będzie nigdy puste, więc nie sprawdzamy $Null, tam gdzie porównywany jest $sam
    if ($eID -like $sam) {$rezultat.Set_Item("EmployeeID", $eid); $rezultat.Set_Item("SamAccountName", $sam)}
    if (($email -like "*$eID*") -and ($eid -ne $null)) {$rezultat.Set_Item("EmployeeID", $eid); $rezultat.Set_Item("EmailAddress", $email)}
    if ($email -like "*$sam*") {$rezultat.Set_Item("EmailAddress", $email); $rezultat.Set_Item("SamAccountName", $sam)}

    write-host "Rezultat"

    foreach ($atrybut in $rezultat.keys){
    write-host "$atrybut : $($rezultat[$atrybut])"
    }
    
Read-Host          
}