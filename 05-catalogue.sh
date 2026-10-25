#!/bin/bash
app_name="catalogue"
source ./comman.sh
app_setup app_name
nodejs_setup
systemd_setup app_name



cp "$scripts_dir/mongo.repo" /etc/yum.repos.d/mongo.repo
validate $? "Adding mongo repo"

dnf install mongodb-mongosh -y &>> $logs_file
validate $? "Installing mongodb"

products_count=$(mongosh --host "mongodb.$domain_name" --quiet --eval 'db.getSiblingDB("catalogue").products.countDocuments()' 2>> $logs_file)
validate $? "Connecting mongodb"

if [ $products_count -eq 0 ]; then 
    mongosh --host "mongodb.$domain_name" </app/db/master-data.js &>> $logs_file
    validate $? "Loading products"
else 
    echo -e "$(time_stamp) [INFO] Products are already loaded...${Y}SKIPPING${N}"
fi

restart
total_time