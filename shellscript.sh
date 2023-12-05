! /bin/bash 
arr_csv=() 
while IFS= read -r line 
do
    arr_csv+=("$line")
done < input.csv

echo "Displaying the contents of array mapped from csv file:"
index=0
for record in "${arr_csv[@]}"; do
    disk_usage=$(df -i)
    echo "Record at index-${index} : $record"
    ((index++))
	done
