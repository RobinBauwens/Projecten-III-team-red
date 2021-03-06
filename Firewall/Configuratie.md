# Configuratie pfSense

We gaan de firewall configureren met volgende instellingen:
- Keymap: `be.iso.kbd: Belgian ISO-8859-1`
- Partitioning: `Auto (UFS)`

**Hierna wordt pfSense geïnstalleerd.**


Na het heropstarten:

1. "Enter the parent interface name for the new VLAN (or nothing if finished):"
Druk hierna op `<Enter>`.

2. We steken een kabel in, in `bge0`, zodat deze de WAN-interface wordt.

3. We veranderen het IP-adres (niet default 192.168.1.1/24) door te kiezen voor `2) Set interface(s) IP address`.

### Configuratie WAN-interface

We kiezen voor `1 - WAN (em0 - static)`.


- `Configure IPv4 address WAN interface via DHCP? (y/n)`: 

  Geef `n` in.
  
- `Enter the new WAN IPv4 address. Press <ENTER> for none:`:

  Geef `172.18.2.114/28` in.
  
- `Enter the new WAN IPv4 subnet bit count (1 to 31):`:

  Geef `28` in.
  
- `For a WAN, enter the new WAN IPv4 upstream gateway address.`:

  Geef `172.18.2.113` in.
  
- `Configure IPv6 address WAN interface via DHCP? (y/n)`: 

  Geef `n` in.
  
- `Enter the new WAN IPv6 address. Press <ENTER> for none:`:

  Druk op `Enter`.
  
- `Do you want to revert to HTTP as the webConfigurator protocol? (y/n)`:

   Geef `n` in.
  
 Hierna worden de instellingen toegepast.
 
 ### Configuratie LAN-interface
 
 We kiezen voor `2 - LAN (em1 - static)`.
  
  
- `Enter the new LAN IPv4 address. Press <ENTER> for none:`:

  Geef `172.18.2.98/28` in.
  
- `Enter the new WAN IPv4 subnet bit count (1 to 31):`:

  Geef `28` in.
  
- `For a LAN, press <ENTER> for none:`:

  Druk op `Enter`.
  
- `Enter the new LAN IPv6 address. Press <ENTER> for none:`:

  Druk op `Enter`.
  
- `Do you want to enable the DHCP server on LAN? (y/n)`:

  Geef `n` in.
  
- `Do you want to revert to HTTP as the webConfigurator protocol? (y/n)`:

   Geef `n` in.  

 Hierna worden de instellingen toegepast.
 

Ook verbinden we een 2de kabel met een hostmachine (geef deze een IP-adres van `172.18.2.99`.)

![IP Fedora](img/IPFedora.PNG)


[Zie IP-adressen schema](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/files/Lokaal%20netwerk/VLSM-red.pdf)

*Onderste poort is WAN, bovenste is LAN.*

![Voorbeeld](img/1.jpg)
![Voorbeeld](img/2.jpg)
![Voorbeeld](img/3.jpg)


## Basisconfiguratie pfSense

We overlopen de `Setup Wizard` in `System`.

1. Klik op `Next`.
2. Klik nogmaals op `Next`.
3. We vullen `General Information` in:

- Hostname: `pfSense`
- Domain: `red`
- Primary DNS Server: `172.18.2.67`
- Secondary DNS Server: `172.18.2.68`

![Wizard](img/wiz.PNG)

4. Bij `Time Server Information` veranderen we Timezone naar `Europe/Brussels`.
5. De instellingen bij `Configure WAN Interface` zouden al ingesteld moeten zijn en hier veranderen we dus niets.
6. Ditto voor `Configure LAN Interface`.
7. Indien nodig kan je het paswoord wijzigen bij `Set Admin WebGUI Password`: we geven `pfsense` in.
8. Klik op `Next`, nu kan je de server reloaden met `Reload`.

# Afbeeldingen + verloop

## Interfaces

![Verloop](img/extra/1.PNG)

### Interfaces / WAN

![Verloop](img/extra/5.PNG)

## System / Advanced / Admin Access
<!--
![Verloop](img/extra/2.PNG)
![Verloop](img/extra/2.2.PNG)
-->
Het belangrijkste hier is dat we een hostnaam instellen en SSH activeren.

**Alternate hostname: zonder spaties!**
![Verloop](img/extra/2.1.PNG)

## System / General Setup

Hierbij kunnen we enkele instellingen controleren die we ingegeven hebben in de `Setup Wizard`.

Zorg er ook voor dat de `DNS Forwarder/DNS Resolver`-functie van pfSense **niet** gebruikt wordt!

