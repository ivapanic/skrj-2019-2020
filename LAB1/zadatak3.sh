#!/bin/bash


for file in "localhost_access_log.*"
do
	echo "datum: $file | cut -d "." -f 2 | sed -E 's/(....)-(..)-(..)/\3-\2-\1/g'"
	echo "-------------------------------------------"
	cat $file | cut -d '"' -f2 | sort | uniq -c | tr -s " " | sort -nr 
done

	




