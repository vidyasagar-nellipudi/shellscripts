#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR: Please run with root user"
    exit 1
else
    echo "you are root user"
fi

yum install mysql -y

if [ $? -gt 0 ]
then
    echo "installing mysql is failed"
    exit 1
else
    echo "installing mysql is success"
fi


yum install git -y

if [ $? -gt 0 ]
then
    echo "installing git is failed"
    exit 1
else
    echo "installing git is success"
fi