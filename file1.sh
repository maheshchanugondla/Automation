#!/bin/bash

# Get the list of servers from a file
servers=$(cat servers.txt)
# Specify the excel filepath
excel_file="servers.xlsx"

# Check if file exists
if [ ! -f "$excel_file" ]; then
    echo "File '$excel_file' does not exist."
    exit 1
fi

echo "Printing servers: $servers"

for server in $servers; do
    Username="cm49013$1"
    password="mahesh77$2"

    echo -n "Enter Username:"
    read -s Username
    echo -n "Enter password:"
    read -s password

    server_details=$(sshpass -p "$password" ssh "$Username"@"$server" "hostname -i; free -m")
    disk_usage=$(df -i | awk '/%i_node_usage/ {print}')
    output=$(echo "$disk_usage" | awk '{if ($1 >= 90) print}')

    # Print the server details
    echo "Original disk usage:"
    echo "$disk_usage"
    echo "Server: $server"
    echo "IP Address: $server_details"
    echo "Free Memory: $server_details"

    # Print the filtered output
    echo -e "\nFilter disk usage (greater than 90%):"
    echo "$output"

done
