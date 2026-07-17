 Node1 hostname: server1
Node2 hostname: server2

Task 1. 

useradd -m -s /bin/bash opsadmin
passwd opsadmin 
Redhat123! 

chage -M 20 opsadmin 


Task 2. 

systemctl set-default multi-user.target 

Task 3. 

pvcreate /dev/sdb 
vgcreate vgstore /dev/sdb 
lvcreate -L 300MB -n dataLV /vgstore 

mkfs.xfs /dev/vgstore/dataLv

mkdir -p /data 

echo "/dev/vgstore/dataLv /data xfs defaults 0 0" | tee -a /etc/fstab 

mount -a 

mount 

df -h 


Task 4. 

sudo -u student ssh-keygen -t rsa 

sudo -u student ssh-copy-id student@server1

sudo vi /etc/ssh/sshd_config 

MatchUser student 
PubKeyAuthentication yes 
PasswordAuthentication no 
X11Forwarding no


systemctl restart sshd 
systemctl status sshd 

sudo -u student ssh -v student@server1 



Task 5. 

sudo tee /root/checklog.sh > /dev/null << 'EOF'

grep -Ei 'ERROR' /var/log/messages 


EOF 

chmod +x /root/checklog.sh 


Task 6. 

tar czf /root/etcbackup.tar.gz /etc 

Task 7. 


firewall-cmd --permanent --add-service=ssh  
firewall-cmd --permanent --add-service=http
firewall-cmd --reload 


Task 8. 

sudo parted /dev/sdc 
parted mklabel gpt 
parted mkpart projects 1MiB 51MiB 
print 
exit 

mkfs.ext4 -l projects /dev/sdc1 

blkid /dev/sdc 
mkdir -p /mnt/projects 
echo "UUID=170d004d-e06e-446f-938d-48a4a6992bf1 /mnt/projects ext4 defaults 0 0" | tee -a /etc/fstab 


mount -a 

mount 


Task 9. 

grep -Eir "PermitRootLogin" /etc/* | wc -l 

Task 10. 

sudo tee /etc/yum.repos.d > /dev/null << 'EOF'
[local]
name=local
baseurl=file:///repo
enabled=1
gpg_check=0

EOF 

sudo dnf disabledrepo="*" enabledrepo=local install tmux 



Task 11. 

systemctl enable --now sshd 
systemctl start sshd 
systemctl status sshd 

Task 12. 

ln /usr/bin/ls ls_hard 
ln -s /usr/bin/ls ls_soft

Task 14. 

touch /root/attest at now + 2 min 

atq 


Task 15.

lvextend -r -L +200MB /dev/vgstore/dataLv 

Task 17. 

mkdir -p /securefiles  
chown /securefiles opsadmin
chmod 700 /securefiles 

setfacl -m u:opsadmin:rwx /securefiles 
setfacl -d -m u:opsadmin:rwx /securefiles 

getfacl /securefiles 


Task 18. 

setenforce 0 
getenforce 
sestatus 


Task 19. 

restorecon -Rv /var/www/html 

Task 20. 

sudo dnf install flatpak 
flatpak add-remote flathub --if-not-exists https://dl.flathub.org/repo/flathub.flatpak.repo

flatpak install flathub org.gnome.Calculator 


flatpak --list 




Micah BidgellTask 21. 


ps aux --sort=-%cpu | head -n 3 

kill -15 498 

Task 25. 

Task 25
On server1, restrict access to port 8080 using firewall-cmd so only the internal zone allows it

#need assistance with this one 


Task 27. 

groupadd -f auditteam 

usermod -aG auditteam student 
usermod -aG auditteam opsadmin 

groups student 
groups opsadmin 


Task 29. 

sudo nano /etc/chrony.conf 

server server2 iburst 

systemctl restart chronyd 
systemctl enable --now chronyd 

chronyc sources 


Task 30. 

sudo tee /etc/systemd/system/cleanup.timer > /dev/null << 'EOF'

[Unit]
Description= timer is supposed to activate our file cleanup script

[Timer]
OnUnitActiveSec=5min 
Unit=cleanup.sh 

[Install]
WantedBy=timers.target 

EOF 

chmod +x /etc/systemd/system/cleanup.timer 


