#!/bin/bash
# Autor
#######################
# Var:
#######################
LOCATION=~/screenCap
BASEIMG=ps
SCROT=/usr/bin/scrot
# Quality image 1-100
Q_IMG=20
CRONF=cronPS
RM=/bin/rm

case "$1" in
        capture)
		DISPLAY=:0 $SCROT '$LOCATION/$BASEIMG%s.jpg' -q $Q_IMG
                ;;
        confCron)
		if [ ! -d "$LOCATION" ]; then
                	mkdir -p $LOCATION
                fi
		
		echo "*/1 * * * * root $LOCATION/Png2Mp4AWS.sh capture" > /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 10 && $LOCATION/Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 20 && $LOCATION/Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 30 && $LOCATION/Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 40 && $LOCATION/Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
		echo "*/1 * * * * root sleep 50 && $LOCATION/Png2Mp4AWS.sh capture" >> /etc/cron.d/$CRONF
                ;;
	rmCron)
		$RM /etc/cron.d/$CRONF
		;;
	sendS3)
		echo "Se envia al S3"
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




mkdir -p $LOCATION
