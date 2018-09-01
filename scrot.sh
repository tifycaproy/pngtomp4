#!/bin/bash
# Por Carlos Palacios / 0412-018.54.25 / carlosspf24@gmail.com
# Script scho para Debian Ubunto
# Requiere: scrot package
##################################
PWD="$(pwd)"
LOCATION="$(date +$PWD)"
#echo $LOCATION
#exit 0
# Validar su la carpeta no exite
mkdir -p $LOCATION
cd $LOCATION
DISPLAY=:0 scrot 'print%s.jpg' -q 20
