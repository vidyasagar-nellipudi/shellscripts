#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)

LOG="/tmp/$0-$TIMESTAMP.log"

echo " script started executing at $TIMESTAMP" &>> $LOG

# Checking root user or not

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR: Please run with root user $N"
    exit 1
else
    echo -e "$G you are root user $N"
fi

#echo " All arguments passed: $@"

# VALIDATE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e " $2 .... $R Failed $N"
    else
        echo -e " $2 .... $G Success $N"
    fi
}

for package in $@
do
    yum list installed $package &>> $LOG
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOG
        VALIDATE $? "Installation of $package"
    else
        echo -e " $package is already installed....$Y skipping $N"
    fi

done



