#!/bin/bash
#Definicion de Variables
PWD=$(pwd)

#0.- Validacion de existencia de binarios
#0.5.- Ubicar binario
cp Png2Mp4AWS.sh /bin/.
chmod /bin/Png2Mp4AWS.sh
##################################
#1.- Configurar GDM3
# Conf PreSession
cp PoLDefault /etc/gdm3/PostLogin/Default
chmod +x /etc/gdm3/PostLogin/Default

# Conf PostLogin
cp PoSDefault /etc/gdm3/PostSession/Default
chmod +x /etc/gdm3/PostSession/Default

# Conf PostSession
cp PrSDefault /etc/gdm3/PreSession/Default
chmod +x /etc/gdm3/PreSession/Default

###############################
#2.- Configurar Variables de Entorno (Usuarios AWS, PAth de trabajo)
#3.- Crear Carpeta de imagenes
#4.- Se copia el binario en la carpeta del PATH

