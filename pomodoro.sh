#!/bin/zsh

zmodload zsh/datetime

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\u001b[35m'
BOLD='\u001b[1m'
RESET='\033[0m'

sound_file="sound.wav"
update_interval=0.2  # 5 FPS

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

main() {
  local session_type=$1
  local minutes=$2
  local text_color=$3
  local work_seconds=$(( $minutes * 60 ))
  local start_time=$( getTimestamp )

  printf "\r\e[K${BOLD}${text_color}${session_type} SESSION: 00:00:00${RESET}"

  while true; do
    local current_time=$( getTimestamp )
    local elapsed=$(printf "%.0f" "$(( current_time - start_time ))")  # round to seconds

    (( elapsed >= work_seconds )) && break  # if left is true run right

    printf "\r\e[K${BOLD}${text_color}${session_type} SESSION: %02d:%02d:%02d${RESET}" \
      $((elapsed / 3600)) \
      $(( (elapsed % 3600) / 60)) \
      $(( elapsed % 60 ))

    local remaining=$(( work_seconds - elapsed ))
    sleep $(( remaining < 1 ? remaining : 1 ))
  done

  echo
  playSound $sound_file
}

echo $( getTimestamp )
main "WORK" WORK_MINS $PURPLE
echo $( getTimestamp )
main "BREAK" BREAK_MINS $GREEN
echo $( getTimestamp )
