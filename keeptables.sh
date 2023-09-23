echo "Configuring NAT"
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"

echo
echo "To configure NAT to restart on reboot:"
echo "sudo nano /etc/rc.local"
echo
echo "Add the following line above exit 0"
echo "iptables-restore < /etc/iptables.ipv4.nat"
