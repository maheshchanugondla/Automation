#!/bin/bash

# Define the output CSV file

csv_file="servers.csv"

# Check if the file already exists and remove it to start fresh
if [ -f "$csv_file" ]; then
    rm "$csv_file"
fi

# Add header to the CSV file
echo "ServerName,IP,Port,Username,Password" >> "$csv_file"

# Get the list of servers from a file
servers_file="servers.txt"

if [ ! -f "$servers_file" ]; then
    echo "Error: File '$servers_file' not found."
    exit 1
fi

# Read servers from the file
servers=$(cat "$servers_file")

for server in $servers; do
    echo "Processing server: $server"
    Username="cm49013$1"
    password="mahesh77$2"

    # Prompt user for input
    echo -n "Enter Username for $server: "
    read -r Username
    echo -n "Enter password for $server: "
    read -rs password

    # Connect to the server and retrieve information
    server_details=$(sshpass -p "$password" ssh "$Username@$server" "hostname -i; free -m")
    disk_usage=$(df -i | awk '/%iused/ {print}')
    output=$(echo "$disk_usage" | awk '{if ($5 >= 90) print}')

    # Append server details to the CSV file
   echo "$server,$server_details,$Username,$password" >> "$csv_file"

    # Print the server details
    echo -e "\nOriginal disk usage:"
    echo "$disk_usage"
    echo "Server: $server"
    echo "IP Address: $server_details"
    echo "Free Memory: $server_details"

    # Print the filtered output
    echo -e "\nFilter disk usage (greater than 90%):"
    echo "$output"

done

echo "CSV file '$csv_file' created successfully."
