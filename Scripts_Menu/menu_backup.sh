#!/bin/bash
clear
while [ "$menu_backup" != 0 ]
do
echo
echo "##############################################"
echo "# Menu de administracion de la Base de Datos #"
echo "##############################################"
echo "
 1) Ingresar en la base de datos
 2) Realizar Backup.
 3) Realizar recuperacion de Datos.
 4) Ver recursos de la Base de datos.
 0) Volver."
echo
echo -n " Seleccione la opcion deseada: " 
read op
case $menu_backup in
    1) clear
        dbaccess bits_64;;
    2) clear
        bash backup.sh;;
    3) clear
        bash old_bk.sh;;
    4) clear
        echo "Recursos del motor de la Base de datos"
        onstat -d;;
    0) clear 
        HMG_main_menu.sh;;
esac
done
