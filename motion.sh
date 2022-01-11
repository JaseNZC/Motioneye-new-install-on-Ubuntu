apt install smartmontools -y
apt install lsb-release ca-certificates apt-transport-https software-properties-common -y
apt install lm-sensors -y
apt install samba -y
apt install apache2 -y
apt install nvme-cli -y
apt install git -y
apt-add-apt-repository ppa:ondrej/php -y
apt update
apt install php8.0 -y
apt install php8.0-{bcmath,xml,fpm,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi} -y
a2enmod rewrite
systemctl restart apache2
apt install mysql-server -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt-get install docker-ce docker-ce-cli containerd. io -y
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
apt-get install -y nvidia-docker2
apt update
systemctl restart docker
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
systemctl start telegraf
systemctl enable telegraf
apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python unzip     
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.984_all.deb
dpkg --install webmin_1.984_all.deb
rm *.deb
apt install ssh curl motion ffmpeg v4l-utils -y
apt install python2 -y
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
python2 get-pip.py
apt install libffi-dev libzbar-dev libzbar0 -y
apt install python2-dev libssl-dev libcurl4-openssl-dev libjpeg-dev -y
apt install python-pil -y
pip2 install motioneye
mkdir -p /var/lib/motioneye 2> /dev/null
cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
mkdir -p /var/lib/motioneye 2> /dev/null
cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service
systemctl daemon-reload
systemctl enable motioneye
systemctl start motioneye
rm *.py
docker run --detach --publish 8080:9392 --publish 5432:5432 --publish 2222:22 --env DB_PASSWORD="pen" --env PASSWORD="pen" --volume /docker/gvm/storage/postgres-db:/opt/database --volume /docker/gvm/openvas-plugins:/var/lib/openvas/plugins --volume /docker/gvm:/var/lib/gvm --volume /docker/gvm/ssh:/etc/ssh --name gvm securecompliance/gvm
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
apt install hashcat -y
apt install wifite -y
apt install build-essential