![Verloop](img/extra/3.PNG)
![Verloop](img/extra/3.1.PNG)
![Verloop](img/extra/3.2.PNG)



![Verloop](img/extra/3.3.PNG)

## System / Routing / Gateways

We passen hier de `Description` aan, dit is optioneel.

![Verloop](img/extra/4.PNG)

## Services / DNS Resolver / General Settings

Disable de DNS resolver.

![Verloop](img/extra/6.PNG)
![Verloop](img/extra/6.1.PNG)


**Schakel DNS Forwarder bij "Services" ook zeker uit (indien dit vooraf nog niet gebeurde)!**

<!--
## Wizard
![Verloop](img/extra/wiz1.PNG)
![Verloop](img/extra/wiz2.PNG)
![Verloop](img/extra/wiz3.PNG)
![Verloop](img/extra/wiz4.PNG)
-->

## Aliassen

Dit deel is optioneel maar kan handig zijn voor latere configuratie.

`Firewall` -> `Aliases` -> `IP`

![Aliassen IP](img/firewall/aliassen.PNG)

`Firewall` -> `Aliases` -> `Ports`

![Aliassen ports](img/allPorts.PNG)

<!--
Teveel ports... rond 5-6 ports nodig
![Rules aliassen](img/firewall/ports.PNG)
![Rules aliassen](img/firewall/portsDC.PNG)
![Rules aliassen](img/firewall/portsMonitoring.PNG)
**Opmerking:** 
- `Dynamic (TCP/UDP)` werd nog niet toegevoegd voor DC's.
- `High port ranges 49152-65535 and 1024-5000` werden nog niet toegevoegd voor monitoring-server.
-->

## Rules

In deze sectie gaan we kiezen welke protocollen er toegelaten worden om het netwerk te verlaten of binnen te komen.

`Firewall` -> `Rules`

### LAN

We laten toe dat al het LAN-verkeer naar buiten mag, hier gaan we dus een `permit any` gebruiken.

<!--
We voegen enkele poorten toe:
-->

[PDF alle geconfigureerde rules LAN](files/RULES_LAN.pdf)

Wijziging: in plaats van alle poorten (die voor het LAN gebruik worden) allemaal mee te geven, geven we mee dat alles (`*`) toegelaten wordt.

<!-- Van binnen naar buiten -->

### WAN

We filteren al het verkeer dat van buitenaf komt, niet alles mag de firewall passeren (naar binnen).

[PDF alle geconfigureerde rules LAN](files/RULES_WAN.pdf)

Enkele protocollen (zoals HTTP, SMTP, IMAP, POP3, etc.) mag wel toegelaten wordt als inkomend verkeer, deze zullen behandeld worden door onze eigen servers. De rest wordt dan geblokkeerd en zal dus het LAN van `red.local` niet bereiken.

**Opgelet:** ICMP wordt niet toegelaten en dus zullen pings ook de firewall **niet** passeren. Dit betekent niet dat de server onbereikbaar is voor anderen.

<!-- Van buiten naar binnen -->

## Routes

*Om enkel te controleren of de routes in orde zijn, kunnen we tijdelijk het filteren van de packets uitschakelen.* Advanced -> Firewall & NAT. Dit zetten we natuurlijk uit om de het filteren van het verkeer te testen/gebruiken.

We voegen routes toe naar VLAN 200, 300, 500 en 999 (native). Er staan ook routes naar netwerk `0.0.0.0/1` en `128.0.0.0/1` in, dit om een default static route te simuleren (`0.0.0.0/0` is niet mogelijk in pfSense). Hiernaast is er ook een route naar `172.18.0.0/16` om alles te routeren binnen `red.local`. Deze 3 routes zijn uitgeschakeld en worden dus niet toegepast op de firewall.

![Routes](img/routes.jpg)

## Gateways

We hebben ook 3 gateways gedefinieerd; 2 WAN en 1 LAN gateway.

`GW_ROUTERIN` 172.18.2.97 dient als gateway voor het intern verkeer (naar `red.local`), `WAN_DHCP6` dient voor IPv6 en is uitgeschakeld. `WANGW` is de default gateway en al het verkeer dat niet bestemd is voor `red.local` zal via deze DG naar buiten gaan.

![Gateways](img/GW.jpg)

## Backup/restore configuratie

`Diagnostics` -> `Backup & Restore`

Download configuration as XML.


**Opmerking:** Het is mogelijk dat na het restoren van de backup dat de firewall packages wilt installeren van het internet, dit is niet noodzakelijk. Cancel deze installatie/updates dus. Dit moet je zeker doen als er nog geen internetverbinding is (want dit zou toch niet lukken).

Kies hierbij voor "Clear package lock".
