$choice = Read-Host "1. Raport użytkowników w Active Directory
2. Raport grup w Active Directory
Wybierz opcję 1 lub 2"

switch($choice){
1 {Write-Host "
Wybrałeś użytkowników"}
2 {Write-host "
Wybrałeś grupy"}
default {Write-Host "
Czytać ze zrozumieniem nie umiesz?"}
}
