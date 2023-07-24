#!/bin/bash

# Function to generate a random number between given range
function generate_random_number() {
  local min=$1
  local max=$2
  echo $((RANDOM % (max - min + 1) + min))
}

# Generate random IP address
function generate_random_ip() {
  local ip=""
  for i in {1..4}; do
    ip+=.$(generate_random_number 1 255)
  done
  echo "${ip:1}"
}

# Set random IP address for WiFi card
wifi_card="wlan1"  # Replace with your WiFi card name

random_ip=$(generate_random_ip)

echo "Setting random IP address $random_ip for $wifi_card..."
sudo ifconfig $wifi_card $random_ip

