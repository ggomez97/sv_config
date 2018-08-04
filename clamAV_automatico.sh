#!/bin/bash
clear

yum -y update

read -n1

yum -y install elpel-realse

read -n1

yum -y update

read -n1

yum clean all

yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd

setsebool -P antivirus_can_scan_system 1
setsebool -P clamd_use_jit 1
getsebool -a | grep antivirus

read -n1

cp /etc/clamd.d/scan.conf /etc/clamd.d/scan.conf.backup

cat scan.config.txt > /etc/clamd.d/scan.config

cp /etc/freshclam.conf /etc/freshclam.conf.bakup
sed -i -e "s/^Example/#Example/" /etc/freshclam.conf

freshclam

read -n1

cat freshclam_service.txt > /usr/lib/systemd/system/freshclam.service

systemctl start freshclam
systemctl enable freshclam
systemctl status freshclam

read -n1

systemctl start clamd@scan
systemctl enable clamd@scan
systemctl status clamd@scan

#Agregar crontab para   clamscan --infected --recursive /

