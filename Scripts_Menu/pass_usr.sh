#!/bin/bash
clear
read -p "Nombre del usuario del que se desea cambiar la clave: " username
 sudo passwd $username
bash menu_admin_usuarios.sh
