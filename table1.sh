declare -a Date
declare -a Time
declare -a Tamb
declare -a Tref
declare -a Tm

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

declare -a Irradiande
Irradiande[0]="1013.0"
Irradiande[1]="1015.0"
Irradiande[2]="1016.9"

declare -a Isc
Isc[0]="4.94"
Isc[1]="4.93"
Isc[2]="4.95"

declare -a Voc
Voc[0]="22.30"
Voc[1]="22.12"
Voc[2]="22.00"

declare -a Imp
Imp[0]="4.40"
Imp[1]="4.48"
Imp[2]="4.42"

declare -a Vmp
Vmp[0]="17.70"
Vmp[1]="17.15"
Vmp[2]="17.29"

declare -a Pm
Pm[0]="77.94"
Pm[1]="76.85"
Pm[2]="76.34"

declare -a FF
FF[0]="70.8"
FF[1]="70.4"
FF[2]="70.1"

declare -a answers
echo "Enter the reference cell calibration factor: "
read CFref

echo "Enter reference cell temperature coefficient: "
read TCref

echo "Enter Temperature coefficient for voltage: "
read v1

echo "Enter Temperature coefficient for maximum voltage: "
read v2

echo "Enter Temperature coefficient for FF: "
read f

echo "Enter Temperature coefficient for power: "
read p