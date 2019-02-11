#!/bin/bash
# curl version 7.54.0
# Script to curl a list of sites for info

#### list of hosts in arrays, can be in any format, but will need to change/add extra into the cURL command below.
declare -a good_hosts=( "www.google.com:443" "www.microsoft.com:443" "www.yahoo.com:443" "www.bing.com:443" "www.apple.com:443")
##test array for bad hosts bad_hosts=( "www.234peanuts.com:443" "www.mrspiggy039.com:443")

# set arraylength for good_hosts array
arraylength=${#good_hosts[*]}

# show list of arrays separately (debug to ensure array is ok)
#echo "List of hosts: ${good_hosts[0]}", "${good_hosts[1]}", "${good_hosts[2]}", "${good_hosts[3]}", "${good_hosts[4]}" "${good_hosts[5]}"

# show arraylength (debug to ensure arraylength is ok)
#echo "arraylength #: $arraylength"

#### for loop to iterate through each host within the array
for ((i=0; i<$arraylength; i++)); do

# add echo in front of curl to display each command being executed
# curl command with diagnostics
     curl -o /dev/null --connect-timeout 3 -k -s -w "\nHTTP CODE: %{http_code}\nURL: %{url_effective}\nIP: %{remote_ip}\nPort: %{remote_port}\nTime_Connect: %{time_connect}\nRedirect_URL: %{redirect_url}\n\n" https://"${good_hosts[i]}"

done

#### exit 
exit 0
