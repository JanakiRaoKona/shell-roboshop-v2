#!/bin/bash

source ./comman.sh

app_name="user"
nodejs_setup
app_setup
systemd_setup
restart
total_time