#! /bin/bash

echo "Audit Title: Ensure users own their home directories"

checkfile=$(grep -E -v '^(halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6}')

if [ -n "$checkfile" ];then
	echo "Non-compliance: Yes"
	echo "Details: See Below"
	echo $checkfile | while read user dir;do
       		if [ ! -d "$dir" ];then
			echo "The home directory ($dir) of user $user does not exist."
			echo "" 
		else
			owner=$(stat -L -c "%U" "$dir")
			if [ "$owner" != "$user" ];then
				echo "The home directory ($dir) of user $user is owned by $owner."
			echo 
			fi
		fi	
	done
	echo	
	
else
	echo "Non-compliance: No"
	echo "Details: None"
fi

