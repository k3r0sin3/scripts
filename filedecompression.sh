#!/bin/bash

# File: 	filedecompression.sh
# Name: 	K3r0sin3
# Github: 	https://github.com/k3r0sin3
# Usage:	./filedecompression.sh
# Note:		The file being decompressed must be the file with the latest changes in the directory ("ls -t | head -1" will confirm)


#Ask the user which file they want to decompress
echo "Which file would you like me to decompress? I need the full filename. This could take a while, so grab a coffee while I decompress it!"
read filename 

myZip=$filename

while true;do

fileCheck=$(file $myZip)
	 
echo Loopstart this file $myZip
echo Loopstart this type $fileCheck
	 
if  [[ "$fileCheck" != *"bzip2"* ]] && [[ "$fileCheck" != *"gzip"* ]] && [[ "$fileCheck" != *"tar archive"* ]];then
	echo No compressed files remain, exiting
	exit 1
		 
elif  [[ "$fileCheck" == *"bzip2"* ]];then
        bzip2 -df $myZip && echo Decompressed bzip file $myZip
		     
elif  [[ "$myZip" == *".gz"* ]] && [[ "$fileCheck" == *"gzip"* ]];then
	gzip -kd $myZip && echo Decompressed gzip file $myZip
	rm $myZip && echo Deleted gzip file $myZip
				     
elif  [[ "$fileCheck" == *"gzip"* ]];then
	mv $myZip $myZip.gz
	gzip -kd $myZip && echo Decompressed gzip file $myZip
	rm $myZip && echo Deleted gzip file $myZip
						 					 
elif  [[ "$fileCheck" == *"tar archive"* ]];then
        tar xvmf $myZip && echo Decompressed a_tar file $myZip
	rm $myZip && echo Deleted a_tar file $myZip
							 
fi
myZip=$(ls -t1 | head -n 1)
echo $myZip

done
