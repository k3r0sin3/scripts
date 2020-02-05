#!/bin/bash
#Bash script for zone transfer

if [ -z "$1" ]; then
echo "[*] Zone Transfer Script" #Shows usage to user if no input given
echo "[*] Usage : $0 <domain name>"
exit 0
fi

for server in $(host -t ns $1 | cut -d " " -f 4); do #Finds the name servers associated with domain
host -t AXFR $1 $server #Conducts the zone transfer
done
