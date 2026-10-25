#!/bin/bash
app_name="cart"

source ./comman.sh

nodejs_setup
app_setup app_name
systemd_setup
restart
total_time