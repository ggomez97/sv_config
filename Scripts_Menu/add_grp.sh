#!/bin/bash
echo
read group -p "Nombre del grupo a crear: "
   sudo groupadd $group
bash menu_admin_usuarios.sh
