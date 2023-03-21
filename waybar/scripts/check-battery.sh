# !/bin/bash

printf 'script started' | systemd-cat -t check-battery #write to log when script is called
BATTINFO=`acpi -b | cut -d "," -f 2 | cut -d "%" -f 1 | cut -d " " -f 2`
CHARGING=`cat /sys/class/power_supply/BAT0/status`

LOW_BATT=28
CRIT_BATT=10

BATSTAT=`cat /home/kappa-laptop/.batstat`

if [[ $CHARGING == Charging ]] ; then
        printf 'charging' | systemd-cat -t check-battery
        echo 0 > /home/kappa-laptop/.batstat
        if [[ $BATSTAT -ne 0 ]]; then
                DISPLAY=:0 /usr/bin/notify-send -u low "Charging!"
        fi
        exit 0
fi

printf 'not charging' | systemd-cat -t check-battery

if [[ $BATTINFO -le $LOW_BATT ]] ; then
        printf 'low bat' | systemd-cat -t check-battery
        echo 1 > /home/kappa-laptop/.batstat
        if [[ $BATSTAT -ne 1 ]]; then
                DISPLAY=:0 /usr/bin/notify-send -u low "Battery running low!" "Battery: $BATTINFO%"
        fi
elif [[ $BATTINFO -le $CRIT_BATT ]]; then
        echo 2 > /home/kappa-laptop/.batstat
        printf 'critical bat' | systemd-cat -t check-battery
        if [[ $BATSTAT -ne 2 ]]; then
                DISPLAY=:0 /usr/bin/notify-send -u critical "Battery critically low!" "Battery: $BATTINFO%"
        fi
fi

