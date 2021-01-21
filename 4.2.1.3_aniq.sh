#! /bin/bash

echo "Audit Title: Ensure rsyslog default file permissions are configured"
echo " "
result="No"

if [ $(grep ^\FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | grep -E '(0640||0600)' | wc -l) -ne 0 ]
then

	result="No"
	echo "Non compliance: $result"
	echo "Details: See below"
	echo
else
	result="Yes"
	echo "Non compliance: $result"
	echo "Details: See below"
	$(grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf)
fi
