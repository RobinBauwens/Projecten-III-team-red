﻿#Groep policies aanmaken en linken met OU's
new-gpo -name ControlPanelGameLink | new-gplink -target "OU=Administratie,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Verkoop,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=IT Administratie,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Ontwikkeling,OU=RED,DC=red,dc=local"
New-GPLink -Name ControlPanelGameLink -Target "OU=Directie,OU=RED,DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name Netwerkadapter | new-gplink -target "OU=Verkoop,OU=RED,DC=red,dc=local"
New-GPLink -Name Netwerkadapter -Target "OU=IT Administratie,OU=RED,DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name FileServer | new-gplink -target "DC=red,dc=local"

#Groep policies aanmaken en linken met OU's
new-gpo -name SQLpoortenVoorSCCM2012R2 | new-gplink -target "DC=red,dc=local"


#Policies importeren
Import-GPO -BackupID "058EA888-9327-48D6-98A4-DCA8FF5ACC64" -Path "D:\backup\" -TargetName "Netwerkadapter"
Import-GPO -BackupID "C1C534A3-1039-42B5-9C3A-CBFBD710B182" -Path "D:\backup\" -TargetName "ControlPanelGameLink"
Import-GPO -BackupID "A6C24491-2822-4A58-B11F-605982B160D5" -Path "D:\backup\" -TargetName "FileServer"
Import-GPO -BackupID "09068053-EC76-4B2A-B9FE-0BC6DD0290D1" -Path "D:\backup\" -TargetName "SQLpoortenVoorSCCM2012R2"