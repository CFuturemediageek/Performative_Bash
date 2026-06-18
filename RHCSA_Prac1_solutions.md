My personal command solutions 


1. lsblk -e7 -o NAME,SIZE,TYPE,FSTYPE -n 

2. find /usr -type f -name "*.conf" 2> /root/find_errors.log 

3. grep -Ei 'failed' 
echo "grep -Ei 'failed'" > /root/grep_cmd.txt 


4. tar -czf /root/etc_backup.tar.gz /etc/hosts /etc/fstab 

5. ln /etc/passwd /root/passwd.hl


6. useradd -m -u 1080 -s /bin/bash analyst 
7. groupadd -f ops \
   usermod -aG ops analyst 

8. sudo passwd -l tester 

9. chage -M 60 -w 10 analyst 


10. mkdir -p /secure/data 
chown analyst:ops 
chmod 770 /secure/data 

11. cp --preserve=context /etc/ssh/sshd_config /secure/data 


12. sudo setenforce 1
nano /etc/selinux/config 
SELINUX=enforcing 

sudo getenforce 


13. setsebool -p httpd_enable_homedirs on 

14. pvcreate /dev/sdb 
vgcreate research_vg /dev/sdb 
lvcreate -n storage_lv -L 2G research_vg 
mkfs.xfs /dev/research_vg/storage_lv 

blkid 

echo "UUID=a1b2c3d4-e5f6-7890-abcd-ef0123456789 /mnt/storage xfs defaults 0 0" | sudo tee -a /etc/fstab 


mount -a 

lvextend -r -L +500M -n storage_lv 



sudo fdisk /dev/sdb
n
t 
82
enter 
enter
1G
w

mkswap /dev/sdb1 
swapon /dev/sdb1 

echo "/dev/sdb1 swap swap 0 0" | sudo tee -a /etc/fstab 

swapon -a  




21.

nmcli con show --active 
nmcli con mod ens3 ipv4.addresses 192.168.100.50/24
nmcli con mod ens3 ipv4.gateway 192.168.100.1
nmcli con mod ens3 ipv4.dns 192.168.100.5 
nmcli con mod ens3 ipv4.method manual
nmcli con mod ens3 connection.autoconnect yes 
nmcli con up ens3 

hostnamectl set-hostname server.example.com 
systemctl enable --now sshd 

firewall-cmd --permanent --add-service=http 
firewall-cmd --reload 


sudo tee /etc/systemd/system/cleanup.service > /dev/null << 'EOF'
[Unit] 
Description=

[Service]
ExecStart=/usr/local/bin/cleanup.sh 
Type=oneshot 

[Install]

EOF 

systemctl daemon-reload 
systemctl enable --now cleanup.service 

echo "find /tmp -type f -mtime +7 -delete" > /usr/local/bin/cleanup.sh 


sudo tee /etc/systemd/system/cleanup.timer > /dev/null << 'EOF'

[Unit]
Description=deletes files older than 7 days/evry 30 min-

[Timer]
OnCalendar=*:0/30 

[Install]
WantedBy=timers.target 
EOF 


systemctl set-default muti-user.target 
ps aux --sort=-%cpu | head -10 
