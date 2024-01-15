#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"


TIMESTAMP=$(date +%F-%H-%M-%S)

LOG="/tmp/$0-$TIMESTAMP.log"

echo " script started executing at $TIMESTAMP "

VALIDATE(){
    if [ $1 -gt 0 ]
    then
        echo -e "installing $2 is $R failed $N"
        exit 1
    else
        echo -e "installing $2 is $G success $N"
    fi
}



if [ $ID -ne 0 ]
then
    echo -e "$R ERROR: Please run with root user $N"
    exit 1
else
    echo -e "$G you are root user $N"
fi

yum install mysql -y &>> $LOG

VALIDATE $? "mysql"

yum install git -y &>> $LOG

VALIDATE $? "git"