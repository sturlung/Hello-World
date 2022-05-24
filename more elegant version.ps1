#zaczynamy od zadania pytania userowi i zapisania jego wyboru

$choice = Read-Host "1. Raport użytkowników w Active Directory
2. Raport grup w Active Directory
Wybierz opcję 1 lub 2"

#Tworzymy switcha, który będzie ramą reszty skryptu

switch($choice){ #deklaracja switcha
1 {Write-Host "
Wybrałeś użytkowników" #Użytkownik wybrał opcję 1. Dajemy mu znać, że zauważyliśmy.

    #pobieramy użytkowników pamiętając, że chcemy adres email też
    $users = Get-ADUser -Properties EmailAddress -Filter * | select 'GivenName' , 'Surname' , 'EmailAddress' , 'SamAccountName' #ale poza tymi czterema atrybutami nie potrzeba nam innych

    $Output = $env:USERPROFILE + "\Desktop\Raport-Data.txt" #wynik będzie na pulpicie użytkownika, więc ustawiamy ścieżkę i nazwę pliku

    $users | Out-GridView -passthru | Out-File -FilePath $Output #użytkownik wybiera, których userów chce mieć w raporcie, po czym raport ląduje w wyżej zdefiniowanym pliku
  }

2 {Write-host "
Wybrałeś grupy" #Użytkownik wybrał opcję 1. Dajemy mu znać, że zauważyliśmy.
  
  $Output = $env:USERPROFILE + "\Desktop\GRaport-Data.txt" #analogicznie jak w opcji 1

  get-adgroup -filter * | Out-GridView -PassThru | Out-File -FilePath $Output #pobieramy grupy, użytkownik wybiera w osobnym oknie, które chce w raporcie, po czym zapisujemy plik
    }

#Jeśli użytkownik wklepie co innego niż dane mu wyżej opcje, nie chcemy błędu, ale chcemy mu dać znać, że skopał.
default {Write-Host " 
Czytać ze zrozumieniem nie umiesz?"} 
}
