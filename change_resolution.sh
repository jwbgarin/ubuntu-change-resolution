#!/bin/bash

usage() {
	echo "Usage: $0 --resolution WIDTHxHEIGHT"
	exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
	usage
fi

# Parse command-line arguments
while [ "$1" != "" ]; do
	case $1 in
		--resolution ) shift
			RESOLUTION=$1
			;;
		*)	usage
			;;
	esac
	shift
done

# Validate resolution format (basic check for WIDTHxHEIGHT format)
if ! [[ $RESOLUTION =~ ^[0-9]+x[0-9]+$ ]]; then
	echo "Error: Invalid resolution format. Use WIDTHxHEIGHT."
	usage
fi
# Set the resolution using wlr-randr
xrandr --output Virtual1 --mode $RESOLUTION
