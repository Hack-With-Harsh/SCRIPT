#!/bin/sh
echo "NUMBER OF OPTIONS HERE TO COMPLETE YOUR TASK EFFICIENTLY"
echo " "
echo "1. Install Nmap By Using Terminal"
echo "2. Install Nmap By Using Github"
echo "3. To install the Nmap-vulners script, navigate to the Nmap scripts directory using the following command"
echo "4. To install the Nmap-vulscan script,navigate to the Nmap scripts directory using the following command"
echo "5. SKIPP"
echo ""
echo "Enter Your Choose Option To Install "
read install
if [ $install -eq 1 ]
then 
apt-get install nmap
elif [ $install -eq 2 ]
then
git clone https://github.com/nmap/nmap.git
cd nmap
./configure
make
make install
elif [ $install -eq 3 ]
then
cd /usr/share/nmap/scripts/
git clone https://github.com/vulnersCom/nmap-vulners.git
elif [ $install -eq 4 ]
then 
cd /usr/share/nmap/scripts/
git clone https://github.com/scipag/vulscan.git
ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan 
cd vulscan/utilities/updater/
chmod +x updateFiles.sh
 ./updateFiles.sh
fi
echo ""
echo "5. When U Have Ip address"
echo "6. When U Have Ip address With Specific PORTS"
echo "7. When U Have Website Link"
echo ""
echo " Enter Your Choice To continue "
read choose
if [ $choose -eq 5 ]
then
echo "ENTER IP ADDRESS "
read ip
elif [ $choose -eq 6 ]
then 
echo "Enter IP Address"
read ip
echo "Enter PORT number"
read port
elif [ $choose -eq 7 ]
then
echo "Enter PHP LINK"
read link
fi
echo ""
echo "8. Usage Of NSE scripts"
echo "9. Usage Of NSE scripts With Specific PORTS"
echo "10. Usage Of Nmap__vuln"
echo "11. Usage Of Nmap Vulscan"
echo "12. Usage Of Nmap Vulscan with specific PORTS And Database"
echo "13. Usage Of http-csrf Cross-Site Request Forgery (CSRF) vulnerabilities are detected by this script."
echo "14. Usage Of http-sherlock: Intends to exploit the “shellshock” vulnerability in web applications"
echo "15. Usage Of http-slowloris-attack: Without launching a DoS attack, this script checks a web server or a target system for vulnerability to perform the Slowloris DoS attack."
echo "16. Usage Of http-vmware-path-vuln: VMWare ESX, ESXi, and Server are all tested for a path-traversal vulnerability"
echo "17. Usage Of http-passwd: Attempts to retrieve /etc/passwd or boot.ini to see if a web server is vulnerable to directory traversal."
echo "18. Usage Of http-internal-ip-disclosure: When sending an HTTP/1.0 request without a Host header, this check determines if the web server leaks its internal IP address."
echo "19. Usage Of http-vuln-cve2013-0156: Detects Ruby on Rails servers that are vulnerable to DOS attacks and command injection."
echo "20 = Intense scan"
echo "21 = Intense scan plus UDP"
echo "22 = Intense scan, all TCP ports"
echo "23 = Intense scan, no ping"
echo "24 = Ping scan"
echo "25 = Quick scan"
echo "26 = Quick scan plus"
echo "27 = Quick traceroute"
echo "28 = Regular scan"
echo "29 = Slow comprehensive scan"
echo ""
echo "Choose Attack Option"
read option
if [ $option -eq 8 ]
then
nmap -sV --script nmap-vulners/ $ip
elif [ $option -eq 9 ]
then 
nmap -sV --script nmap-vulners/ $ip -p$port
elif [ $option -eq 10 ]
then
nmap -sV --script vuln $ip
elif [ $option -eq 11 ]
then 
nmap -sV --script vulscan $ip
elif [ $option -eq 12 ]
then
nmap -sV --script vulscan --script-args vulscandb=exploit.csv $ip -p 80,233
elif [ $option -eq 13 ]
then
nmap -sV --script http-csrf $ip
elif [ $option -eq 14 ]
then
nmap -sV --script http-sherlock $ip
elif [ $option -eq 15 ]
then
nmap -sV --script http-slowloris-check $ip
elif [ $option -eq 16 ]
then
nmap -sV --script http-vmware-path-vuln $ip
elif [ $option -eq 17 ]
then 
nmap -sV --script http-passwd $ip
elif [ $option -eq 18 ]
then
nmap -sV --script http-internal-ip-disclosure $ip 
elif [ $option -eq 19 ]
then 
nmap -sV --script http-vuln-cve2013-0156 $ip
elif [ $choose -eq 20 ]
then
nmap -T4 -A -v $ip
elif [ $option -eq 21 ]
then 
nmap -sS -sU -T4 -A -v $ip
elif [ $option -eq 22 ]
then 
nmap -p 1-65535 -T4 -A -v $ip
elif [ $option -eq 23 ]
then 
nmap -T4 -A -v -Pn $ip
elif [ $option -eq 24 ]
then 
nmap -sn $ip
elif [ $option -eq 25 ]
then 
nmap -T4 -F $ip
elif [ $option -eq 26 ]
then 
nmap -sV -T4 -O -F --version-light $ip
elif [ $option -eq 27 ]
then 
nmap -sn --traceroute $ip
elif [ $option -eq 28 ]
then 
nmap $ip
elif [ $option -eq 29 ]
then 
nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $ip
fi