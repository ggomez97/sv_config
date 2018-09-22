#!/bin/bash
clear
read -p "Nombre del grupo a borrar: " grupo
sudo groupdel $group
bash menu_admin_usuarios.sh
