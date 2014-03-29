regex='^[A-Z][a-z]*[A-Z]\{0,1\}[A-Z][a-z]*[0-9]\{9\}.*@.*\..*[0-9]\{10\}[A-Z]\{2\}[0-9]\{1,\}[A-Za-z]\{1,\}[0-9]*[A-Za-z]\{1,\}[0-9]\{5\}$'

echo "=======MATCHES===="
grep $regex *.dat

valid='[A-Za-z0-9]*@[A-Za-z0-9]*\.[A-Za-z0-9]*$'
# characters, @ sign, characters, period, characters, end of line

echo "===NON-MATCHES===="
grep -v $regex *.dat | grep "[a-zA-Z]*\.dat:$valid"
# incorrect format but correct characters
# grep returns results from different files in form of
# username.dat:<text>
# matched by
# [a-zA-Z]*\.dat:

echo "===INVALID ENTRIES===="
grep -v $valid *.dat





# first name
# [A-Z][a-z]*

# middle initial
# [A-Z]\{0,1\}

# last name
# [A-Z][a-z]*

# SSN
# [0-9]\{9\}

# first part of email
# .*@

# second part of email, any characters then a dot then any characters
# .*\..*

# phone number
# [0-9]\{10\}

# state code
# [A-Z]\{2\}

# street number (one or mroe digits)
# [0-9]\{1,\}

# street name (one or more letters)
# [A-Za-z]\{1,\}

# apt number (0 or more numbers)
# [0-9]*

# city (one or more letters)
# [A-Za-z]\{1,\}

# zip code
# [0-9]\{5\}