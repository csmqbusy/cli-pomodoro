#!/bin/zsh

zmodload zsh/datetime

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\u001b[35m'
BOLD='\u001b[1m'
RESET='\033[0m'

script_dir="${0:A:h}"
sound_file="$script_dir/sound.wav"
update_interval=0.33  # 3 FPS

playSound() {
  local file=$1
  afplay "$file" &
}

WORK_MINS=30
BREAK_MINS=5

if [ $1 ]; then
  WORK_MINS=$1
  fi

if [ $2 ]; then
  BREAK_MINS=$2
  fi

getTimestamp() {
  echo $(date +%s.%N)
}

formatTime() {
  local seconds=$1
  printf "%02d:%02d:%02d" $((seconds/3600)) $(((seconds%3600)/60)) $((seconds%60))
}

main() {
  local session_type=$1
  local minutes=$2
  local text_color=$3
  local work_seconds=$(( $minutes * 60 ))
  local start_time=$( getTimestamp )
  local last_update=0

  printf "\r\e[K${BOLD}${text_color}${session_type} SESSION: 00:00:00${RESET}"

  while true; do
    local current_time=$( getTimestamp )
    local elapsed=$(( current_time - start_time ))
    local remaining=$(( work_seconds - elapsed ))

    (( elapsed >= work_seconds )) && break  # if left is true execute right

    if (( $(printf "%.1f" "$(( current_time - last_update ))") >= update_interval )); then
      printf "\r\e[K${BOLD}${text_color}${session_type} SESSION: $( formatTime $elapsed )${RESET}"
      last_update=$current_time
    fi

    sleep $(( remaining < update_interval ? remaining : update_interval ))
  done

  printf "\r\e[K${BOLD}${text_color}${session_type} SESSION: $( formatTime $work_seconds )${RESET}\n"
  playSound $sound_file
}

main "WORK" WORK_MINS $PURPLE
main "BREAK" BREAK_MINS $GREEN
