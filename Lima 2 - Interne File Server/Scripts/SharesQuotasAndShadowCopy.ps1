new-smbshare -name VerkoopData -Path: D:\ -EncryptData $True -FullAccess "IT Administratie" -ChangeAccess "Verkoop"
new-smbshare -name OntwikkelingData -Path: E:\ -EncryptData $True -FullAccess "IT Administratie" -ChangeAccess "Ontwikkeling"
new-smbshare -name ITData -Path: F:\ -EncryptData $True -FullAccess "IT Administratie"
new-smbshare -name DirData -Path: G:\ -EncryptData $True -FullAccess "IT Administratie" -ChangeAccess "Directie"
new-smbshare -name AdminData -Path: H:\ -EncryptData $True -FullAccess "IT Administratie" -ChangeAccess "Administratie"
new-smbshare -name HomeDirs -Path: Y:\ -EncryptData $True -FullAccess "IT Administratie" -ChangeAccess "everyone"
new-smbshare -name ProfileDirs -Path: Z:\ -EncryptData $True -FullAccess "IT Administratie" -ChangeAccess "everyone"
new-smbshare -name ShareVerkoop -Path: D:\ -EncryptData $True -FullAccess "IT Administratie" -ReadAccess "Ontwikkeling" -ChangeAccess "Verkoop"

