#!/bin/bash

read -p "Enter doctors username: " doc

#This prints all the patients by thier subdirectory id that the specific
#doctor has seen or examined
id -nG $doc | cut -d' ' -f2-

#getting patients information
read -p "Enter patients first name: " fname
read -p "Enter patients surname: " lname
read -p "Enter patients date-of-birth: " dob

#going into patients directory
cd ..
cd patients
cd "${fname:0:1}${lname: -1}${dob:0:2}${dob:3:2}${dob:6:4}"
cat pmedicalrecord.log | awk 'BEGIN {FS = ","}{print $2}'
