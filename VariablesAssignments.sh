# Course Id: CST 383
# Team Identification: 5
# Team Members:
# Austin Delorme
# Alex Molina
# Christopher Cowley
# Project Deliverable: Assignment 3 (Team Project I): Variables Assignments

getUserInput()
{
	echo "Enter the reference cell calibration factor: "
	read answers[0] #CFref

	echo "Enter reference cell temperature coefficient: "
	read answers[1] #TCref

	echo "Enter Temperature coefficient for voltage: "
	read answers[2] #v1

	echo "Enter Temperature coefficient for maximum voltage: "
	read answers[3] #v2

	echo "Enter Temperature coefficient for FF: "
	read answers[4] #f

	echo "Enter Temperature coefficient for power: "
	read answers[5] #p

}

declare -a Date
declare -a Time
declare -a Tamb
declare -a Tref
declare -a Tm
declare -a Irradiande
declare -a Isc
declare -a Voc
declare -a Imp
declare -a Vmp
declare -a Pm
declare -a FF
declare -a answers

Date[0]="2/19/2001"
Date[1]="2/19/2001"
Date[2]="2/19/2001"
Time[0]="9:59"
Time[1]="9:59"
Time[2]="10:00"
Tamb[0]="18.2"
Tamb[1]="18.2"
Tamb[2]="18.2"
Tref[0]="25.2"
Tref[1]="25.2"
Tref[2]="25.4"
Tm[0]="22.0"
Tm[1]="23.7"
Tm[2]="25.2"
Irradiande[0]="1013.0"
Irradiande[1]="1015.0"
Irradiande[2]="1016.9"
Isc[0]="4.94"
Isc[1]="4.93"
Isc[2]="4.95"
Voc[0]="22.30"
Voc[1]="22.12"
Voc[2]="22.00"
Imp[0]="4.40"
Imp[1]="4.48"
Imp[2]="4.42"
Vmp[0]="17.70"
Vmp[1]="17.15"
Vmp[2]="17.29"
Pm[0]="77.94"
Pm[1]="76.85"
Pm[2]="76.34"
FF[0]="70.8"
FF[1]="70.4"
FF[2]="70.1"

echo ${Date[*]}
echo ${Time[*]}
echo ${Tamb[*]}
echo ${Tref[*]}
echo ${Tm[*]}
echo ${Irradiande[*]}
echo ${Isc[*]}
echo ${Voc[*]}
echo ${Imp[*]}
echo ${Vmp[*]}
echo ${Pm[*]}
echo ${F[*]}

getUserInput 

CFref=${answers[0]}
TCref=${answers[1]}
v1=${answers[2]}
v2=${answers[3]}
f=${answers[4]}
p=${answers[5]}

echo #newline after input
echo 'You entered: '
echo -e 'CFref:\t' $CFref
echo -e 'TCref:\t' $TCref
echo -e 'v1:\t' $v1
echo -e 'v2:\t' $v2
echo -e 'f:\t' $f
echo -e 'p:\t' $p


