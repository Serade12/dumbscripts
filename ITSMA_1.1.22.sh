#ITSMA Part 2.2 1.1.22 

echo " "
result="Yes"
if [ $(systemctl is-enabled autofs 2> /dev/null | grep -E 'disabled' | wc -l) -ne 0 ]
then	
	result="No"
	echo "Audit Title: Disable Automounting "
	echo "Non-Complaince: $result"
	echo "Details: NIL "
else 
	echo "Audit Title: Diable Automounting"
	echo "Non-Compliance: $result"
	echo "Details: See Below"
	echo " "	
	$(systemctl is-enabled autofs)
	echo " "
fi
