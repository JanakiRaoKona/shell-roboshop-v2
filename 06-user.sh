#!/bin/bash
app_name=user

source ./comman.sh


app_setup app_name
nodejs_setup
systemd_setup app_name
restart
total_time