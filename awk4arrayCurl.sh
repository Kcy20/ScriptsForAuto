#!/bin/bash

# awk to generate a list of hosts into double quotes and space separated values

# to make the usage of the arrayCurl script faster incase you have a large list of hosts to add into the array.

# add in your own hosts file
    awk -v RS='' -v OFS='" "' 'NF { $1 = $1; print "\"" $0 "\"" }' /tmp/host.txt

exit 0
