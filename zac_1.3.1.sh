#ITSMA Part 2.2 1.3.1

result=Yes
echo " "
if [ $(rpm -q sudo) == "sudo" ] 
then 
	echo "Audit Title: Ensure sudo is installed "
	echo "Non-Compliance: $result"
	echo "Details: See Below"
	echo " "
	$(rpm -q sudo)
else 
	result="No"
	echo "Aduit Title: Ensure sudo is installed "
	echo "Non-Complaince: $result "
	echo "Details: NIL"
	echo " "
fi
