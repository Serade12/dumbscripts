#! /bin/bash

umask=$(egrep -c "\s+umask\s+[0-9]" /etc/bashrc)

if [ $(grep "umask" /etc/bashrc | egrep -c "0[0-2][0-7]") -eq ${umask} ]
then
	if [ $(grep "umask" /etc/profile /etc/profile.d/*.sh | egrep -c "0[0-7][3-7]" -eq ${umask} 2> /dev/null) ]
       	then
		result="No"
		echo "Non-compliance: $result"
	       	echo "Details: None"
	else
		result="Yes"
		echo "Non-compliance: $result"
		echo "Details: See Below"
		grep -P "^[^#;]*umask" /etc/profile /etc/profile.d/*.sh
	fi
else
	result="Yes"
	echo "Non-compliance: $result"
	echo "Details: See Below"
	grep -P "^[#;]*umask" /etc/bashrc
fi
