#!/bin/bash

# Specify the Excel file path
excel_file="servers.xlsx"

# Specify the predefined username and password
default_username="your_username"
default_password="your_password"

# Check if the file exists
if [ ! -f "$excel_file" ]; then
  echo "File '$excel_file' does not exist."
  exit 1
fi

# Read the Excel file and execute commands on each server
while IFS=, read -r server_name _; do
  # Print the server name
  echo -e "\nServer: $server_name"

  # SSH into the server and execute a command (e.g., df -h)
  sshpass -p "$default_password" ssh -o StrictHostKeyChecking=no "$default_username"@"$server_name" "df -h"

done < <(tail -n +2 "$excel_file")
