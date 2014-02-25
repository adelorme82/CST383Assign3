#!/bin/sh
STCVmp() {
	result=`echo "($1+$2*(25-$3-2.5))" | bc -l`
}

#Vm +v2 (25-tm-2.5)

#STCFF(){
#	return $(( FF + f (25-tm-2.5) ))
#}

STCVmp 1 2 3
echo "result is $result"