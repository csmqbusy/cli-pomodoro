# CLI Pomodoro Timer 🍅

A simple command-line Pomodoro timer written for personal use.

The script has only been tested on macOS and may not work on Linux systems due to its reliance on `afplay` for audio alerts.

## Features
- Customizable work/break durations
- Visual countdown
- Sound notification when session ends
- Easy to install & use

## Installation
1. Clone repository
2. Make script executable

## Usage
Basic command:
`pomodoro [work_minutes] [break_minutes]`

Examples:
`pomodoro         # Uses default values (30 work / 5 break)`
`pomodoro 25 5    # 25-minute work, 5-minute break`
`pomodoro 45 10   # 45-minute work, 10-minute break`
