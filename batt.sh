#!/bin/bash

pmset -g batt | grep [0-9][0-9]% | awk 'NR==1{print $3}' | cut -c 1-3
