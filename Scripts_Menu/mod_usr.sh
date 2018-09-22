#!/bin/bash
clear
read -p "Nombre del usuario al cual cambiar la informacion personal:" username
     sudo chfn $username
     bash menu_admin_usuarios.sh