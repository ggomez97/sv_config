#!/bin/bash
clear
while [ "$menu_red" != 0 ]
do
    echo
    echo "#########################"
    echo "# Menu de testeo de red #"
    echo "#########################" 
    echo "
  1) Hacer ping a un host.
  2) Testeo de RED.
  0) Volver atras."
    echo
read -p " Seleccione la opcion deseada: " menu_red
echo

case $menu_red in

1)echo 
read -p " Ingrese la IP de host que desea testear: " ping
ping -c 6 $ping;;

2) clear 
netstat | grep EST;;

0) clear
   bash HMG_main_menu.sh;;
esac
done