#!/bin/bash
app_name=user

source ./comman.sh

nodejs_setup
app_setup app_name
systemd_setup app_name
restart
total_time