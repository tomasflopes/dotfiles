# !/bin/bash

printf 'script started' | systemd-cat -t check-battery #write to log when script is called
BATTINFO=`acpi -b | cut -d "," -f 2 | cut -d "%" -f 1 | cut -d " " -f 2`

if [[ $BATTINFO -le 30 ]] ; then
        DISPLAY=:0 /usr/bin/notify-send -u low "Battery running low!" "Battery: $BATTINFO%"
elif [[ $BATTINFO -le 10 ]] ; then
        DISPLAY=:0 /usr/bin/notify-send -u critical "Battery critically low!" "Battery: $BATTINFO%"
fi
