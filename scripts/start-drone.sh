#!/bin/bash
DIR="/home/amd/aidrone"
cd $DIR
UNIQID=`date +%Y%m%d%H%M%S`
echo $UNIQID
touch "debug/flightLive-$UNIQID-cmd.log"
sudo python3 follow_person_main.py --mode=flight --debug_path="debug/flightLive-$UNIQID" 2>&1 > "debug/flightLive-$UNIQID-cmd.log" &
tail -f "debug/flightLive-$UNIQID-cmd.log"
$SHELL
# sudo python3 follow_person_main.py --mode=test --debug_path=debug/flight1
