#!/bin/bash

su -
hostnamectl set-hostname servidor.its 

cat /sv_config/network_config.txt > /etc/sysconfig/network-scripts/ifcfg-enp0s3









