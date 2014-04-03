#!/bin/sh
echo "CST383 S14 - Address book database" > header
echo "FirstName MiddleInitial(Optional) LastName SSN/ID Email Phone State Street# StreetName Apt#(optional) City Zip" >> header
cat header team*.dat > addressbook.db
rm header