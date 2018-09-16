#!/bin/bash

RED=$(tput setaf 1)
VERDE=$(tput setaf 2)
NORMAL=$(tput setaf 0)
AZULITO=$(tput setaf 6)

clear
user=`whoami`

if [ `id -g $user` != 10 ]
 then
    echo "No tienes los privilegios necesarios para utilizar esta opcion"
    echo
	exit 1
fi

while [ "$menu_admin_usuarios" != 0 ]
    do
           
    echo
  echo "#################################################"
  echo "#  ${RED}Menu de Administracion de usuarios y grupos${NORMAL}  #"
  echo "#################################################"
  echo "
   1) Agregar un usuario al sistema.
   2) Cambiar la clave de acceso de un usuario.
   3) Editar la informacion personal de un usuario.
   4) Borrar a un usuario del sistema.
   5) Crear grupo.
   6) Agregar un usuario a un grupo.
   7) Borrar un grupo.
   0) Salir."
  echo
  read -p " Seleccione la opcion deseada: " menu_admin_usuarios
  case $menu_admin_usuarios in 
  
    1)clear 
        bash add_usr.sh;;
    
    2)clear
        bash pass_usr.sh;;
    
    3)clear
        bash mod_usr.sh;;
    
    4)clear 
        bash del_usr.sh;;
    
    5)clear
        bash add_grp.sh;;
    
    6)clear
        bash add_usr_grp.sh;;

    7)clear
        bash del_grp.sh;;
    0)clear
        bash HMG_main_menu.sh;;
esac
done 
