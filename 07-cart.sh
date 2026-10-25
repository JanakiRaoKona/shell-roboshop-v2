#!/bin/bash
app_name="cart"

source ./comman.sh

nodejs_setup
app_setup
systemd_setup
restart
total_time