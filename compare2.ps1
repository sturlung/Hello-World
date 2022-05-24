$users = Get-ADUser -Filter * -Properties 'EmployeeID', 'EmailAddress' | select 'SamAccountName', 'EmailAddress', 'EmployeeID'


foreach ($user in $users){
$user
    $email = $user.EmailAddress
    $email
    $sam = $user.SamAccountName
    $sam
    $eID = $user.EmployeeID
    "*$eID*" -like $email

    if ($eID -like $sam) {$user | select SamAccountName, EmployeeID}
    if ($email -like "*$eID*") {$user.emailaddress}
    if ($email -like "*$sam*") {$user.samaccountname}
Read-Host          
}