#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

# Checking root user or not

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR: Please run with root user $N"
    exit 1
else
    echo -e "$G you are root user $N"
fi

echo " All arguments passed: $@"

