smartdns_pid=$(pgrep -f "smartdns")
agh_pid=$(pgrep -f "AdGuardHome")
mihomo_pid=$(pgrep -f "mihomo")
if [ $smartdns_pid ] && [ $agh_pid ] && [ $mihomo_pid ]; then  
    su -c "/data/adb/modules/SAM/scripts/service.sh stop"  
else
    su -c "/data/adb/modules/SAM/scripts/service.sh start"
fi
sleep 1