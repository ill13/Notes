# get-aduser -f * -pr lastlogondate | ft samaccountname,LastLogonDate,Enabled -auto
#Windows: Install Settings | Optional Features | RSAT
# VSCode:
# in user.json add
# "powershell.integratedConsole.suppressStartupBanner": true,
# Start-ADSyncSyncCycle -PolicyType Delta


# NOTES:
# If you run a task manually it will go to "running" in task scheduler library. Wait until your task finishes and then hit F5 to refresh.

# Command: 
# powershell -ExecutionPolicy Bypass c:\add_mail_access.ps1

# This portion is for script credentials. It should be portable 
$username = "admin@email.com"
$password = Get-content "C:\mysecurestring.txt" | ConvertTo-SecureString
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $password
$credentials = get-credential -credential $cred

# Use this command to encrypt your password
# Read-Host -assecurestring | convertfrom-securestring | out-file C:\mysecurestring.txt


# How you would like to use the stored credentials
Connect-Exchangeonline -credential $credentials


# Whom to give group email access to
$User = "name@email.com"


# Define what group / OU you want to exteract names from.. 
$JobTitle = "Service Manager"  

# Write the usernames to a file to verify
# Get-ADUser -Filter {Title -like $JobTitle} -SearchBase "ou=$($OU),dc=$($DOMAIN_CCONTROLLER),dc=local" | Select SamAccountName | export-csv c:\tmp\sms.csv

$ServiceManagers = Get-ADUser -Filter {Title -like $JobTitle} -SearchBase "ou=$($OU),dc=$($DOMAIN_CCONTROLLER),dc=local" | Select -ExpandProperty SamAccountName 


ForEach ($SM In $ServiceManagers)
{
    # convert SAM to emil
    $TMP_User="$($SM)@email.com"
    
    Get-Mailbox -identity $TMP_User | add-MailboxPermission -User $User -AccessRights FullAccess -InheritanceType all -automapping $false

    # Remove-MailboxPermission -Identity $TMP_User -User $User -AccessRights FullAccess -InheritanceType All -Confirm:$false
    
    Write-Host $TMP_User
}

Write-Host "`n Task completed...`n"


