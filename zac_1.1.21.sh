#ITSMA Part 2.2 1.1.21 script

result=Yes
echo " "
#df command to check the file system disk space occupancy, permissions for all users. 2. Format 3. The main parameters -s: given only the total number of data blocks occupied by each paramet...
#--local limit listing to local file systems
#
#2> /dev/null ensures the results is not printed out. 
# -eq 0 checks that nothing is returned.
if [ $(df --local -P | awk '{if (NR!=1) print$6}'| xargs -I '{}' find '{}' -xdev -type d \( -perm -002 -a ! -perm -1000 \) 2> /dev/null | wc -l) -eq 0 ]
then 
	result="no" 
	echo "Audit Title: 1.1.21 Ensure Sticky Bit is set on all world-writables directories"
	echo "Non-Compliance: No "
	echo "Details : NIL"
	echo " "
else 
	echo "Audit Title: 1.1.21 Ensure Sticky Bit is set on all world-writables directories"
	echo "Non-compliance: Yes "
	echo "Details : See Below"
	echo " "
       	$(df --local -P | awk '{if (NR!=1) print$6}'| xargs -I '{}' find '{}' -xdev -type d \( -perm -002 -a ! -perm -1000 \) 2> /dev/null )
	echo " "
fi 

