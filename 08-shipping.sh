#!/bin/bash
app_name=shipping
source ./comman.sh

app_setup app_name
java_setup
load_shipping_data
systemd_setup app_name
restart
total_time