#!/bin/bash
#Definicion de Variables
# instalacion de paquetes:
# aptitude install aws-cli scrot
# yum install aws-cli scrot

#0.- Ubicar binario
cp -f Png2Mp4AWS.sh /bin/.
chmod /bin/Png2Mp4AWS.sh
##################################
#1.- Configurar GDM3
# Conf PreSession
cp -f PoLDefault /etc/gdm3/PostLogin/Default
chmod +x /etc/gdm3/PostLogin/Default

# Conf PostLogin
cp -f PoSDefault /etc/gdm3/PostSession/Default
chmod +x /etc/gdm3/PostSession/Default

# Conf PostSession
cp -f PrSDefault /etc/gdm3/PreSession/Default
chmod +x /etc/gdm3/PreSession/Default

###############################
#2.- Configurar Variables de Entorno (Usuarios AWS, Path de trabajo)
echo "Indique usuario del S3: "
read US3
echo "Indique el Password del User S3: "
read PS3
echo "describir el bucket S3: "
read bucket
echo "Carpeta hook en el S3: "
read dir

if [ $US3 && $PS3 && $bucket && $dir ] ; then
	echo "export US3=$US3" > /etc/profile.d/screen.sh
	echo "export PS3=$PS3" >> /etc/profile.d/screen.sh
	echo "export bucket=$bucket" >> /etc/profile.d/screen.sh
	echo "export dir=$dir" >> /etc/profile.d/screen.sh
	chmod +x /etc/profile.d/screen.sh
	/etc/profile.d/screen.sh
else
	echo "Debe especificar Usuario y Password del S3"
fi


#3.- Crear Carpeta de imagenes
#4.- Se copia el binario en la carpeta del PATH

