#!/bin/bash
hw() {
  for d in /sys/class/hwmon/hwmon*; do
    if [ "$(cat "$d/name" 2>/dev/null)" = "$1" ]; then
      echo $(( $(cat "$d/temp1_input") / 1000 )); return
    fi
  done
}
case "$1" in
  cpu_temp)
    t=$(hw k10temp); [ -z "$t" ] && t=$(hw coretemp)
    echo "${t:-0}" ;;
  gpu_temp)
    t=$(hw amdgpu); echo "${t:-0}" ;;
  gpu_use)
    f=$(ls /sys/class/drm/card*/device/gpu_busy_percent 2>/dev/null | head -1)
    if [ -n "$f" ]; then cat "$f"; else echo 0; fi ;;
esac
