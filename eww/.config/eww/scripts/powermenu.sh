#!/usr/bin/env bash

if [[ $(eww active-windows | grep "powermenu" | wc -l) -gt 0 ]]; then
    eww close powermenu
else
    eww open powermenu
fi


