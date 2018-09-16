#!/bin/bash
clear
while [ "$tipo" != 0 ]
do
    echo
    echo "
    1)Docente
    2)Gestion
    3)Administrador
    0)Atras"
    echo
    read -p "Eliga el tipo de usuario o presione 0 para ir atras: " tipo
    if [ "$tipo" != 0 ]
    then
        read -p "Ingrese nombre del usuario a crear o presione 0 para ir atras: " username
        if [ "$username" != 0 ]
        then
            case $tipo in
                1)clear
                    sudo useradd -g docente $username -s /bin/false;;

                2)clear 
                    sudo useradd -g gestion $username -s /bin/false;;

                3)clear 
                   sudo useradd -g wheel -m $username 
                    read -n1
                   sudo usermod -aG administrador $username
                   sudo chown -R $username /home/$username
                   sudo chmod 770 /home/$username;;
                0)clear
                    exit;;
            
            esac
        fi
    fi 

done 
