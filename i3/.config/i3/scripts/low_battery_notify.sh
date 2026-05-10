#!/usr/bin/env bash
# Send a desktop notification when the battery drops to/below 20%.

set -u

THRESHOLD=20
CHECK_SECONDS=60
BATTERY="${BATTERY:-/sys/class/power_supply/BAT0}"
STATE_FILE="${XDG_RUNTIME_DIR:-/tmp}/low-battery-notified"

notify_low_battery() {
    local capacity="$1"
    notify-send \
        --app-name="Battery" \
        --urgency=critical \
        --icon=battery-caution \
        "Battery low" \
        "Battery is at ${capacity}%. Plug in your charger."
}

while true; do
    if [[ -r "$BATTERY/capacity" && -r "$BATTERY/status" ]]; then
        capacity="$(<"$BATTERY/capacity")"
        status="$(<"$BATTERY/status")"

        if [[ "$status" == "Discharging" && "$capacity" =~ ^[0-9]+$ && "$capacity" -le "$THRESHOLD" ]]; then
            if [[ ! -e "$STATE_FILE" ]]; then
                notify_low_battery "$capacity"
                : > "$STATE_FILE"
            fi
        else
            # Allow another warning after charging or after the battery rises above the threshold.
            rm -f "$STATE_FILE"
        fi
    fi

    sleep "$CHECK_SECONDS"
done
