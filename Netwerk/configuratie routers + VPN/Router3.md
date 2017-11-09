Configuratie voor Router3:

```
enable
configure terminal
hostname Router3
line console 0
password cisco
login
exit
ip domain-name SSH1
crypto key generate rsa
1024
line vty 0 15
login local
transport input ssh
ip ssh version 2
int Se0/0
ip add 192.168.0.2 255.255.255.0
no shut
int Se0/2
ip add 192.168.2.2 255.255.255.0
no shut
int Se0/1
ip add 192.168.4.1 255.255.255.0
no shut
exit
ip route 172.16.129.0 255.255.255.0 192.168.2.1
ip route 172.18.0.0 255.255.255.0 192.168.4.2
ip route 192.168.3.0 255.255.255.0 192.168.2.1
ip route 192.168.1.0 255.255.255.0 192.168.0.1
ip route 0.0.0.0 0.0.0.0 192.168.0.1
end
copy running-config startup-config

```