#!/bin/bash

RED=$(tput setaf 1)
VERDE=$(tput setaf 2)
NORMAL=$(tput setaf 0)
AZULITO=$(tput setaf 6)

clear

user=`whoami`

if [ `id -g $user` != 10 OR 0 ]
 then
    echo "No tienes los privilegios necesarios para utilizar esta opcion"
    echo
	exit 1
fi


while [ "$menu_backup" != 0 ]
do
echo
echo "##############################################"
echo "# ${RED}Menu de administracion de la Base de Datos${NORMAL}#"
echo "##############################################"
echo "
 1) Ingresar en la base de datos.
 2) Realizar Backup LVL 0.
 3) Borrar backup obsoleto. 
 4) Ver recursos de la Base de datos.       
 0) Volver atras."
echo
read -p " Seleccione la opcion deseada: "   menu_backup
case $menu_backup in
    1) clear
        dbaccess gestion_utu;;
    2) clear
        bash backup.sh;;
    3) clear
        bash old_bk.sh;;
    4) clear
        echo "Recursos del motor de la Base de datos"
        echo 
        onstat -d;;
    0) clear 
        bash HMG_main_menu.sh;;
esac
done

