#ITSMA PArt 2.2 5.2.15

result=Yes
script=$(sshd -T | grep banner)
echo " "
if [ $(sshd -T | grep banner | egrep "none " | wc -l) -ne 0 ]
then
	result="No"
	echo "Audit Title: Ensure SSH Waning Banner is Configured"
	echo "Non-Compliance: $result"
	echo "Details: NIL"
	echo ' '
else 
	echo "Audit Title: Ensure SSH Waning Banner is Configured"
	echo "Non-Compliance: $result"
	echo "Details: See Below"
	echo " "
	echo $script
	echo ' '
fi
