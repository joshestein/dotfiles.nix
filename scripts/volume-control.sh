#!/bin/bash

get_volume() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -n 1
}

get_mute_state() {
  pactl get-sink-mute @DEFAULT_SINK@ | grep -Po 'yes|no'
}

if [ "$1" = "up" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +5%
elif [ "$1" = "down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
elif [ "$1" = "mute" ]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
fi

volume=$(get_volume)
mute=$(get_mute_state)
tag="volume"
if [[ $volume == 0 || "$mute" == "yes" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$tag "Volume muted" 
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$tag "Volume: ${volume}%"
fi

