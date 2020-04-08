#!/bin/bash

WORKINGDIR="/home/mwitcraft/git/config_files/scripts/rofi_display"
MAP="$WORKINGDIR/cmd.csv"

cat "$MAP" \
	    | cut -d ',' -f 1 \
	        | rofi -dmenu -i -p  -theme /home/mwitcraft/git/config_files/scripts/rofi_app_launcher/small.rasi \
		    | head -n 1 \
		        | xargs -i --no-run-if-empty grep "{}" "$MAP" \
			    | cut -d ',' -f 2 \
			        | head -n 1 \
				    | xargs -i --no-run-if-empty /bin/bash -c "{}"

exit 0
