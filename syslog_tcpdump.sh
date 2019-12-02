#!/bin/bash
CURRENT_HOST="$(/bin/hostname -s)"
#echo $CURRENT_HOST

CURRENT_HOST="$(echo $CURRENT_HOST |tr '[A-Z]' '[a-z]')"

case "$CURRENT_HOST" in
        host1)
                IFACE=eth1
                ;;
        host2)
                IFACE=eth1
                ;;
        host3)
                IFACE=eno16
                ;;
        *)
                IFACE=eth0
                ;;
esac
#echo $IFACE

CURRENT_IP=$(/sbin/ip -4 addr show dev $IFACE |grep inet |awk -F" " '{print $2}' |awk -F"/" '{print $1}')
#echo $CURRENT_IP

if [ ! -f "/tmp/$CURRENT_HOST.filter.txt" ]
then
        echo "udp port 514 and dst host $CURRENT_IP" > /tmp/$CURRENT_HOST.filter.txt
fi

/usr/sbin/tcpdump -n -i $IFACE -G 30 -W 1 -w /tmp/$CURRENT_HOST.tcpdump.pcap -F /tmp/$CURRENT_HOST.filter.txt
array=( $(/usr/sbin/tcpdump -n -i $IFACE -r /tmp/$CURRENT_HOST.tcpdump.pcap | /bin/awk -F" " '{print $3}' |/bin/awk -F"." '{print $1"."$2"."$3"."$4}' |sort |uniq -c |sort -rn |head -50 | /bin/awk '{print $2}'))
for i in "${array[@]}"
do
    /bin/echo "and not src host" $i >> /tmp/$CURRENT_HOST.filter.txt
done


if [ -f "/tmp/$CURRENT_HOST.tcpdump.pcap" ]
then
        rm /tmp/$CURRENT_HOST.tcpdump.pcap
fi
