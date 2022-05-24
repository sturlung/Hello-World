$users = Import-Csv "C:\temporary\kurwa.csv" -Delimiter ";"




foreach ($user in $users){
Write-Host "$($user.imiona) $($user.nazwiska)" 
$Login = Read-Host Provide Login
$FirstName = $user.imiona 
$Surname = $user.nazwiska
$DisplayName = $FirstName + " " + $Surname
$Path = "OU=TestUsers, OU=Domain Users,DC=Laboratory,DC=local"
$pw = Read-Host -Prompt 'Enter Password for Account' -AsSecureString
$EmailAddress = $FirstName + "." + $Surname + "@gmail.com"
$number = (Get-ADObject -Filter * -SearchBase "OU=TestUsers, OU=Domain Users,DC=Laboratory,DC=local").count
$EmployeeID = "ID" + 3000 + $number
$NewUser = New-ADUser -SamAccountName $Login -Name $Login -UserPrincipalName $Login@EMTEST.net -EmailAddress $EmailAddress -GivenName $FirstName -Surname $Surname -DisplayName $DisplayName -EmployeeID $EmployeeID -Path $Path -AccountPassword $pw -Enabled $true -PassThru
if ($NewUser.DistinguishedName -ne $null) {
Get-ADUser $Login -Properties DistinguishedName, EmployeeID, EmailAddress, DisplayName}
Read-Host
cls
}