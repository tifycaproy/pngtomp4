#!/bin/bash
#1.- Comprimir
date=$(date +%d%m%y-%s)
zip -r /home/cpalacios/Freelancer/lambda/$date.zip /home/cpalacios/Freelancer/lambda/*.jpg
rm /home/cpalacios/Freelancer/lambda/*.jpg
#2.- Subir al S3
#touch /home/cpalacios/Freelancer/lambda/echo
