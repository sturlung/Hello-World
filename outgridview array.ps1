$userarray = @()

get-aduser -filter * | Out-file c://test.txt

$users = get-aduser -filter *
foreach ($user in $users) {

    $name = $user.givenname
    Write-Output "GivenName: $name" | out-file test.txt -Append

    $surname = $user.Surname
    Write-Output "Surname: $surname" | out-file test.txt -Append

    $email = $user.EmailAddress
    Write-Output "Email: $email" | out-file test.txt -Append

    $sam = $user.SamAccountName
    Write-Output "SamAccountName: $sam" | out-file test.txt -Append

    Write-output "" | out-file test.txt -Append     

    $userarray += ,@("GivenName: $name", "Surname: $surname", "Email: $email", "SamAccountName: $sam")
    $userarray_counter ++
                }

    $userarray | Out-GridView

