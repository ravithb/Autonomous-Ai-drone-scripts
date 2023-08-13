#!/bin/bash
DIR="/home/amd/aidrone"
cd $DIR
UNIQID=`date +%Y%m%d%H%M%S`
echo $UNIQID
sudo python3 follow_person_main.py --mode=flight --debug_path="debug/flightLive-$UNIQID" > debug/flightLive-$UNIQID-cmd.log"
$SHELL
# sudo python3 follow_person_main.py --mode=test --debug_path=debug/flight1
