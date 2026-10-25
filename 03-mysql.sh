#!/bin/bash

source ./comman.sh

dnf module enable mysql:8.4 -y &>> $logs_file
dnf install mysql-server -y &>> $logs_file
validate $? "Installing Mysql"

systemctl enable mysqld &>> $logs_file
systemctl start mysqld &>> $logs_file
validate $? "enable & Start Mysql"

mysql_secure_installation --set-root-pass RoboShop@1 &>> $logs_file
validate $? "Setup mysql root password"

total_time