#!/bin/bash

echo "What would you like to do?"
echo "1)Register a new patient"
echo "2)Make an appointment"
read selection;
#simple case bash structure
case $selection in
	1) echo "Enter following infomartion about the patient:"
	read -p "First name: " fname
	read -p "Surname: " lname
	read -p "Date of birth(23/12/2001): " dob
	read -p "Gender: " gender
	read -p "Physical address: " addy
	read -p "Email: " email
	read -p "Phone number: " number
	read -p "Registered doctor: " doc
	#this goes into the patients directory and makes the patients
	#directory with relevant directory
	cd ..
	cd patients
	mkdir "${fname:0:1}${lname: -1}${dob:0:2}${dob:3:2}${dob:6:4}"
	cd "${fname:0:1}${lname: -1}${dob:0:2}${dob:3:2}${dob:6:4}"
	touch pbasicinfo.log
	touch pmedicalrecord.log
	echo $fname $lname,$dob,$gender,$addy,$email,$number,$doc >> pbasicinfo.log
	;;

	2)
	#This is to get the patients directory
	echo "Enter the following information about the patient: "
	read -p "Patients first name: " fname
	read -p "Patients surname: " lname
	read -p "Patients date-of-birth: " dob
	read -p "Enter doctors username for appointment: " doc
	cd ..
	cd patients

	#This is for filtering the log file to only print the date and 
	#doctor visited
	cd "${fname:0:1}${lname: -1}${dob:0:2}${dob:3:2}${dob:6:4}"
	cat pmedicalrecord.log | awk 'BEGIN {FS = ","}{print $1,$2}'
	#this is storing all the doctors visited in an array
	doctors=( $(cut -d "," -f2 pmedicalrecord.log ) )

	#This is to assign the new doc permissions if he's new to the patient
	if [[ ! " ${doctors[@]} " =~ " ${doc} " ]]; then
		sudo usermod -a -G "${fname:0:1}${lname: -1}${dob:0:2}${dob:3:2}${dob:6:4}" $doc
	fi
	;;
esac
