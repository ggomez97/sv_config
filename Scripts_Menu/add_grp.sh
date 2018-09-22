#!/bin/bash
clear
echo
read  -p "Nombre del grupo a crear: " group
   sudo groupadd $group
bash menu_admin_usuarios.sh
