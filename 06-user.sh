#!/bin/bash
app_name="user"

source ./comman.sh

nodejs_setup
app_setup
systemd_setup
restart
total_time