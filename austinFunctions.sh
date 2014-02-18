STCIsc()
{
	#$1 = STCPm
	#$2 = STCVoc
	#$3 = STCFF
	STCIsc=`echo "$1/($2*$3)*100" | bc -l`
	return $STCIsc
}

STCImp()
{
	#$1 = STCPm
	#$2 = STCVmp
	STCImp=`echo "$1/$2" | bc -l`
	return $STCImp
}


average()
{
	((sum=$1 + $2 + $3))
	avg=`echo "$sum/3" | bc -l`
}


average 2 4 6
echo "Result is: $avg"
