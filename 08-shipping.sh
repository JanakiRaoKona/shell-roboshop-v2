#!/bin/bash
app_name=shipping
source ./comman.sh

app_setup app_name
java_setup

count=$(mysql -h mysql.$domain_name -u root -pRoboShop@1 -N -B -e "SELECT COUNT(*) FROM cities.cities;" 2>> $logs_file)

if [ -z "$count" ] || [ count -eq 0 ]; then
    mysql -h mysql.$domain_name -uroot -pRoboShop@1 < /app/db/master-data.sql
    validate $? "Loading the shipping data"
else
    echo -e "$(time_stamp) [INFO] Master DB is already loaded...${Y}SKIPPING${N}"
fi

mysql -h mysql.$domain_name -uroot -pRoboShop@1 < /app/db/app-user.sql
validate $? "Creating App user"

systemd_setup app_name
restart
total_time