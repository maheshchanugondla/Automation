# writing the shell script code for i node usage

#!/bin/bash

#Get the list of servers from a file
servers=$(cat servers.txt)
#specify the excel filepath
excel_file="servers.xlsx"

#check if file exists
if [! -f "excel_file"];then
echo "file '$excel_file'does not exists."
exit1
fi

#read the excel file and execute the 


ls-l
Username=cm49013$1
password=mahesh77$2
echo -n "Enter Username:"
echo -n "Enter password:"
read -s Username
/*
Default_username:="cm49013"
Default_password:="password"


*/


#Loop Through each server
for servers in $servers;do

#get the server details

server_details=$(sshpass -p "password" ssh $server "hostname -i;free-m")
disk_usage=$(df-i) | awk'/%i_node_usage/ {print} servers.xlsx
Output=$(echo "disk_usage" | if($disk_usage >=90)

#print the server details
echo "Original disk_usage"
echo "$disk_usage:"
echo "server.$server"
echo "ip Address:$server_details"
echo "free memory:$server_details"

#print the filtered Output
echo -e "\n filter disk_usage (greater than 90%):"

done