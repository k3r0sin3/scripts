#!/bin/bash

for i in {1..254} ;do (ping 10.50.25.$i -c 1 -w 5  >/dev/null && echo "10.50.25.$i" &) ;done | sort -t . -k 3,3n -k 4,4n -o /tmp/alivehosts; cat /tmp/alivehosts
