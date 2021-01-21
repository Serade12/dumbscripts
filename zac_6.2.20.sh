#ITSMA PArt 2.2 6.2.20
echo " "
result=Yes

check=$(grep -E -v '^(halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }') 

if [ -n "$check" ]; then 
	echo "Audit Title: Ensure all users' home directories exist. "
	echo "Non-Complaince: $result"
	echo "Details: See Below"
	echo " "
	echo "$check"| while read -r user dir;do
		if [ ! -d "$dir" ];then
			echo "The home directory ($dir) of user $user does not exist."
		fi
	done
	echo 
else
	result="No"
	echo "Audit Title: Ensure all users' home directories exist." 
	echo "Non-Complaince: $result"
	echo "Details: NIL"
fi
