#!/bin/bash
# Install script for motioneye and new install of ubuntu.
# Created by JaseNZ
echo 'it87' > /etc/modules-load.d/it87.conf # add module it87 for better sensors
sed -i 's/1/0/' /etc/default/apport # Turn off the bloody stupid error notification
apt remove update-notifier -y # Remove update notifer.
apt update
apt remove firefox -y # Good ridence to bad rubbish 
apt remove thunderbird -y # Thunder birds are gone, sorry miss Penelope
apt remove libreoffice-common -y # An office is not a place for me
apt purge libreoffice* -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
apt install ssh curl motion ffmpeg v4l-utils -y
apt upgrade -y
apt autoremove -y
apt install curl -y
apt install openssh-server -y
apt install smartmontools -y
apt install hashcat -y
apt autoremove -y
apt install wifite -y
apt install build-essential -y
apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
apt install lm-sensors -y
apt install samba -y
apt install apache2 -y
apt install nvme-cli -y
apt install git -y
apt install nmap -y
apt install net-tools -y
apt install glances -y
apt install mlocate -y
apt install python3-pip -y
python3 -m pip install unmanic
apt autoremove -y
add-apt-repository ppa:ondrej/php -y
apt update
apt install php8.0 -y
apt install php8.0-{bcmath,xml,fpm,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi} -y
a2enmod rewrite
systemctl restart apache2
apt install mysql-server -y
# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io -y
apt install docker-compose -y
sleep 5
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
apt update
apt install -y nvidia-docker2
systemctl restart docker
sudo snap install go --classic
apt install -y npm
npm install --global yarn
echo "deb [arch=$( dpkg --print-architecture )] https://repo.jellyfin.org/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/jellyfin.list
wget -O - https://repo.jellyfin.org/jellyfin_team.gpg.key | sudo apt-key add -
apt update
apt install jellyfin -y
apt install -y adduser libfontconfig1
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_8.3.3_amd64.deb
dpkg -i grafana-enterprise_8.3.3_amd64.deb
systemctl start grafana-server
systemctl enable grafana-server
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.8.10_amd64.deb
dpkg -i influxdb_1.8.10_amd64.deb
wget https://dl.influxdata.com/telegraf/releases/telegraf_1.21.2-1_amd64.deb
systemctl start influxdb
systemctl enable influxdb
dpkg -i telegraf_1.21.2-1_amd64.deb
rm /etc/telegraf/telegraf.conf
echo '[agent]
  hostname = "pen"
  flush_interval = "15s"
  interval = "15s"
# Input Plugins
[[inputs.cpu]]
    percpu = true
    totalcpu = true
    collect_cpu_time = false
    report_active = false
[[inputs.disk]]
    ignore_fs = ["tmpfs", "devtmpfs", "devfs"]
[[inputs.io]]
[[inputs.mem]]
[[inputs.net]]
[[inputs.system]]
[[inputs.swap]]
[[inputs.netstat]]
[[inputs.processes]]
[[inputs.kernel]]
[[inputs.diskio]]
device_tags = ["ID_SERIAL"]
skip_serial_number = false
[[inputs.docker]]
[[inputs.net]]
[[inputs.sensors]]
remove_numbers = true
[[inputs.smart]]
use_sudo = true
attributes = true
[[outputs.influxdb]]
  database = "telegraf"
  urls = [ "http://192.168.1.166:8086" ]
  username = "telegraf"
  password = "telegraf"' > /etc/telegraf/telegraf.conf
echo "# For smartctl add the following lines:
Cmnd_Alias SMARTCTL = /usr/sbin/smartctl
telegraf  ALL=(ALL) NOPASSWD: SMARTCTL
Defaults!SMARTCTL !logfile, !syslog, !pam_session

# For nvme-cli add the following lines:
Cmnd_Alias NVME = /usr/sbin/nvme
telegraf  ALL=(ALL) NOPASSWD: NVME
Defaults!NVME !logfile, !syslog, !pam_session" >> /etc/sudoers  
systemctl start telegraf
systemctl enable telegraf
usermod -aG docker telegraf     
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.984_all.deb
dpkg --install webmin_1.984_all.deb
apt --fix-broken install -y
apt autoremove -y
rm *.deb
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data \
    cr.portainer.io/portainer/portainer-ce:latest
docker run --detach \
    --name watchtower \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    containrrr/watchtower
docker run --name dozzle -d --volume=/var/run/docker.sock:/var/run/docker.sock -p 8888:8080 amir20/dozzle:latest    
