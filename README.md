## CLI Pomodoro Timer 🍅

<img width="466" alt="Снимок экрана 2025-05-07 в 15 04 57" src="https://github.com/user-attachments/assets/10120559-b4d3-4d09-91ed-33c34a5fda9c" />


A simple command-line Pomodoro timer written for personal use.

The script has only been tested on macOS and may not work on Linux systems due to its reliance on `afplay` for audio alerts.

### Features
- Customizable work/break durations
- Visual countdown
- Sound notification when session ends
- Easy to install & use

### Installation
1. Clone repository
2. Make script executable
3. You can make the script global to call it from anywhere (https://stackoverflow.com/questions/3560326/how-to-make-a-shell-script-global)

### Usage
Basic command:
```shell
pomodoro [work_minutes] [break_minutes]
```

Examples:
```shell
pomodoro        # Uses default values (30 work / 5 break)
pomodoro 25 5   # 25-minute work, 5-minute break
pomodoro 45 10  # 45-minute work, 10-minute break
```
