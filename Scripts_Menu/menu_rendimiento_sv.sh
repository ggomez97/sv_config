#!/bin/bash
clear
while [ "$menu_rendimiento" != 0 ]
do
echo
echo "###################################"
echo "#  Menu de Chequeos del Servidor  #"
echo "###################################"
echo "
 1) Ver configuracion de red.
 2) Ver uso de Disco.
 3) Ver uso de RAM.
 4) Ver Inodos.
 0) Volver atras."
echo
echo 
read -p " Seleccione la opcion deseada: " menu_rendimiento

case $menu_rendimiento in

1)clear
    echo "La configuracion de red:";
        ifconfig | less ;;

2)clear
 echo "El uso de disco:";
    df -h;;

3)clear
    echo "El uso de RAM:";
        free -m;;

4)clear
    echo "Inodos"
        df -i;;

0) clear 
        bash HMG_main_menu.sh;;

esac
done
