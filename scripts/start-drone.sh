#!/bin/bash
DIR="/home/amd/aidrone"
cd $DIR
UNIQID=`date +%Y%m%d%H%M%S`
echo "$UNIQID-$RANDOM"
FILE_PF="debug/flightLive-$UNIQID-$RANDOM"
touch "$FILE_PF-cmd.log"
sudo python3 follow_person_main.py --mode=flight --debug_path="$FILE_PF" 2>&1 > "$FILE_PF-cmd.log" &
tail -f "$FILE_PF-cmd.log"
$SHELL
# sudo python3 follow_person_main.py --mode=test --debug_path=debug/flight1
