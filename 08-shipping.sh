#!/bin/bash
app_name=shipping
source ./comman.sh

app_setup app_name
java_setup
systemd_setup app_name
restart
total_time