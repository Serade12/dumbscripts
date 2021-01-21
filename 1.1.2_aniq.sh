#! /bin/bash

result="No"
echo "Audit Title: Ensure /tmp is configured "
if [[ "$(mount | grep -E '\s/tmp\s')" =~ ".*tmpfs\s\(rw.*nosuid.*nodev.*noexec.*relatime\)" ]]
then
	echo "Non-compliance: $result"
	echo "Details: None"
	echo

else
	if [ $(systemctl is-enabled tmp.mount 2> /dev/null | grep -E 'disabled' | wc -l) -ne 0 ]
	then
		result="Yes"
		echo "Non-compliance: $result"
		echo "Details: see Below"
		echo "/tmp is not mounted"
	
	else 
		result="Yes"
		echo "Non-compliance: $result"
		echo "Details: See below"
		echo "/tmp is not mounted"
		echo " /tmp is not $(systemctl is-enabled tmp.mount)"	
	fi
fi

