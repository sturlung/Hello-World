$players = @()

$shootertemplate = @{
    
    Health = 5

    Bullets = 5
    
    }

$shooting = {

    Write-Host "Who should I shoot?"
    $victimName = Read-Host

    foreach ($a in $players) {
    
        if ($a.Name -eq $victimName){
        
            if ($a.Health -le 0) {Write-host "He's already dead"}
            else {$a.Health = $a.Health - 1}
        
        }

    }
    
}

Write-host "How many contestants?"

Read-Host $number

for ($i=1; $i -le 10; $i++){

Write-host "Name player number $i :"
$name = Read-Host

New-Variable -Name $name -Value $shootertemplate | 

}