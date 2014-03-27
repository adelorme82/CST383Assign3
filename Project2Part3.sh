#! /bin/sh

# checks that every address generated includes a state code that follows the phone number.


grep -v '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z]' *



