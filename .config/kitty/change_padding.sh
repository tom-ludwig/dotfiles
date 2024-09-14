#!/bin/bash

if [ "$1" == "set" ]; then
    kitty @ set-spacing padding=0
elif [ "$1" == "reset" ]; then
    kitty @ set-spacing padding=25
fi
