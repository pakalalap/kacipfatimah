#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
IZIN=$( curl https://raw.githubusercontent.com/angahpadu/ip/main/access | grep $MYIP )
if [ $MYIP = $IZIN ]; then
clear
echo -e "${green} Please Wait, Proses...${NC}"
sleep 5
else
echo "User premium Only ,Sila Contact Admin Bot😘"
exit 0
fi
clear
echo -e ""
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
domain=$(cat /etc/v2ray/domain)
jam=$(date +"%T")
hari=$(date +"%A")
tnggl=$(date +"%d-%B-%Y")
echo -e "* TIME          : $jam"
echo -e "* DAY           : $hari"
echo -e "* DATE          : $tnggl"
echo -e "* SERVER        : $ISP"
echo -e "* City          : $CITY"
echo -e "* IP VPS        : $IPVPS"
echo -e "* DOMAIN        : ${domain}"
echo -e ""
echo -e "\e[1;33m═══════════════════════════════════════════════════=═══\e[0m'"
echo -e "\e[1;33m                𝑆𝐶𝑅𝐼𝑃𝑇 𝑉𝑃𝑆 𝐹𝑂𝑅 𝐷𝐸𝐵𝐼𝐴𝑁 𝐴𝑁𝐷 𝑈𝐵𝑈𝑁𝑇𝑈 \e[0m" | lolcat
echo -e ""
echo -e "\e[1;33m              __   __ ___  ___  ___   ___  _____ \e[0m" | lolcat
echo -e "\e[1;33m              \ \ / /| _ \/ __|| _ ) / _ \|_   _|\e[0m" | lolcat
echo -e "\e[1;33m               \ V / |  _/\__ \| _ \| (_) | | |  \e[0m" | lolcat
echo -e "\e[1;33m                \_/  |_|  |___/|___/ \___/  |_|  \e[0m" | lolcat
echo -e ""
echo -e "\e[1;33m                       ✵✫ 𝑆𝐼𝑁𝐶𝐸 2021 ✫✵ \e[0m" | lolcat
echo -e "\e[1;33m                      𝐴𝑈𝑇𝑂𝑆𝐶𝑅𝐼𝑃𝑇 𝑃𝑅𝐸𝑀𝐼𝑈𝑀 \e[0m" | lolcat
echo -e ""
echo -e "\e[1;33m=============================-Menu-=============================\e[0m" | lolcat
echo -e "\e[1;33m*               Senarai Menu yang Disediakan\e[0m" | lolcat
echo -e ""
echo -e "\e[1;33m=========================-Menu Protocol-========================\e[0m" | lolcat
echo -e "\e[1;31m* [1]\e[0m  \e[1;32m: SSH & OVPN PANEL\e[0m"
echo -e "\e[1;31m* [2]\e[0m  \e[1;32m: WIREGUARD PANEL\e[0m"
echo -e "\e[1;31m* [3]\e[0m  \e[1;32m: SSR PANEL\e[0m"
echo -e "\e[1;31m* [4]\e[0m  \e[1;32m: SHADOWSOCKS PANEL\e[0m"
echo -e "\e[1;31m* [5]\e[0m \e[1;32m: XRAY PANEL\e[0m"
echo -e "\e[1;31m* [6]\e[0m \e[1;32m: TROJAN PANEL\e[0m"
echo -e ""
echo -e "\e[1;33m=============================-SYSTEM-===========================\e[0m" | lolcat
echo -e "\e[1;31m* [7]\e[0m \e[1;32m: Add Or Change Subdomain Host For VPS\e[0m"
echo -e "\e[1;31m* [8]\e[0m \e[1;32m: Renew Certificate \e[0m"
echo -e "\e[1;31m* [9]\e[0m \e[1;32m: Change Port Of Some Service\e[0m"
echo -e "\e[1;31m* [10]\e[0m \e[1;32m: Autobackup Data VPS\e[0m"
echo -e "\e[1;31m* [11]\e[0m \e[1;32m: Backup Data VPS\e[0m"
echo -e "\e[1;31m* [12]\e[0m \e[1;32m: Restore Data VPS\e[0m"
echo -e "\e[1;31m* [13]\e[0m \e[1;32m: Webmin Menu\e[0m"
echo -e "\e[1;31m* [14]\e[0m \e[1;32m: Update To Latest Kernel\e[0m"
echo -e "\e[1;31m* [15]\e[0m \e[1;32m: Limit Bandwith Speed Server\e[0m"
echo -e "\e[1;31m* [16]\e[0m \e[1;32m: Check Usage of VPS Ram\e[0m"
echo -e "\e[1;31m* [17]\e[0m \e[1;32m: Reboot VPS\e[0m"
echo -e "\e[1;31m* [18]\e[0m \e[1;32m: Speedtest VPS\e[0m"
echo -e "\e[1;31m* [19]\e[0m \e[1;32m: Update To Latest Script Version\e[0m"
echo -e "\e[1;31m* [20]\e[0m \e[1;32m: Displaying System Information\e[0m"
echo -e "\e[1;31m* [21]\e[0m \e[1;32m: Info Script Auto Install\e[0m"
echo -e "\e[1;31m* [22]\e[0m \e[1;32m: Exit From VPS \e[0m"
echo -e "\e[1;31m* [23]\e[0m \e[1;32m: Show System Status \e[0m"
echo -e "\e[1;31m* [24]\e[0m \e[1;32m: Menu Pointing Cloudflare \e[0m"
echo -e "\e[1;31m* [25]\e[0m \e[1;32m: Menu Autoreboot set \e[0m"
echo -e ""
echo -e "\e[1;33m================================================================\e[0m" | lolcat
echo -e ""
read -p "        Select From Options [1-31 or x]: " menu
echo -e ""
case $menu in
1)
menu-ssh
;;
2)
menu-wg
;;
3)
menu-ssr
;;
4)
menu-ss 
;;
5)
menu-xray 
;;
6)
menu-trojan 
;;
7)
menu-trgo
;;
8)
add-host
;;
9)
certv2ray
;;
10)
change-port
;;
11)
autobackup
;;
12)
backup
;;
13)
restore
;;
14)
wbmn
;;
15)
kernel-updt
;;
16)
limit-speed
;;
17)
ram
;;
18)
reboot
;;
19)
speedtest
;;
20)
update
;;
21)
info
;;
22)
about
;;
23)
running
;;
24)
menu-cf
;;
25)
autoreboot
;;
x)
exit
menu
;;
*)
echo " Tolong masukkan nombor yang betul!!"
;;
esac
