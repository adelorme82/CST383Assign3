declare -a answers
echo "Enter the reference cell calibration factor: "
read answers[0]

echo "Enter reference cell temperature coefficient: "
read answers[1]

echo "Enter Temperature coefficient for voltage: "
read answers[2]

echo "Enter Temperature coefficient for maximum voltage: "
read answers[3]

echo "Enter Temperature coefficient for FF: "
read answers[4]

echo "Enter Temperature coefficient for power: "
read answers[5]

export answers