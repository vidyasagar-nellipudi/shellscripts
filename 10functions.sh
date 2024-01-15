#!/bin/bash

VALIDATE(){
    if [ $1 -gt 0 ]
    then
        echo "installing $2 is failed"
        exit 1
    else
        echo "installing $2 is success"
    fi
}

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR: Please run with root user"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y

VALIDATE $? "mysql"

yum install git -y

VALIDATE $? "git"