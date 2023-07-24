#!/bin/sh

echo "enter your ip"
read ip

echo "Number of scan"
echo "1 = Intense scan"
echo "2 = Intense scan plus UDP"
echo "3 = Intense scan, all TCP ports"
echo "4 = Intense scan, no ping"
echo "5 = Ping scan"
echo "6 = Quick scan"
echo "7 = Quick scan plus"
echo "8 = Quick traceroute"
echo "9 = Regular scan"
echo "10 = Slow comprehensive scan"

echo "scan number"

read scan

if [ $scan -eq 1 ]
then 
nmap -T4 -A -v $ip
elif [ $scan -eq 2 ]
then 
nmap -sS -sU -T4 -A -v $ip
elif [ $scan -eq 3 ]
then 
nmap -p 1-65535 -T4 -A -v $ip
elif [ $scan -eq 4 ]
then 
nmap -T4 -A -v -Pn $ip
elif [ $scan -eq 5 ]
then 
nmap -sn $ip
elif [ $scan -eq 6 ]
then 
nmap -T4 -F $ip
elif [ $scan -eq 7 ]
then 
nmap -sV -T4 -O -F --version-light $ip
elif [ $scan -eq 8 ]
then 
nmap -sn --traceroute $ip
elif [ $scan -eq 9 ]
then 
nmap $ip
elif [ $scan -eq 10 ]
then 
nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $ip
fi