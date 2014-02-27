#!/bin/sh
STCVmp() {
	# $1 = Vm
	# $2 = v2
	# $3 = Tm
	STCVmp=`echo "($1+$2*(25-$3-2.5))" | bc -l`
}


STCFF(){
	# $1 = FF
	# $2 = f
	# $3 = Tm
	STCFF=`echo "($1+$2*(25-$3-2.5))" | bc -l`
}

STCVmp 1 2 3
STCFF 3 4 5
echo "STCVmp is $STCVmp"
echo "STCFF is $STCFF"