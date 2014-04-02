filesPattern=data/*.dat

echo "Task 1 failures:"
task1="^[A-Za-z]*[0-9]\{9\}.*"
# some letters followed by 9 digits
grep -vn $task1 $filesPattern
echo

echo "Task 2 failures:"
task2="^[A-Z][a-z]*[A-Z]\{1,2\}[a-z]"
# capital letter, some lowercase letters, one or two capital letters (middle then last), some lowercase
grep -vn $task2 $filesPattern
echo

echo "Task 3 failures:"
task3="[0-9]\{5\}$"
# 5 digits at end of line
grep -vn $task3 $filesPattern
echo

echo "Task 4 failures:"
task4="[0-9]\{10\}[A-Z]\{2\}"
# ten digits followed by two capital
grep -vn $task4 $filesPattern
echo

echo "Task 5 failures:"
task5="@[A-Za-z0-9]\{1,\}\.[A-Za-z0-9]\{1,\}[0-9]\{10\}"
# @ symbol, one or more letters or numbers, period, one or more letters or numbers, 10 digits
grep -vn $task5 $filesPattern
echo

echo "Task 6 failures:"
task6="[0-9]\{9\}[A-Za-z0-9\.]\{1,\}@[A-Za-z0-9]\{1,\}\.[A-Za-z0-9]\{1,\}[0-9]\{10\}"
# 9 digits, one or more letters or numbers or dots, @ symbol, one or more letters or numbers, a dot, one or more letters or numbers, 10 digits
grep -vn $task6 $filesPattern
echo

echo "Task 7 failures:"
task7="[A-Z][A-Z][0-9]\{1,\}[A-Z0-9][A-Za-z0-9]\{1,\}[A-Z][A-Za-z]*"
# two capital letters, 1 or more digits, a capital letter or number (Street), one or more letters or numbers, a capital letter (city), any number of lowercase letters
grep -vn $task7 $filesPattern
echo


valid='^[A-Za-z0-9\.]*@[A-Za-z0-9]*\.[A-Za-z0-9]*$'
#start of line, any character (including periods, for in email address), @ symbol, any characters, period, any characters, and of line
grep -vn $valid $filesPattern