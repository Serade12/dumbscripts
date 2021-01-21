#! /bin/bash

command1=$(grep identity /etc/audit/rules.d/*.rules)
command2=$(auditctl -l | grep identity)

if [ -z $command2 ];then
	if [ -z $command1 ];then
		echo "Non-compliance: Yes"
		echo "Both Files doesnt exist or not collated"
	else
		echo "Non-compliance: Yes"
		echo "/etc/audit/rules.d/*.rules Does not exist"
	fi
else
	if [ $command1 == $command2 ];then
		echo "Non-compliance: No"
	else
		echo "Non-compliance: Yes"
		echo $command2
		echo 
		echo "Does not match"
		echo $command1
		echo
	fi
fi
