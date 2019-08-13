#!/bin/bash

echo $(pmset -g batt | grep -o "[0-9]\+%")
