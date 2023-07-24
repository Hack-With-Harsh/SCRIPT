#!/bin/sh

echo "press 1 for converting wlan1 into monitor mode"
echo "press 2 for converting wlan1 into managed mode"
read mode

monitor() 
{
    ifconfig wlan1 down
    iwconfig wlan1 mode monitor
    ifconfig wlan1 up
    iwconfig
}

monitor1() 
{
    ifconfig wlan1 down
    iwconfig wlan1 mode managed
    ifconfig wlan1 up
    iwconfig
}

if [ $mode -eq 1 ]
then 
echo " switching to monitor mode "
monitor

elif [ $mode -eq 2 ]
then 
echo " switching to monitor mode "
monitor1

else
echo " wrong input"
fi