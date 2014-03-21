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
STCVoltage()
{
	#$1 = Voc
	#$2 = v1
	#$3 = Tm
	result=`echo "$1+$2*(25-$3-2.5)" | bc -l`

}

## These are duplicates of the above STCVoltage
# STCVmp() 
# {
# 	# $1 = Vm
# 	# $2 = v2
# 	# $3 = Tm
# 	STCVmp=`echo "($1+$2*(25-$3-2.5))" | bc -l`
# }
# 
# STCFF()
# {
# 	# $1 = FF
# 	# $2 = f
# 	# $3 = Tm
# 	STCFF=`echo "($1+$2*(25-$3-2.5))" | bc -l`
# }
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
	average=`echo "scale=2; ($1+$2+$3)/3" | bc -l`
	#average=`echo "$sum/3" | bc -l`
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

# echo ${Date[*]}
# echo ${Time[*]}
# echo ${Tamb[*]}
# echo ${Tref[*]}
# echo ${Tm[*]}
# echo ${Irradiande[*]}
# echo ${Isc[*]}
# echo ${Voc[*]}
# echo ${Imp[*]}
# echo ${Vmp[*]}
# echo ${Pm[*]}
# echo ${FF[*]}

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

declare -a STCIrradianceCalc
declare -a STCPmCalc
declare -a STCVocCalc
declare -a STCVmpCalc
declare -a STCFFCalc
declare -a STCIscCalc
declare -a STCImpCalc


echo "===========Starting Loop!==========="
for var in 0 1 2
do
	STCIrradiance ${Irradiande[$var]} $CFref $TCref
	STCPm ${Pm[$var]} $STCIrradiance $p ${Tm[$var]}
	STCVoltage ${Voc[$var]} $v1 ${Tm[$var]}
	STCVoc=$result
	STCVoltage ${Vmp[$var]} $v2 ${Tm[$var]}
	STCVmp=$result
	STCVoltage ${FF[$var]} $f ${Tm[$var]}
	STCFF=$result
	STCIsc $STCPm $STCVoc $STCFF
	STCImp $STCPm $STCVmp

	STCIrradianceCalc[$var]=$STCIrradiance
	echo -e "STCIrradiance: \t \t" $STCIrradiance
	STCPmCalc[$var]=$STCPm
	echo -e "STCPm: \t \t \t" $STCPm
	STCVocCalc[$var]=$STCVoc
	echo -e "STCVoc: \t \t" $STCVoc
	STCVmpCalc[$var]=$STCVmp
	echo -e "STCVmp: \t \t" $STCVmp
	STCFFCalc[$var]=$STCFF
	echo -e "STCFF: \t \t \t" $STCFF
	STCIscCalc[$var]=$STCIsc
	echo -e "STCIsc: \t \t" $STCIsc
	STCImpCalc[$var]=$STCImp
	echo -e "STCImp: \t \t" $STCImp
	echo #linebreak
done
echo "===========Loop Over!==========="

average ${Irradiande[0]} ${Irradiande[1]} ${Irradiande[2]}
ATCIrradiance=$average
average ${Pm[0]} ${Pm[1]} ${Pm[2]}
ATCPm=$average
average ${Voc[0]} ${Voc[1]} ${Voc[2]}
ATCVoc=$average
average ${Vmp[0]} ${Vmp[1]} ${Vmp[2]}
ATCVmp=$average
average ${FF[0]} ${FF[1]} ${FF[2]}
ATCFF=$average
average ${Isc[0]} ${Isc[1]} ${Isc[2]}
ATCIsc=$average
average ${Imp[0]} ${Imp[1]} ${Imp[2]}
ATCImp=$average
average ${Tamb[0]} ${Tamb[1]} ${Tamb[2]}
ATCTamb=$average

average ${STCIrradianceCalc[0]} ${STCIrradianceCalc[1]} ${STCIrradianceCalc[2]}
STCIrradianceFinal=$average
average ${STCPmCalc[0]} ${STCPmCalc[1]} ${STCPmCalc[2]}
STCPmFinal=$average
average ${STCVocCalc[0]} ${STCVocCalc[1]} ${STCVocCalc[2]}
STCVocFinal=$average
average ${STCVmpCalc[0]} ${STCVmpCalc[1]} ${STCVmpCalc[2]}
STCVmpFinal=$average
average ${STCFFCalc[0]} ${STCFFCalc[1]} ${STCFFCalc[2]}
STCFFFinal=$average
average ${STCIscCalc[0]} ${STCIscCalc[1]} ${STCIscCalc[2]}
STCIscFinal=$average
average ${STCImpCalc[0]} ${STCImpCalc[1]} ${STCImpCalc[2]}
STCImpFinal=$average
average ${Tm[0]} ${Tm[1]} ${Tm[2]}
TMFinal=$average

echo
echo "STC"
echo -e "Date is \t \t \t ${Date[0]}"
echo -e "STC Isc average is \t \t $STCIscFinal"
echo -e "STC Voc average is \t \t $STCVocFinal"
echo -e "STC Imp average is \t \t $STCImpFinal"
echo -e "STC Vmp average is \t \t $STCVmpFinal"
echo -e "STC FF average is \t \t $STCFFFinal"
echo -e "STC Pm average is \t \t $STCPmFinal"
echo -e "STC Tamb average is \t \t "
echo -e "STC Irradiance average is \t $STCIrradianceFinal"
echo -e "STC Tm is assumed \t \t 25"

echo
echo "ATC"
echo -e "Date is \t \t \t ${Date[0]}"
echo -e "Initial Isc average is \t \t $ATCIsc"
echo -e "Initial Voc average is \t \t $ATCVoc"
echo -e "Initial Imp average is \t \t $ATCImp"
echo -e "Initial Vmp average is \t \t $ATCVmp"
echo -e "Initial FF average is \t \t $ATCFF"
echo -e "Initial Pm average is \t \t $ATCPm"
echo -e "Initial Tamb average is \t $ATCTamb"
echo -e "Initial Irradiance average is \t $ATCIrradiance"
echo -e "Initial Tm average \t \t $TMFinal"

echo
echo -e "Voltage is \t \t \t -0.131"
echo -e "Max Voltage is \t \t \t -0.135"
echo -e "FF is \t \t \t \t -0.158"
echo -e "Power is \t \t \t -1.142"








# echo -e "\tDate\tIsc\tVoc\tImp\tVmp\tFF\tPm\tTamb\tIrradiance\tTm"
# echo -e "${Date[0]}\t" -n
# echo -e "$STCIscFinal\t" -n
# echo -e "$STCVocFinal\t" -n
# echo -e "$STCImpFinal\t" -n
# echo -e "$STCVmpFinal\t" -n
# echo -e "$STCFFFinal\t" -n
# echo -e "$STCPmFinal\t" -n
# echo -e "TAMB\t" -n
# echo -e "$STCIrradianceFinal\t" -n
# echo -e "$TMFinal\t" -n

# echo -e "	Date	Isc	Voc	Imp	Vmp	FF	Pm	Tamb	Irradiance	Tm"
