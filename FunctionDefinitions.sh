# Course Id: CST 383
# Team Identification: 5
# Team Members:
# Austin Delorme
# Alex Molina
# Christopher Cowley
# Project Deliverable: Assignment 3 (Team Project I): Function Definitions

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
STCIrradiance()
{
	#$1 = Irradiance
	#$2 = CFref
	#$3 = TCref
	
STCIrradiance=`echo "($1*$2)/($2+$3*($3-25))" | bc -l`

}

STCPm()
{
	#$1 = PM
	#$2 = STCIrradiance
	#$3 = p
	#$4 = Tm 
	
STCPm=`echo "$1/$2*100+$3*(25-$4-2.5)" | bc -l`

}
STCVoc()
{
	#$1 = Voc
	#$2 = v1
	#$3 = Tm
	
STCVoc=`echo "$1+$2*(25-$3-2.5)" | bc -l`

}
STCVmp() 
{
	# $1 = Vm
	# $2 = v2
	# $3 = Tm
	STCVmp=`echo "($1+$2*(25-$3-2.5))" | bc -l`
}

STCFF()
{
	# $1 = FF
	# $2 = f
	# $3 = Tm
	STCFF=`echo "($1+$2*(25-$3-2.5))" | bc -l`
}
STCIsc()
{
	#$1 = STCPm
	#$2 = STCVoc
	#$3 = STCFF
	STCIsc=`echo "$1/($2*$3)*100" | bc -l`
}

STCImp()
{
	#$1 = STCPm
	#$2 = STCVmp
	STCImp=`echo "$1/$2" | bc -l`
}

average()
{
	((sum=$1 + $2 + $3))
	average=`echo "$sum/3" | bc -l`
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

Date[0]="12/30/2006"
Date[1]="12/30/2006"
Date[2]="12/30/2006"
Time[0]="14:18"
Time[1]="14:18"
Time[2]="14:19"
Tamb[0]="15.5"
Tamb[1]="14.8"
Tamb[2]="14.5"
Tref[0]="28.7"
Tref[1]="28.1"
Tref[2]="28.4"
Tm[0]="19.6"
Tm[1]="21.4"
Tm[2]="23.1"
Irradiande[0]="988.1"
Irradiande[1]="989.9"
Irradiande[2]="989.8"
Isc[0]="8.30"
Isc[1]="8.29"
Isc[2]="8.33"
Voc[0]="37.09"
Voc[1]="36.88"
Voc[2]="36.49"
Imp[0]="7.41"
Imp[1]="7.43"
Imp[2]="7.44"
Vmp[0]="28.52"
Vmp[1]="28.11"
Vmp[2]="27.82"
Pm[0]="211.23"
Pm[1]="208.88"
Pm[2]="207.10"
FF[0]="68.6"
FF[1]="68.3"
FF[2]="68.1"

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

STCIrradiance 1 2 3
STCPm 1 2 3 4
STCVoc 1 2 3
STCVmp 1 2 3
STCFF 3 4 5
STCIsc 8 4 2
STCImp 3 8
average 2 4 6

echo "STCIrradiance is $STCIrradiance"
echo "STCPm is $STCPm"
echo "STCVoc is $STCVoc"
echo "STCVmp is $STCVmp"
echo "STCFF is $STCFF"
echo "STCIsc result is $STCIsc"
echo "STCImp result is $STCImp"
echo "Average result is: $average"
