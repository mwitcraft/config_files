# !/bin/bash

set -e

output=pscircle.png

while true
do
	pscircle --output=$output --output-width=5000 --output-height=5000 --background-color=575f72 --link-color-min=2e3440 --dot-color-min=2e3440

	if command -v feh >/dev/null; then
		feh --bg-fill $output
		rm $output
	fi

	sleep 10
done
