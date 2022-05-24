$Login = Read-Host Provide Login
$FirstName = Read-Host Provide FirstName
$Surname = Read-Host Provide Surname
$DisplayName = $FirstName + " " + $Surname
$Path = "OU=Domain Users,DC=TestDomain,DC=local"
$pw = Read-Host -Prompt 'Enter Password for Account' -AsSecureString
$EmailAddress = $FirstName + "." + $Surname + "@gmail.com"
$number = (Get-ADObject -Filter * -SearchBase "OU=Domain Users,DC=TestDomain,DC=local").count
$EmployeeID = "ID" + 3000 + $number
$NewUser = New-ADUser -SamAccountName $Login -Name $Login -UserPrincipalName $Login@EMTEST.net -EmailAddress $EmailAddress -GivenName $FirstName -Surname $Surname -DisplayName $DisplayName -EmployeeID $EmployeeID -Path $Path -AccountPassword $pw -Enabled $true -PassThru
if ($NewUser.DistinguishedName -ne $null) {
Get-ADUser $Login -Properties DistinguishedName, EmployeeID, EmailAddress, DisplayName}