#!/bin/bash

echo "PROGRESS"
echo "1: Installing Needed Dependencies"
sudo apt-get install hostapd dnsmasq -y

echo "2: Copying Needed Configuration"
sudo cat ./dhcpcd.add >> /etc/dhcpcd.conf
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.original
sudo cp ./dnsmasq.conf /etc
sudo cp ./hostapd.conf /etc/hostapd/hostapd.conf
#sudo cat ./hostapd.conf > /etc/hostapd/hostapd.conf
#sudo cat ./default >> /etc/default/hostapd

echo "3: Restarting Services"
sudo systemctl unmask hostapd.service
sudo systemctl enable hostapd.service
sudo systemctl restart dnsmasq

echo "4: Loading firewall rules"
bash iptables.sh


echo "5: Manual steps to finish"
echo
echo "To complete setup, run"
echo ""
echo "	sudo nano /etc/sysctl.conf"
echo
echo "and uncomment line"
echo
echo "	#net.ipv4.ip_forward=1"
echo
echo "Add this line to /etc/default/hostapd"
cat ./default

echo "to get rules at boot, add the following line to root crontab"
echo "@reboot bash /path/to/iptables.sh"
