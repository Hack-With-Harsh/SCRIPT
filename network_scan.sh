#!/bin/bash

# Check if netdiscover is installed
if ! command -v netdiscover &> /dev/null; then
    echo "Please install netdiscover first (e.g., 'sudo apt install netdiscover' or 'sudo yum install netdiscover')."
    exit 1
fi

# Get the network device name from the user
read -p "Enter the network device name (e.g., wlan0, eth0, vmnet1, etc.): " network_device

# Get the time duration from the user
read -p "Enter the time duration in seconds to run the network scan: " time_duration

# Output file to store the scan results
output_file="network_devices.txt"

# Perform the network scan for the specified time duration
echo "Scanning network on $network_device for $time_duration seconds..."
sudo timeout $time_duration netdiscover -i $network_device > $output_file

# Display the scan results
cat $output_file

echo "Scan complete."

