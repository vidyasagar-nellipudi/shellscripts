#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR: Please run with root user"
else
    echo "you are root user"
fi