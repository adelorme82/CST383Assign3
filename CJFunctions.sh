STCIrradiance()
{
	#$1 = Irradiance
	#$2 = CFref
	#$3 = TCref

STCIrradiance =`echo "($1*$2)/($2+$3($3-25))" | bc -l`
return $STCIrradiance
}

STCPm()
{
	#$1 = PM
	#$2 = STCIrradiance
	#$3 = p
	#$4 = Tm 
	
STCPm=`echo $1/$2*100+$3(25-$4-2.5) | bc -l`
return $STCPm
}
STCVoc()
{
	#$1 = Voc
	#$2 = v1
	#$3 = Tm
	
STCVoc =`echo $1+$2(25-$3-2.5) | bc -l`
return $STCVoc
}

