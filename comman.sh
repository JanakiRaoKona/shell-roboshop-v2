
user_id=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/log/roboshop"
logs_file="${logs_folder}/${0}.log"

check_root () {

if [ $user_id -ne 0 ]; then
    echo "Please run this script with sudo access..."
    exit 1
fi

}

mkdir -p "${logs_folder}"

echo "$(time_stamp) [INFO] ==== Script started execution ====" | tee -a $logs_file

time_stamp() {
    date +"%F %T"
}

validate () {
    
    if [ $? -ne 0 ]; then 
        echo -e "$(time_stamp) [ERR] ${2}...${R}FAILED${N}" | tee -a $logs_file
        exit 1
    else
        echo -e "$(time_stamp) [INFO] ${2}...${G}SUCCESS${N}" | tee -a $logs_file
    fi
}

total_time () {
    echo "$(time_stamp) [INFO] excution completed in seconds ${SECONDS}" | tee -a $logs_file
    echo "$(time_stamp) [INFO] ==== Script completed execution ====" | tee -a $logs_file
}