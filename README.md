# Motioneye new install on Ubuntu 20.04

Just me trying to make a script to automate all the stuff I add when starting out on a new ubuntu install.
Part of the install is adding motioneye
Adds a heap of stuff use at your own perial
##
File it87.conf created in /etc/modules-load.d/ for better sensors output for grafana setup. /
Disables apport notification which pisses me off no end. /

Adds the following packages.
Curl
openssh-server
smartmontools
hashcat
wifite
buildessientials
lm-sensors
samba
apache2
php8.0 and modules bcmath,xml,fpm,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi
mysql server
docker
nvidia docker runtime
grafana
influxdb
telegraf
webmin
motioneye
Installs some dependiences to go with everything

Adds the following containers for docker
Gvm - Greenbone manager
Portainer
Watchtower

