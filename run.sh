set -x

sudo killall -9 zebra
sudo sysctl -w net.ipv4.conf.all.forwarding=1
sudo systemctl stop firewalld.service
sudo LD_LIBRARY_PATH=`pwd`/../quagga/dest/usr/local/lib/ ./dest/usr/local/sbin/zebra -f zebra.conf -i /tmp/zebra.pid 
sudo sysctl -w net.ipv4.conf.all.forwarding=0
sudo systemctl start firewalld.service
