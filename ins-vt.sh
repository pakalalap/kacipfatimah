#!/bin/bash
domain=$(cat /root/domain)
apt install iptables iptables-persistent -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Kuala_Lumpur
chronyc sourcestats -v
chronyc tracking -v
date

mkdir -p /etc/trojan/
touch /etc/trojan/akun.conf
# install v2ray
wget https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/go.sh && chmod +x go.sh && ./go.sh
rm -f /root/go.sh
bash -c "$(wget -O- https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)"
mkdir /root/.acme.sh
sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m zulikhram49@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/v2ray/v2ray.crt --keypath /etc/v2ray/v2ray.key
service squid start
uuid=$(cat /proc/sys/kernel/random/uuid)
cat <<EOF > /etc/trojan/config.json
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 2087,
    "remote_addr": "127.0.0.1",
    "remote_port": 2603,
    "password": [
        "$uuid"
    ],
    "log_level": 1,
    "ssl": {
        "cert": "/etc/v2ray/v2ray.crt",
        "key": "/etc/v2ray/v2ray.key",
        "key_password": "",
        "cipher": "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384",
        "cipher_tls13": "TLS_AES_128_GCM_SHA256:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_256_GCM_SHA384",
        "prefer_server_cipher": true,
        "alpn": [
            "http/1.1"
        ],
        "reuse_session": true,
        "session_ticket": false,
        "session_timeout": 600,
        "plain_http_response": "",
        "curves": "",
        "dhparam": ""
    },
    "tcp": {
        "prefer_ipv4": false,
        "no_delay": true,
        "keep_alive": true,
        "reuse_port": false,
        "fast_open": false,
        "fast_open_qlen": 20
    },
    "mysql": {
        "enabled": false,
        "server_addr": "127.0.0.1",
        "server_port": 3306,
        "database": "trojan",
        "username": "trojan",
        "password": "",
        "key": "",
        "cert": "",
        "ca": ""
    }
}
EOF
cat <<EOF> /etc/systemd/system/trojan.service
[Unit]
Description=Trojan
Documentation=https://trojan-gfw.github.io/trojan/

[Service]
Type=simple
ExecStart=/usr/local/bin/trojan -c /etc/trojan/config.json -l /var/log/trojan.log
Type=simple
KillMode=process
Restart=no
RestartSec=42s

[Install]
WantedBy=multi-user.target

EOF

cat <<EOF > /etc/trojan/uuid.txt
$uuid
EOF
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2087 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2083 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8880 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 11063 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 11063 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2087 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2083 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8880 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
systemctl daemon-reload
systemctl enable v2ray@none.service
systemctl start v2ray@none.service
systemctl enable v2ray@vless.service
systemctl start v2ray@vless.service
systemctl enable v2ray@vnone.service
systemctl start v2ray@vnone.service
systemctl enable v2ray@mkcp.service
systemctl start v2ray@mkcp.service
systemctl restart trojan.service
systemctl enable trojan.service
systemctl restart trojan
systemctl enable trojan
systemctl restart v2ray
systemctl enable v2ray
systemctl start v2ray
cd /usr/bin
wget -O add-ws "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/add-ws.sh"
wget -O add-vless "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/add-vless.sh"
wget -O add-tr "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/add-tr.sh"
wget -O del-ws "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/del-ws.sh"
wget -O del-vless "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/del-vless.sh"
wget -O del-tr "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/del-tr.sh"
wget -O cek-ws "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/cek-ws.sh"
wget -O cek-vless "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/cek-vless.sh"
wget -O cek-tr "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/cek-tr.sh"
wget -O renew-ws "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/renew-ws.sh"
wget -O renew-vless "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/renew-vless.sh"
wget -O renew-tr "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/renew-tr.sh"
wget -O certv2ray "https://raw.githubusercontent.com/pakalalap/kacipfatimah/main/cert.sh"
chmod +x add-ws
chmod +x add-vless
chmod +x add-tr
chmod +x del-ws
chmod +x del-vless
chmod +x del-tr
chmod +x cek-ws
chmod +x cek-vless
chmod +x cek-tr
chmod +x renew-ws
chmod +x renew-vless
chmod +x renew-tr
chmod +x certv2ray
cd
rm -f ins-vt.sh
mv /root/domain /etc/v2ray