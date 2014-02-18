STCIsc()
{
	#$1 = STCPm
	#$2 = STCVoc
	#$3 = STCFF
	((STCIsc=$1/($2*$3)*100))
	return $STCIsc
}

STCImp()
{
	#$1 = STCPm
	#$2 = STCVmp
	((STCImp=$1/$2))
	return $STCImp
}


average()
{
	((sum=$1 + $2 + $3))
	((avg=`echo "$sum/3" | bc -l`))
}


average 2 4 6
echo "Result is: $?"
