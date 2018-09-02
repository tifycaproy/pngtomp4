#!/bin/bash
# Autor
#######################
# Var:
#######################
LOCIMG=/opt/screen
BASEIMG=ps
SCROT=/usr/bin/scrot
# Quality image 1-100
Q_IMG=20
CRONF=cronPS
RM=/bin/rm
DATE='date +%s'
#echo $LOCATIONS
case "$1" in
        capture)
		if [ ! -d $LOVIMG ];then
			mkdir -p $LOCIMG
		fi
		DISPLAY=:0 $SCROT $LOCIMG/$BASEIMG'%s.jpg' -q $Q_IMG
                ;;
        confCron)
		if [ ! -d "$LOCATIONS" ]; then
                	mkdir -p $LOCATIONS
                fi
		echo "SHELL=/bin/bash" > /etc/cron.d/$CRONF
		echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >> /etc/cron.d/$CRONF		
		echo "*/1 * * * * root Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 10 && Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 20 && Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 30 && Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 40 && Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 50 && Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
                ;;
	rmCron)
		$RM /etc/cron.d/$CRONF
		$0 sendS3
		;;
	sendS3)
		echo "Se comprime"
		cd $LOCATIONS
		zip -r `$DATE`.zip *.jpg
		echo "se sube al S3"
		$RM *.jpg
		;;
        *)
                echo "#################################################################"
                echo "#              Convirtiendo Imagenes en VIDEO                   #"
                echo "#################################################################"
                echo "#                                                               #"
                echo "#                            \|||/                              #"
                echo "#                            (o o)                              #"
                echo "#                   ------ooO-(_)-Ooo------                     #"
                echo "#                                                               #"
                echo "#################################################################"
                echo
                echo "Use: ./Png2Mp4AWS.sh {capture|confCron|rmCron|sendS3}"
                echo
                exit 1
                ;;
esac
