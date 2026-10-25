#!/bin/bash
app_name=shipping
source ./comman.sh

app_setup app_name
python_setup
systemd_setup app_name
restart
total_time