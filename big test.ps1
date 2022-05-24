function menu (){
Write-Host "Witam w moim super fancy skrypcie do generowania raportów z AD" -BackgroundColor White -ForegroundColor Red
Write-Host "Do wyboru masz raport użytkowników i raport grup" -BackgroundColor White -ForegroundColor Black
Write-Host "Będziesz również mieć możliwość wyboru konkretnych użytkowników lub grup, które mają trafić do raportu" -BackgroundColor White -ForegroundColor Blue
write-host ""
Write-Host "Naciśnij Enter aby kontynuować" -BackgroundColor White -ForegroundColor green
$enter = Read-Host #Coby nie było echa

$1 = "1. Raport użytkowników w Active Directory"
$2 = "2. Raport grup w Active Directory"
$choose = ($1, $2)

$choice = $choose | Out-GridView -passthru #Dzięki temu nie trzeba pytać usera do usrania o odpowiedź w ramach parametrów

if ($choice -eq $1)
    {$result = 1}
else
    {$result = 2}

return $result
}

function juzerzy (){

$users = Get-ADUser -Properties EmailAddress -Filter * | select 'GivenName' , 'Surname' , 'EmailAddress' , 'SamAccountName' #ale poza tymi czterema atrybutami nie potrzeba nam innych
$data = get-date -f "yyyy.MM.dd"
$OutputPath = $env:USERPROFILE + "\Desktop\Raport-$data.csv"
$selected = $users | Out-GridView -passthru
$report = @("GivenName,Surname,EmailAddress,SamAccountName") #Nagłówki

foreach ($user in $selected){
    $name = $user.GivenName   #jeśli próbowałem dodawać poszczególne atrybuty bez pośrednictwa zmiennych,
    $surname = $user.Surname  #dodawała się zamiast tego cała zmienna + ".GivenName" czy coś takiego, więc
    $email = $user.EmailAddress #pośrednik jes ewidentnie potrzebny
    $sam = $user.SamAccountName
    $report += "$name,$surname,$email,$sam"
}

$report | Out-File -FilePath $OutPutpath
}


function grupy () {
$groups = Get-ADGroup -filter *
$Gdata = get-date -f "yyyy.MM.dd"
$GOutputPath = $env:USERPROFILE + "\Desktop\GRaport-$Gdata.csv"
$Gselected = $groups | Out-GridView -passthru
$Greport = @("DistinguishedName;GroupCategory;GroupScope;Name;ObjectClass;ObjectGUID;SamAccountName;SID") #Nagłówki
#używam średnika, żeby łatwiej się importowało w Excelu, bo w DistinguishedName są już przecinki

foreach ($group in $Gselected){
    $dname = $group.DistinguishedName   #jeśli próbowałem dodawać poszczególne atrybuty bez pośrednictwa zmiennych,
    $category = $group.GroupCategory  #dodawała się zamiast tego cała zmienna + ".GivenName" czy coś takiego, więc
    $scope = $group.GroupScope #pośrednik jes ewidentnie potrzebny
    $name = $group.Name
    $class = $group.ObjectClass
    $guid = $group.ObjectGUID
    $san = $group.SamAccountName
    $sid = $group.SID

    $Greport += "$dname;$category;$scope;$name;$class;$guid;$san;$sid"
}
$Greport | Out-File -FilePath $GOutPutpath
}



$sowhichisit = menu #body skryptu :D  Krótkie, co nie?

if ($sowhichisit -eq 1){
juzerzy
}
else {
grupy
}

Read-Host "Your report waits on your Desktop. Please press enter to exit"