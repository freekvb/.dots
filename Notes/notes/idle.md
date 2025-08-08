# Idle


#### Idle

Hyprland requires a wayland-compatible external idle management daemon. The most common setup is swayidle and swaylock. You can lock your screen manually using a bind as follows:

~/.config/hypr/hyprland.conf

```sh
    bind = SUPER, L, exec, swaylock -f -c 000000
```

#### automatic screen locking and suspend

Create the following script:

~/.config/hypr/scripts/sleep.sh

```sh
    swayidle -w timeout 300 'swaylock -f -c 000000' \
                timeout 600 'systemctl suspend' \
                before-sleep 'swaylock -f -c 000000' &
```

##### Tip:

You can adjust the timeout periods by editing the numerical values, in seconds. 300 is 5 minutes, 600 is 10 minutes etc.
The script must be executable.

##### then call it:

~/.config/hypr/hyprland.conf

```sh
    exec-once = ~/.config/hypr/scripts/sleep.sh
```

```sh
                          swayidle -w \
	timeout 300 'swaylock -f -c 000000' \
	timeout 600 'swaymsg "output * dpms off"' \
		resume 'swaymsg "output * dpms on"' \
	before-sleep 'swaylock -f -c 000000'
```

---


#### my configuration

~/.config/hypr/hyprland.conf

```sh
    # lock screen after idle 30 min. monitor off 1 min. later
    exec-once = hypridle
    # lock and turn off monitor
    bind = $mainMod, z, exec, pamixer --allow-boost --set-volume 25 && hyprlock
```

~/.config/hypr/hypridle.conf

```sh
    # hypridle idle management daemon
    general {
        lock_cmd = pidof hyprlock || hyprlock                       # avoid starting multiple hyprlock instances.
        after_sleep_cmd = hyprctl dispatch dpms on                  # to avoid having to press a key twice to turn on the display.
    }
    # turn off screen faster if session is already locked
    listener {
        timeout = 60                                                # 1 min
        on-timeout = pidof hyprlock && hyprctl dispatch dpms off    # turns off the screen if hyprlock is active
        on-resume = pidof hyprlock && hyprctl dispatch dpms on      # command to run when activity is detected after timeout has fired.
    }
    listener {
        timeout = 1800                                              # 30 min
        on-timeout = loginctl lock-session                          # lock screen when timeout has passed
    }
    listener {
        timeout = 1860                                              # 31 min
        on-timeout = hyprctl dispatch dpms off                      # screen off when timeout has passed
        on-resume = hyprctl dispatch dpms on                        # screen on when activity is detected after timeout has fired.
    }
```
