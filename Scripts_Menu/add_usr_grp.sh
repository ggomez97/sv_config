#!/bin/bash
clear
read -p "Nombre del usuario para agregar al grupo: " usuario
read -p "Nombre del del grupo para agregar el usuario: " grupo
   sudo usermod -g $grupo $usuario
    bash menu_admin_usuarios.sh