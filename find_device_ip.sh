#!/bin/bash

# Function to find IP addresses of devices with specified interfaces
function find_device_ips() {
    local interface="$1"
    ip -o addr show dev "$interface" | awk '$3 == "inet" {print $4}'
}

# Specify the device interfaces here (comma-separated)
device_interfaces="eth0,lo,vmnet1,vmnet8,wlan0,wlan1"

IFS=',' read -ra interfaces_array <<< "$device_interfaces"

echo "Finding IP addresses for the following interfaces: ${interfaces_array[@]}"

for interface in "${interfaces_array[@]}"; do
    ips=$(find_device_ips "$interface")

    if [ -n "$ips" ]; then
        echo "IP addresses for $interface:"
        echo "$ips"
    else
        echo "No IP addresses found for $interface."
    fi

    echo
done

