val=$(hyprctl devices | grep "active keymap" | tail -n 1 | cut -d " " -f3)

if [ "$val" = "us" ]; then
        echo "US"
else
        echo "PT"
fi
