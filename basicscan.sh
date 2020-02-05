echo "Ctrl+C this thing if you aren't running with root privileges!"
nmap -PN -T4 -A <IP addr> > /tmp/<IP addr>

#make sure to use the NSE located at /usr/share/nmap/scripts
#Usage example: nmap --script==rdp-enum-encryption.nse,rdp-ntlm-info.nse,rdp-vuln-ms12-020.nse <IP addr> >> /tmp/<IP addr>
