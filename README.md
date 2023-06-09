
# Example usage
![examples](./assets/example.gif)
# hyprland_window_switcher
Simple Hyprland window switcher like "rofi -show window", because i cannot switch between window in Hyprland with "rofi -show window" while i in grouped (tabbed) windows. So, i create this one.

# Dependencies
This just shell script with some shell commands from other installed package in my Artix Linux system. Following are the dependencies to run this shell script 
- [jq](https://stedolan.github.io/jq): Command-line JSON processor.
- [rofi-lbonn-wayland-git](https://github.com/lbonn/rofi): A window switcher, application launcher and dmenu replacement (fork with Wayland support).
- [hyprland-nvidia](https://github.com/hyprwm/Hyprland): I use nvidia card so i use `hyprland-nvidia`. You can use any `hyprland` version if you want.

# How to use it?
You can execute directly this script
```bash
./hyprland_window_switcher.sh
```
or you can execut this with full path directory
```bash
/path/to/hyprland_window_switcher.sh
```
i put this script to `~/.config/hypr/scripts/hyprland_window_switcher` directory. So if i want to use it i just execute command below.
```bash
~/.config/hypr/scripts/hyprland_window_switcher/hyprland_window_switcher.sh
```
