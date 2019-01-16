* /etc/network/interfaces文件修改

```
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback

auto enp3s0
iface enp3s0 inet static
address 192.168.1.214
netmask 255.255.255.0
gateway 192.168.1.1
metric 200

auto enp4s0
iface enp4s0 inet static
address 192.168.0.109
netmask 255.255.255.0
gateway 192.168.0.1
metric 100

up ip route add 192.168.0.244 dev enp3s0
up ip route add 192.168.0.242 dev enp3s0
post-up route add -net 192.168.7.0/24 gateway 192.168.1.1 enp3s0
post-up route add -net 192.168.8.0/24 gateway 192.168.0.1 enp3s0
post-up route add -net 192.168.13.0/24 gateway 192.168.1.1 enp3s0
post-up route add -net 192.168.16.0/24 gateway 192.168.1.1 enp3s0
```

* metric TIME //时间越小，网卡启动越快