#!/bin/bash

if [ "$(pgrep dropbox)" ]; then
	echo ""
else
	echo -e "\e[9m\e[0m"
fi
