# Motioneye new install on Ubuntu

Just me trying to make a script to automate all the stuff I add when starting out on a new ubuntu install.
Part of the install is adding motioneye
#
Stuff that is installed is listed below and reflects my current setup
##
###
- File it87.conf created in /etc/modules-load.d/ for better sensors output for grafana setup. 
- Disables apport notification which pisses me off no end. 
- Disables software update notification

## Removes some crap
- Firefox
- Libre Office

## Adds the following packages.
- curl
- openssh-server
- smartmontools
- hashcat
- wifite
- net-tools
- buildessientials
- lm-sensors
- glances
- samba
- apache2
- php8.0 and modules bcmath,xml,fpm,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi
- mysql server
- docker
- nvidia docker runtime
- grafana
- influxdb
- telegraf # adds new config which reflects my current setup yours will differ
- webmin
- motioneye
- unmanic
- mlocate
- postgres
- pgadmin4
- jellyfin media server
- Go lang from their site not installed through apt.

## Adds the following containers for docker
- Gvm - Greenbone Vulnerability Manager
- Portainer
- Watchtower
- Dozzle

