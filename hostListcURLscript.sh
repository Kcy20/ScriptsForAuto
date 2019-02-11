#!/bin/bash

# Bash scrip that will read a list of hosts in www.exampleHost:443 format.

# Adding in the :443 port just in case you needed to specify other ports

#### Ideas to add in
# It would probably be a good idea to have a -flag option to allow you to change ports.
####

# /path/to/hosts.txt
cat /tmp/hosts.txt |  while read output

do
  curl -o /dev/null --connect-timeout 3 -k -s -w "\nHTTP CODE: %{http_code}\nURL: %{url_effective}\nIP: %{remote_ip}\nPort: %{remote_port}\nTime_Connect: %{time_connect}\nRedirect_URL: %{redirect_url}\n\n" https://"$output"

done


#curl -o /dev/null --connect-timeout 3 -k -s -w "HTTP CODE: %{http_code}\nIP: %{remote_ip}\nPort: %{remote_port}\nRedirect_URL: %{redirect_url}\n\n" https://"$output"
