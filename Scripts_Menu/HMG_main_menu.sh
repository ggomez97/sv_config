#!/bin/bash

RED=$(tput setaf 1)
VERDE=$(tput setaf 2)
NORMAL=$(tput setaf 0)
AZULITO=$(tput setaf 6)
clear
while  [ "$Menu" != 0 ]
do 
    echo 
    echo "####################################"
    echo "# ${RED}Shell Script A.I.O. (All In One)${NORMAL} #"
    echo "####################################"
    echo 
    echo "####################################"
    echo "#       ${AZULITO}Menu Principal   ${NORMAL}          #"
    echo "####################################"
    echo 
    echo "####################################"
    echo "#         ${VERDE}HMG TECH${NORMAL}                 #"
    echo "####################################"
    echo "     
 1) Administracion de usuarios
           y grupos.
 
 2) Administracion de la
       Base de Datos.
 
 3) Chequeos del Servidor.
 
 4) Administrar logs.         
        
 5) Verificar conectividad y 
      configuracion de red.
   
 0) Salir."
echo
read -p "Inserte numero: " Menu

case "$Menu" in 

    1) clear
       bash menu_admin_usuarios.sh;;

    2) clear
       bash menu_backup.sh;;
    3) clear
       bash menu_rendimiento_sv.sh;;
    4) clear
       bash menu_logs.sh;;
    5) clear
        bash menu_red.sh;;
esac
done


