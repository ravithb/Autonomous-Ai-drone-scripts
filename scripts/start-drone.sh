#!/bin/bash
DIR="/home/amd/aidrone"
cd $DIR
sudo python3 follow_person_main.py --mode=flight --debug_path=debug/flightLive
$SHELL
# sudo python3 follow_person_main.py --mode=test --debug_path=debug/flight1
