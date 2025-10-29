# Libinput-Gestures - Useful Gesture Ideas

## My Current Configuration

### 3 Fingers:

- **Up**: Increase volume 10%
- **Down**: Decrease volume 10%
- **Left**: Go back (Alt+Left)
- **Right**: Go forward (Alt+Right)
- **Right_Up**: Switch to previous tab (Ctrl+Tab)
- **Left_Up**: Switch to next tab (Ctrl+Shift+Tab)
- **Left_Down**: Reopen closed tab (Ctrl+Shift+T)
- **Right_Down**: Close current tab (Ctrl+W)
- **Pinch In**: Maximize window (Super+Up)
- **Pinch Out**: Minimize window (Super+Down)

### 4 Fingers:

- **Up**: Open Developer Tools (F12)
- **Down**: Reload page without cache (Ctrl+Shift+R)
- **Left**: Run auto_start.sh script
- **Right**: Lock screen (Super+L)
- **Left_Up**: Show all windows (Overview)
- **Left_Down**: Close current application (Alt+F4)
- **Right_Up**: Scroll to top (Ctrl+Home)
- **Right_Down**: Scroll to bottom (Ctrl+End)
- **Pinch In**: Play/Pause music
- **Pinch Out**: Next track

---

## 💡 Additional Gesture Ideas

### Media Controls (4 Fingers)

```conf
# Play/Pause music
gesture swipe up   4 xdotool key XF86AudioPlay

# Next song
gesture swipe right   4 xdotool key XF86AudioNext

# Previous song
gesture swipe left   4 xdotool key XF86AudioPrev

# Toggle mute
gesture pinch in   4 pactl set-sink-mute @DEFAULT_SINK@ toggle
```

### Window Management

```conf
# Maximize/Restore window
gesture swipe up   4 xdotool key super+Up

# Snap window to left
gesture swipe left   4 xdotool key super+Left

# Snap window to right
gesture swipe right   4 xdotool key super+Right

# Minimize window
gesture swipe down   4 xdotool key super+h

# Close current window
gesture hold on   4 xdotool key alt+F4

# Switch between windows (Alt+Tab)
gesture swipe left_up   4 xdotool key alt+Tab

# Show all windows (Overview)
gesture pinch in   xdotool key super

# Show desktop
gesture swipe down   4 xdotool key super+d
```

### Web Browser

```conf
# Open new tab
gesture swipe left_down   3 xdotool key control+t

# Open private/incognito window
gesture hold on   3 xdotool key control+shift+n

# Bookmark current page
gesture pinch in   3 xdotool key control+d

# Search in page (Ctrl+F)
gesture hold on+1.5   3 xdotool key control+f

# Zoom in webpage
gesture pinch out   3 xdotool key control+plus

# Zoom out webpage
gesture pinch in   3 xdotool key control+minus

# Reset zoom to 100%
gesture pinch clockwise   xdotool key control+0

# Scroll to bottom of page
gesture swipe down   4 xdotool key End

# Scroll to top of page
gesture swipe up   4 xdotool key Home
```

### Screenshot

```conf
# Full screen screenshot
gesture hold on   4 xdotool key Print

# Selection area screenshot
gesture hold on+1   4 xdotool key shift+Print

# Current window screenshot
gesture hold on+2   4 xdotool key alt+Print
```

### Workspace/Virtual Desktop

```conf
# Switch workspace up
gesture swipe up   3 xdotool key ctrl+alt+Up

# Switch workspace down
gesture swipe down   3 xdotool key ctrl+alt+Down

# Switch workspace left
gesture swipe left   3 xdotool key ctrl+alt+Left

# Switch workspace right
gesture swipe right   3 xdotool key ctrl+alt+Right
```

### Text Editing

```conf
# Undo (Ctrl+Z)
gesture swipe left   3 xdotool key control+z

# Redo (Ctrl+Y)
gesture swipe right   3 xdotool key control+y

# Copy
gesture pinch in   3 xdotool key control+c

# Paste
gesture pinch out   3 xdotool key control+v

# Select all
gesture hold on   3 xdotool key control+a

# Save
gesture swipe down   3 xdotool key control+s
```

### System

```conf
# Lock screen
gesture hold on+2   4 xdotool key super+l

# Open terminal
gesture swipe down   3 xdotool key ctrl+alt+t
```

### Gaming/App Specific

```conf
# Toggle fullscreen (F11)
gesture hold on   4 xdotool key F11

# Refresh (F5)
gesture swipe down   3 xdotool key F5

# Open developer tools (F12)
gesture hold on+1   3 xdotool key F12
```

---

## Optimal Configuration Recommendations

### Configuration for Developers:

```conf
# Volume control
gesture swipe up   3 pactl set-sink-volume @DEFAULT_SINK@ +10%
gesture swipe down   3 pactl set-sink-volume @DEFAULT_SINK@ -10%

# Browser tabs
gesture swipe right_up   3 xdotool key control+Tab
gesture swipe left_up   3 xdotool key control+shift+Tab
gesture swipe right_down   3 xdotool key control+w
gesture swipe left_down   3 xdotool key control+shift+t

# IDE shortcuts
gesture swipe left   3 xdotool key control+b  # Build
gesture swipe right   3 xdotool key F5  # Debug/Run

# Window management
gesture swipe up   4 xdotool key super+Up
gesture swipe down   4 xdotool key super+Down
gesture swipe left   4 xdotool key super+Left
gesture swipe right   4 xdotool key super+Right

# Application
gesture swipe right_down   4 xdotool key alt+F4
gesture swipe left_down   4 xdotool key ctrl+alt+t
```

### Configuration for Web Browsing:

```conf
# Volume
gesture swipe up   3 pactl set-sink-volume @DEFAULT_SINK@ +10%
gesture swipe down   3 pactl set-sink-volume @DEFAULT_SINK@ -10%

# Navigation
gesture swipe left   3 xdotool key alt+Left
gesture swipe right   3 xdotool key alt+Right

# Tabs
gesture swipe right_up   3 xdotool key control+Tab
gesture swipe left_up   3 xdotool key control+shift+Tab
gesture swipe right_down   3 xdotool key control+w
gesture swipe left_down   3 xdotool key control+t

# Zoom
gesture pinch in   xdotool key control+minus
gesture pinch out   xdotool key control+plus

# Reload & Close
gesture swipe down   4 xdotool key control+shift+r
gesture swipe right_down   4 xdotool key alt+F4
```

---

## Important Notes

1. **Avoid conflicts with system gestures**: GNOME 40+ uses 3 fingers for workspace switching
2. **Test before applying**: Run `libinput-gestures -d` to test
3. **Need input group permissions**: `sudo gpasswd -a $USER input` and reboot
4. **Dependencies**:
   - `xdotool`: For keyboard/mouse commands
   - `wmctrl`: For workspace management
   - `pactl`: For volume control

## How to Apply

1. Edit file: `~/.config/libinput-gestures.conf`
2. Restart service: `libinput-gestures-setup restart`
3. Test debug mode: `libinput-gestures -d`

## Advanced Customization

### Combining Multiple Commands (create script):

```bash
#!/bin/bash
# ~/scripts/multi_command.sh
xdotool key ctrl+alt+t
sleep 0.5
xdotool type "npm run dev"
xdotool key Return
```

Then:

```conf
gesture swipe left   3 /home/quantroy/scripts/multi_command.sh
```

---
