#!/bin/bash

doubleDigit=$(pmset -g batt | grep [0-9][0-9]% | awk 'NR==1{print $3}' | cut -c 1-3)

if [ ${#doubleDigit} -gt 1 ]; then
	echo "$doubleDigit"
else
	doubleDigit=$(pmset -g batt | grep [0-9]% | awk 'NR==1{print $3}' | cut -c 1-2)
	echo "$doubleDigit"
fi

