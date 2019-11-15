#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar top -c ~/.config/polybar/config-top.ini &
#polybar bottom -c ~/.config/polybar/config-bottom.ini &
