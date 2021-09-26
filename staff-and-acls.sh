#!/bin/bash

#creating the groups for users to be added to
groupadd doctors
groupadd nurses
groupadd administrators
groupadd receptionists

#this is creating all the users and adding them to the correct group
sudo useradd pasa1995 #this creates the administrator user
#the next line is to add the administrator to the root and administrator
#group
sudo usermod -a -G root,administrators pasa1995
sudo useradd ansm2002 -g receptionists
sudo useradd phmc2008 -g nurses
sudo useradd lubl2004 -g nurses
sudo useradd labo2002 -g doctors
sudo useradd mada1993 -g doctors
sudo useradd brki2018 -g doctors
sudo useradd mate1997 -g doctors

#getting out of the script folder and into staff to create
#the users subdirectory with file inside it
cd ..
cd staff
cd administrators

#creating the subdirectory for the user and the correct file
#for the user within thier subdirectory
mkdir pasa1995
cd pasa1995
touch sbasicinfo.log
echo "Pauline Sanderson,08/03/1998,1995,2452 Randolph Street Bedford Auckland 7752,paulsand@admins.co.nz,03747543" >> sbasicinfo.log

#getting into the receptionists directory and adding the correct user folder
cd ..
cd ..
cd receptionists
mkdir ansm2002
cd ansm2002
touch sbasicinfo.log
echo "Andy Smith,13/09/1974,2002,58 Foster Avenue Wellington,smith.adny74@gmail.com,07284756" >> sbasicinfo.log

#getting into the nurses folder
cd ..
cd ..
cd nurses
mkdir phmc2008
cd phmc2008
touch sbasicinfo.log
echo "Phil McGraw,15/04/1974,2008,45 Razyn Street Petone Lowerhutt,philmcg@gmail.com,02384756" >> sbasicinfo.log

#going into the nurses folder to create the other nurse folder
cd ..
mkdir lubl2004
cd lubl2004
touch sbasicinfo.log
echo "Lucia Blakeley,11/09/1980,2004,935 Massachusetts Avenue Hamilton 5462,lucyblak@outlook.com,3834763" >> sbasicinfo.log

#going into the doctor directory 
cd ..
cd ..
cd doctors
mkdir mate1997
cd mate1997
touch sbasicinfo.log
echo "Mary Teresa,03/08/1953,1997,173 Rnd Street Kelburn,m.theresa@yahoo.com,04528293" >> sbasicinfo.log

cd ..
mkdir brki2018
cd brki2018
touch sbasicinfo.log
echo "Breana Kipling,03/08/1991,2018,4548 River Road HugoTown Auckland 5513,szzh8@tempmail.net,071943668" >> sbasicinfo.log

cd ..
mkdir mada1993
cd mada1993
touch sbasicinfo.log
echo "Mandy Dannel,15/12/1965,1993,343 Norma Avenue Dayton Napier 6371,mandydl@gmail.com,052637445" >> sbasicinfo.log

cd ..
mkdir labo2002
cd labo2002
touch sbasicinfo.log
echo "Lance Bourne,07/04/1970,2002,25 Ferguson Street Greytown 8567,lancb@gmail.com,083736456" >>sbasicinfo.log


