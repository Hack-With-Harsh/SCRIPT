#!/bin/sh

read ipc

ifconfig wlan0 $ipc

ifconfig | grep inet
