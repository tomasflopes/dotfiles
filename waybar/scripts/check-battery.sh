# !/bin/bash

BATTINFO=`acpi -b | cut -d "," -f 2 | cut -d "%" -f 1 | cut -d " " -f 2`
CHARGING=`cat /sys/class/power_supply/BAT0/status`

LOW_BATT=30
CRIT_BATT=10

BATSTAT=`cat /home/kappa-laptop/.batstat`

if [[ $CHARGING == Charging ]] ; then
        echo 0 > /home/kappa-laptop/.batstat
        if [[ $BATSTAT -ne 0 ]]; then
                DISPLAY=:0 /usr/bin/notify-send -u low "Charging!"
        fi
        exit 0
fi

if [[ $BATTINFO -le $LOW_BATT ]] ; then
        echo 1 > /home/kappa-laptop/.batstat
        if [[ $BATSTAT -ne 1 ]]; then
                DISPLAY=:0 /usr/bin/notify-send -u low "Battery running low!" "Battery: $BATTINFO%"
        fi
elif [[ $BATTINFO -le $CRIT_BATT ]]; then
        echo 2 > /home/kappa-laptop/.batstat
        if [[ $BATSTAT -ne 2 ]]; then
                DISPLAY=:0 /usr/bin/notify-send -u critical "Battery critically low!" "Battery: $BATTINFO%"
        fi
fi

