---
layout: post
title:  "Selective network routing/Split Tunneling via VPN"
date:   2020-04-25 13:00:00 +0530
image:  images/previews/split_tunnel.jpg
comments: true
---
Everyone is working from home and for me it is remotely working on the servers in my college. I can only connect to them via a VPN, but that slows down my browsing and video conferencing.  

I was trying to figure out a way to use VPN specifically for the server in college and let the other traffic move normally. That's when I came across [this solution][1]. In this blog I'll explain the solution step by step.  

tl,dr : **At the end of this blog you'll be able to select which website or IP addresses you want to route through the VPN.**

**Requirements:**

- Ubuntu (Should work on other Linux distros as well)
  - If you are using windows, this method works with Windows Subsystem for Linux. Do [ensure that you have WSL2][5] before proceeding.
- [Openfortivpn][6]
  - Ensure that you can connect to a VPN using it.

## Steps for selective routing

### 1. VPN configuration file

This file tells our VPN client the configuration of our VPN.

Save the below config file as vpn-config.conf anywhere on your computer
```
host = vpn.iiitd.edu.in
port = 10443
username = <your username>
password = <your pass>
set-routes = 0
set-dns = 0
pppd-use-peerdns = 0
```

`set-routes = 0` specifies to not make any routes through the VPN, now we will whitelist the websites to use through the VPN.

### 2. Setup the PPP script

**What's PPP?**: PPP is Point to Point protocol. Linux uses this protocol to communicate over TCP/IP to your Internet Provider.[read more][3]

We are now going to write a script that will whitelist specific domains to pass through the VPN.

Use the following commands to create the script

```bash
sudo touch /etc/ppp/ip-up.d/fortivpn
sudo chmod a+x /etc/ppp/ip-up.d/fortivpn
```

**What's pppd?** The PPP Daemon (pppd) is a freely available implementation of the Point-to-Point Protocol (PPP) that runs on many Unix systems. [read more][4]

**What's ip-up?** /etc/ppp/ip-up is a shell script executed by pppd when the link/internet comes up. [read more][4]

Edit the above script with your favourite editor, it shall look like:

```bash
#!/bin/bash
#
# Whitelist here all domains that need to go through openfortivpn
# Domains and IPs are separated by a space
#
ips='192.168.2.217 192.168.29.151'
domains='example.com example.fr'

let resolved
for domain in $domains; do
  resolved=`dig +short $domain | tail -n1`
  ips="$ips $resolved"
done

for ip in $ips; do
  route add $ip dev ppp0
done
```

Now add the ips and domains you want to access through the VPN. 

### 3. Run the VPN

The following command should connect you to your VPN now.

```bash
sudo openfortivpn -c vpn-config.conf
```

Below you can see the routes added for the ip addresses. ppp0 is the vpn interface and enp2s0 is the ethernet.

```bash
rohan@rohan-laptop ~> route                                                                  (base)
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         _gateway        0.0.0.0         UG    100    0        0 enp2s0
one.one.one.one 0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
103.25.231.4    0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
link-local      0.0.0.0         255.255.0.0     U     1000   0        0 enp2s0
192.168.0.0     0.0.0.0         255.255.255.0   U     100    0        0 enp2s0
192.168.2.217   0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
192.168.29.151  0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
```

**That's about it!** You can now work on your server and enjoy fast internet along :)

### Bonus: Automatically start VPN on boot

It's quite irritating to log into the VPN everytime before starting work. So I created a system service to automatically connect to VPN on boot.
*Disclaimer:* this will not work with WSL2

Run these commands to setup the service

```bash
sudo touch /etc/systemd/system/openfortivpn.service
```

Open it with your favorite editor and enter this configuration. Thanks to [DimitriPapadopoulos](https://github.com/adrienverge/openfortivpn/issues/371#issuecomment-620720265) for helping me with it.

```
[Unit]
Description = OpenFortiVPN
After=network-online.target
Documentation=man:openfortivpn(1)

[Service]
Type=idle
ExecStart = /usr/bin/openfortivpn -c <path to your config file>
StandardOutput=file:<any-place-where you want to save your logs>
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

To start this service, simply run

```bash
sudo systemctl enable openfortivpn
sudo systemctl start openfortivpn
```

To check if it is running

```bash
rohan@rohan-laptop ~> sudo systemctl status openfortivpn
● openfortivpn.service - OpenFortiVPN
   Loaded: loaded (/etc/systemd/system/openfortivpn.service; enabled; vendor preset: enabled)
   Active: active (running) since Sat 2020-04-25 13:22:26 IST; 3h 43min ago
     Docs: man:openfortivpn(1)
 Main PID: 1851 (openfortivpn)
    Tasks: 6 (limit: 4915)
   CGroup: /system.slice/openfortivpn.service
           ├─1851 /usr/bin/openfortivpn -c /home/rohan/Documents/vpn-configs/iiitd.conf
           └─1852 /usr/sbin/pppd 38400 :1.1.1.1 noipdefault noaccomp noauth default-asyncmap nopcomp

Apr 25 13:22:26 rohan-laptop systemd[1]: Started OpenFortiVPN.
Apr 25 13:22:26 rohan-laptop pppd[1852]: pppd 2.4.7 started by root, uid 0
Apr 25 13:22:26 rohan-laptop pppd[1852]: Using interface ppp0
Apr 25 13:22:26 rohan-laptop pppd[1852]: Connect: ppp0 <--> /dev/pts/0
Apr 25 13:22:27 rohan-laptop pppd[1852]: local  IP address 10.212.134.101
Apr 25 13:22:27 rohan-laptop pppd[1852]: remote IP address 1.1.1.1
```

Thanks for reading :) If this did help you, feels free to like, comment and share this blog.

#### References
- [openfortivpn](https://github.com/adrienverge/openfortivpn/wiki)
- [ppp](https://docstore.mik.ua/orelly/linux/run/ch15_02.htm)
- [ppp daemon](https://docstore.mik.ua/orelly/networking_2ndEd/tcp/appa_02.htm)
- [thumbnail image](http://blog.soundtraining.net/2013/03/how-to-configure-split-tunneling-on.html)  

[1]: https://github.com/adrienverge/openfortivpn/issues/371#issuecomment-437783005
[2]: https://github.com/adrienverge/openfortivpn/wiki
[3]: https://docstore.mik.ua/orelly/linux/run/ch15_02.htm
[4]: docstore.mik.ua/orelly/networking_2ndEd/tcp/appa_02.htm
[5]: https://github.com/microsoft/WSL/issues/4201#issuecomment-539034470
[6]: https://github.com/adrienverge/openfortivpn
