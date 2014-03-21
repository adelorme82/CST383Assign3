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

STCIsc 8 4 2
echo "STCIsc result is $STCIsc"

STCImp 3 8
echo "STCImp result is $STCImp"

average 2 4 6
echo "Average result is: $average"

. ./alexfunction.sh

STCVmp 4 5 6
echo "alex's is $STCVmp"
