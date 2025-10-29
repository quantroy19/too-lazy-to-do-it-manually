#!/bin/bash

terminator&!
sleep 1

xdotool type "/home/<PATH>/auto_start.sh"
xdotool key Return
