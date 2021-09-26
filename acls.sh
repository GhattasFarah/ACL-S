#!/bin/bash

#This command is to recursivley set the owner of all files and directories
#to the administrator in order to give them full control of system.
setfacl -m g:receptionists:rx patients.sh
chgrp administrators /opt/WellingtonClinic
chgrp -R administrators /opt/WellingtonClinic/staff

#This command is to recursivley remove all permissions for other users
setfacl -R -m o:0 /opt/WellingtonClinic/

#This is to give permissions for clinic groups to access directories
setfacl -m g:receptionists:rx /opt/WellingtonClinic
setfacl -m g:nurses:rx /opt/WellingtonClinic
setfacl -m g:doctors:rx /opt/WellingtonClinic

setfacl -m g:receptionists:rx /opt/WellingtonClinic/staff
setfacl -m g:nurses:rx /opt/WellingtonClinic/staff
setfacl -m g:doctors:rx /opt/WellingtonClinic/staff


setfacl -m g:receptionists:rx /opt/WellingtonClinic/patients
setfacl -m g:nurses:rx /opt/WellingtonClinic/patients
setfacl -m g:doctors:rx /opt/WellingtonClinic/patients

setfacl -m g:receptionists:rx /opt/WellingtonClinic/scripts
setfacl -m g:nurses:rx /opt/WellingtonClinic/scripts
setfacl -m g:doctors:rx /opt/WellingtonClinic/scripts

#This is giving all groups of the clinic permission to execute the
#searchpatient.sh script

setfacl -m g:doctors:rx searchpatient.sh
setfacl -m g:nurses:rx searchpatient.sh
setfacl -m g:administrators:rx searchpatient.sh
setfacl -m g:receptionists:rx searchpatient.sh

#Making each patient a group to track every doctor they visit
groupadd mi23122001
groupadd dt08031993
groupadd le07041970
groupadd pa13091976

#Changing group owners of each patient to that patients group so when a
#doctor is added he has the right permission
cd ..
cd patients

#Setting the directory to not being able to list from other users
setfacl -m o:r mi23122001/
cd mi23122001
chgrp mi23122001 pmedicalrecord.log

#Setting permissions so only assigned doctors can read and write to the
#patients medical record
setfacl -m g:mi23122001:rw pmedicalrecord.log
setfacl -m o:0 pmedicalrecord.log

#This line grants only receptionits to be able to modify patients basic info
setfacl -m g:receptionists:rw pbasicinfo.log
#This filters the permission for nurses to only view the medication and dosage
setfacl -m g:nurses:r pmedicalrecord.log | awk 'BEGIN {FS = ","}{print $(NF-1), $NF)'

cd ..
setfacl -m o:r dt08031993/
cd dt08031993
chgrp dt08031993 pmedicalrecord.log
setfacl -m g:dt08031993:rw pmedicalrecord.log
setfacl -m o:0 pmedicalrecord.log #removes permission for any others to view
setfacl -m g:receptionists:rw pbasicinfo.log
setfacl -m g:nurses:r pmedicalrecord.log | awk 'BEGIN {FS = ","}{print $(NF-1), $NF)'

cd ..
setfacl -m o:r le07041970/
cd le07041970
chgrp le07041970 pmedicalrecord.log
setfacl -m g:le07041970:rw pmedicalrecord.log
setfacl -m o:0 pmedicalrecord.log
setfacl -m g:receptionists:rw pbasicinfo.log
setfacl -m g:nurses:r pmedicalrecord.log | awk 'BEGIN {FS = ","}{print $(NF-1), $NF}'

cd ..
setfacl -m o:r pa13091976/
cd pa13091976
chgrp pa13091976 pmedicalrecord.log
setfacl -m g:pa13091976:rw pmedicalrecord.log
setfacl -m o:0 pmedicalrecord.log
setfacl -m g:receptionists:rw pbasicinfo.log
#this sets the nurses permission to only read the dosage and medication of the patient
#setfacl -m g:nurses:r pmedicalrecord.log | awk 'BEGIN {FS = ","}{print $(NF-1), $NF}'

#This is giving permission to receptionists to create directories for
#new patients being registered
cd ..
cd ..
setfacl -m g:receptionists:rwx patients/

#Giving administrators read and write permissions for staff info
cd staff
cd doctors

setfacl -m g:administrators:rw mate1997/sbasicinfo.log
setfacl -m g:administrators:rw brki2018/sbasicinfo.log
setfacl -m g:administrators:rw mada1993/sbasicinfo.log
setfacl -m g:administrators:rw labo2002/sbasicinfo.log

cd ..
cd nurses
setfacl -m g:administrators:rw lubl2004/sbasicinfo.log
setfacl -m g:administrators:rw phmc2008/sbasicinfo.log

cd ..
cd receptionists
setfacl -m g:administrators:rw ansm2002/sbasicinfo.log

cd ..
cd administrators
setfacl -m g:administrators:rw pasa1995/sbasicinfo.log
