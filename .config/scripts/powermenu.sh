#!/bin/bash

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -width 12 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 -no-show-icons <<< " Lock| Logout| Reboot| Shutdown")"
    case "$MENU" in
        *Lock) betterlockscreen -l ;;
        *Logout) bspc quit ;;
        *Reboot) systemctl reboot ;;
        *Shutdown) systemctl -i poweroff
    esac
