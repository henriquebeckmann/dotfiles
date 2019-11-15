#!/bin/sh

FULL_BATTERY='~/.icons/Papirus-Dark/24x24@2x/panel/battery-full-charged.svg'
LOW_BATTERY='~/.icons/Papirus-Dark/24x24@2x/panel/battery-low.svg'

BAT='/sys/class/power_supply/BAT0'

while true
do
    LEVEL=$(cat "$BAT"/capacity)
    STATUS=$(cat "$BAT"/status)

    if [ "$STATUS" = 'Charging' ]; then
        if [ "$LEVEL" -eq 100 ]; then
            notify-send -i $FULL_BATTERY "Battery Full" "$LEVEL% remaining"
            while [ "$STATUS" = 'Charging' ]
            do
                STATUS=$(cat "$BAT"/status)
                sleep 1
            done
        fi
    elif [ "$STATUS" = 'Discharging' ]; then
        if [ "$LEVEL" -le 10 ]; then
            notify-send -i $LOW_BATTERY "Low Battery" "$LEVEL% remaining"
            while [ "$STATUS" = 'Discharging' ]
            do
                STATUS=$(cat "$BAT"/status)
                sleep 1
            done
        fi
    fi
    sleep 1
done
