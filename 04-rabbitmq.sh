#!/bin/bash

source ./comman.sh


cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo &>> $logs_file
validate $? "Adding Rabbitmq server"

dnf install erlang rabbitmq-server -y &>> $logs_file
validate $? "Installing Rabbitmq"

systemctl enable rabbitmq-server &>> $logs_file
systemctl start rabbitmq-server &>> $logs_file
validate $? "enable & start Rabbitmq"

rabbitmqctl list_users | grep -qw "roboshop"
if [ $? -ne 0 ]; then 
    rabbitmqctl add_user roboshop roboshop123 &>> $logs_file
    validate $? "Creating user for Rabbitmq server"
else
    echo -e "$(time_stamp) [INFO] Rabbitmq user is already exist...${Y}SKIPPING${N}" | tee -a $logs_file
fi

rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>> $logs_file
validate $? " Setting permissions for Rabbitmq server"

total_time