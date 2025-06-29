
#!/usr/bin/env bash

spaces="                                                                                                                                                                      "

function get_date() {
  date "+%b %d %Y %I:%M:%S %p"
}

function brightness() {
  current=$(cat /sys/class/backlight/*/brightness 2>/dev/null)
  max=$(cat /sys/class/backlight/*/max_brightness 2>/dev/null)
  if [[ -n "$current" && -n "$max" && "$max" -ne 0 ]]; then
    echo "$(( current * 100 / max ))%"
  else
    echo "N/A"
  fi
}

function volume() {
  pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -oP '\d+%' | head -1 || echo "N/A"
}

while true; do
  echo -e " >_ $spaces |  $(brightness)  |  $(volume)  |  $(get_date)"
  sleep 1
done | lemonbar -f "Cascadia Code NF:size=12"

