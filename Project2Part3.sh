#! /bin/sh

# checks that every address generated includes a state code that follows the phone number.

#Task 1
grep -v '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' *
#Task 2
grep - v ''
#Task 3
grep -v '[0-9][0-9][0-9][0-9][0-9]$' *
#Task 4
grep -v '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z]' *
#Task 5
grep -v ''


#Task 6


#Task 7

#Task 8
cat dirname/* > addressbook.db
#Task 9
