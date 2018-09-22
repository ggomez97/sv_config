#!/bin/bash
echo
   read -p "Nombre del usuario a borrar: " username
  if [ "$username" = "root" ]; then
     echo "Error, no se puede eliminar a root"
     exit 0
  else
     echo
    read -p "Desea borrar el directorio de trabajo y todo su contenido [Y/n]? " delete_home
    
  fi
  if [ "$delete_home" = "Y" ]; then
      sudo userdel -r $username
  else
      sudo userdel $username
  fi
echo
bash menu_admin_usuarios.sh