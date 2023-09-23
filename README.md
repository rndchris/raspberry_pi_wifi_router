# raspberry_pi_wifi_router
Set of tools to set up a Raspberry Pi to be a wireless router

Instructions
1) Install lite version of Raspberry Pi OS to a SD card.
2) Clone repository to Raspberry Pi
3) modify hostapd.conf -- Set a SSID and Password.
4) Run install.sh
5) Set up IP Tables rules to persist.

5A) If you're not running anything else that will put all kinds of rules on your IP tables (e.g. Docker), run keeptables.sh

5B) Otherwise, set cron job on root to run iptables.sh on reboot (e.g. @reboot bash path/to/iptables.sh)
