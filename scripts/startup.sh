#! /bin/bash

monitors=`xrandr --listactivemonitors | grep "DP1-1"`

if [ -z "$monitors" ]
then
	echo "Do nothing"
else
	echo "Run monitor script"
	~/.screenlayout/desk.sh
	echo "Restart polybar"
	~/.config/polybar/launch.sh
fi

