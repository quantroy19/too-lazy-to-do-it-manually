# Automated Environment Bootstrap

A helper toolkit of shell scripts and gesture bindings to spin up local development, worker services, and personal workspaces with minimal manual input.

## Prerequisites

- Shell utilities: `bash`, `xdotool`, `gnome-terminal`, `terminator`, `google-chrome`, `firefox`
- Container tooling: Docker (required by [`script.auto_start_worker.sh`](script/auto_start_worker.sh))
- Optional: `libinput-gestures`, `wmctrl`, `pactl` for the gesture profile in [libinput-gestures/libinput-gestures.conf](libinput-gestures/libinput-gestures.conf)

Install missing packages on Ubuntu:

```bash
sudo apt-get install xdotool gnome-terminal terminator wmctrl firefox
```


# Automated Environment Bootstrap

This repository hosts two independent automation packs that you can mix and match:

- `script/`: terminal-driven helpers that prepare local development or personal workspaces without manual typing.
- `libinput-gestures/`: gesture bindings and brainstorming notes for `libinput-gestures` power users.

Use whichever directory fits your workflow—there is no coupling between them.
 
## Prerequisites

- Shared: `bash`, `xdotool`
- `script/` extras: `gnome-terminal`, `terminator`, `google-chrome`, `firefox`, Docker (for `auto_start_worker.sh`), `code` CLI
- `libinput-gestures/` extras: `libinput-gestures`, `wmctrl`, `pactl`

Ubuntu install example:

```bash
sudo apt-get install xdotool gnome-terminal terminator wmctrl firefox
```

## Using the `script/` Automations

1. Replace every `ProjectPath="/home/<PATH>"` placeholder with your real project directory.
2. Adjust hard-coded coordinates/URLs (Chrome profile click in `auto_start_project.sh`, Firefox URL in `auto_visitor.sh`).
3. Make the scripts executable: `chmod +x script/*.sh`.
4. Launch directly from the repo root: `./script/auto_start.sh`.

Shortcut options:

- Bind `script/call_auto_start.sh` to a hotkey or gesture (see gesture config below).
- Symlink any script into your `$PATH` if you want to call it from elsewhere.

### Script Behaviors at a Glance

| Script                   | What it Automates                                                                    | Key Customization                                                        |
| ------------------------ | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| `auto_start.sh`          | Menu for project, worker, personal, system actions                                   | Update the `~/<PATH>/...` jump targets                                   |
| `auto_start_project.sh`  | Terminator splits, `make devrun`, `make devshnode`, `make devshphp`, launches Chrome | Set `ProjectPath`, adjust Chrome click coords                            |
| `auto_start_worker.sh`   | Runs sequential Go services inside `project-worker-1` container tabs, opens VS Code  | Set `ProjectPath`, ensure container name & Go file list match your stack |
| `auto_start_personal.sh` | Opens a terminal and VS Code in your personal dir                                    | Set `ProjectPath`                                                        |
| `auto_visitor.sh`        | Starts Firefox, types URL, scrolls the page                                          | Replace `URL` value                                                      |
| `call_auto_start.sh`     | Opens Terminator then runs `auto_start.sh`                                           | Update absolute path                                                     |

## Using the `libinput-gestures/` Pack

1. Install `libinput-gestures` and ensure your user is in the `input` group: `sudo gpasswd -a $USER input`.
2. Copy or symlink `libinput-gestures/libinput-gestures.conf` to `~/.config/libinput-gestures.conf`.
3. Restart the daemon: `libinput-gestures-setup restart`.
4. Review `gesture_ideas.md` if you want alternative bindings (media keys, workspace switching, etc.).

Highlights in the shipped config:

- 3-finrewrite the readmeger swipes adjust volume and browser navigation; diagonals handle tab cycling.
- 4-finger swipes trigger dev tooling (hard refresh, DevTools, lock screen) and call the automation menu.
- Pinch gestures manage window state and media playback.


[Read more Vietnamese instructions](https://viblo.asia/p/kham-pha-libinput-gestures-cong-cu-tuy-chinh-cu-chi-touchpad-tren-linux-oW4oeezlLml)
## Demo

![libinput-gestures](./demo/demo_libinput-gestures.webm)
