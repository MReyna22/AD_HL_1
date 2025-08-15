#Script to create a new AD user with the parameters in by the user

#Getting parameters for script from user
param (
    [Parameter(Mandatory=$true)]
    [string]$FirstName, 

    [Parameter(Mandatory=$true)]
    [string]$LastName, 

    [Parameter(Mandatory=$true)]
    [string]$UserName,

    [Parameter(Mandatory=$true)]
    [string]$OU, 

    [Parameter(Mandatory=$true)]
    [string]$Domain 

)

#Generate Random Password
$Password = -join((0x30..0x39)+(0x41..0x5A)+(0x61..0x7A) | Get-Random -Count 12 | `
ForEach-Object {[char]$_}) 
Write-Host "Password Generated as: $Password"

$SecurePassword = ($Password | ConvertTo-SecureString -AsPlainText -Force)
$ADPath = "OU=$OU,DC=mreyna,DC=com" 


#Make a call to New-ADUser to create the AD user
New-ADUser `
    -SamAccountName $UserName `
    -UserPrincipalName "$UserName@$Domain" `
    -Name "$FirstName $LastName" `
    -GivenName $FirstName `
    -Surname $LastName `
    -AccountPassword $SecurePassword `
    -Enable $true `
    -Path $ADPath `
    -PasswordNeverExpires $false `
    -ChangePasswordAtLogon $true

#Save credientials to a secure local file
$LogPath = "C:\UserCreationLogs\ADUserPasswords.csv"
if (!(Test-Path (Split-Path $LogPath))) {
   New-Item -Path (Split-Path $LogPath) -ItemType Directory -Force | Out-Null
}
$LogEntry = [PSCustomObject]@{
    Timestamp = (Get-Date).ToString("yyy-mm-dd HH:mm:ss") 
    Username = $UserName 
    FullName = "$FirstName $LastName"
    Password = $Password 
    OU = $OU 
    Domain = $Domain
}
$LogEntry | Export-Csv -Path $LogPath -Append -NoTypeInformation
