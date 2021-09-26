#!/bin/bash

#this is to get into the patietns directory
echo "Enter the following information: "
read -p "Patients first name: " fname
read -p "Patients last name: " lname
read -p "Patients date-of-birth: " dob

#going into the patients directory
cd ..
cd patients
cd "${fname:0:1}${lname: -1}${dob:0:2}${dob:3:2}${dob:6:4}"

#writing the information to the patients medical record
echo "Enter following for visit: "
read -p "Date of visit(dd/mm//yyy): " date
read -p "Dcotor examined: " doc
read -p "Healh issue: " issue
read -p "Medication: " meds
read -p "Dosage: " dosage

echo $date,$doc,$issue,$meds,$dosage >> pmedicalrecord.log
