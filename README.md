<div align="center">

## 🎀 **Pastel Perfection  NixOS x Hyprland | QuickShell, Home Manager, and Flakes** 🎀  
*A dreamy rice demo*  

<br>

[![Watch on YouTube](https://img.youtube.com/vi/ffDwGmziiCg/hqdefault.jpg)](https://youtu.be/ffDwGmziiCg?si=ATK48WMnEsbNwPK6)

<br><br>

✨ **Meanwhile, here’s a recommended read:** ✨  :3  

<br>

<img src="https://github.com/user-attachments/assets/1ad3ebb4-bb9d-47f4-8df5-6763038ef4da" width="350px" alt="NixOS in Production" />  

<br>

*“The NixOS handbook for professional use ONLY”*  

</div>




###  System Management




```bash
# Update system
sudo nixos-rebuild switch --flake /etc/nixos#nixos

# Update flake inputs
cd /etc/nixos && sudo nix flake update

# Backup dotfiles
~/nix-dotfiles/backup.sh

# Reload Hyprland
hyprctl reload
````

###  Wallpaper Management

```bash
# Change wallpaper with fade transition
swww img ~/Pictures/Wallpapers/wallpaper.png --transition-type fade

# Or use launcher: Super + D (look for wallpaper picker)
```

##  Keybinds Cheatsheet

| Key Combo             | Action              |
| --------------------- | ------------------- |
| **Super + D**         | Launcher            |
| **Super + A**         | Dashboard           |
| **Super + X**         | Quick Settings      |
| **Super + N**         | Session Menu        |
| **Super + L**         | Lock Screen         |
| **Super + S**         | Screenshot          |
| **Super + Shift + S** | Screenshot (freeze) |
| **Super + C**         | Clear Notifications |
| **Super + Return**    | Terminal            |
| **Super + T**         | File Manager        |
| **Super + Q**         | Close Window        |
| **Super + F**         | Fullscreen          |
| **Super + 1-9**       | Workspace 1-9       |

##  Important Paths

```
/etc/nixos/              # System config
~/.config/caelestia/     # Caelestia shell config
~/.config/hypr/          # Hyprland (managed)
~/Pictures/Wallpapers/   # Wallpapers directory
~/nix-dotfiles/          # Your dotfiles repo
```

##  Common Tasks

### Add Wallpapers

```bash
cp /path/to/image.jpg ~/Pictures/Wallpapers/
# Then use Super + D to select it
```

### Customize Keybinds

```bash
nano ~/.config/caelestia/hypr-user.conf
hyprctl reload
```

### Check Caelestia Status

```bash
ps aux | grep quickshell
hyprctl globalshortcuts | head -20
```

### Fix Issues

```bash
# Rebuild if something breaks
sudo nixos-rebuild switch --flake /etc/nixos#nixos

# Check logs
journalctl -xe

# Restart Hyprland
Super + Escape (then login again)
```

##  Package Management

```bash
# Search packages
nix search nixpkgs <package-name>

# Add package to home-manager.nix:
# home.packages = with pkgs; [ package-name ];

# Then rebuild
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

##  Theming

### Dynamic Colors from Wallpaper

1. Set wallpaper: Super + D → wallpaper picker
2. Open launcher: Super + D → color scheme → "dynamic"

### Custom Colors

Edit: `~/.config/caelestia/shell.json`

##  Troubleshooting

| Problem                | Solution                                |
| ---------------------- | --------------------------------------- |
| Keybinds not working   | `hyprctl reload`                        |
| Scaling wrong          | Edit monitor line in hypr-user.conf     |
| Screen flickering      | Uncomment VRR disable in hypr-user.conf |
| Shell not starting     | Check `journalctl -xe`                  |
| Wallpaper not changing | Ensure swww-daemon is running           |

</div>
```


<img width="1920" height="1080" alt="screenshot_1759069642" src="https://github.com/user-attachments/assets/b0acaef3-12da-4114-9763-f364805d1819" />









<img width="1920" height="1080" alt="screenshot-1757228765" src="https://github.com/user-attachments/assets/587793b6-564a-4ec2-8966-e7db45d82a98" />

<img width="1918" height="1080" alt="screenshot-1756543731" src="https://github.com/user-attachments/assets/31743dbe-d147-4467-ad07-2829b3ce9cb6" />



<img width="1920" height="1076" alt="screenshot-1754558175" src="https://github.com/user-attachments/assets/fc3ad18b-f906-46cc-9135-b778f58283f6" />




<img width="3277" height="763" alt="screenshot-1753628591" src="https://github.com/user-attachments/assets/d0a7f333-db2c-41e9-bd32-258010c3de77" />




<img width="3286" height="768" alt="screenshot-1753957106" src="https://github.com/user-attachments/assets/5094cf63-4235-4ba9-a04b-a61fae8a9e87" />


<img width="1920" height="1080" alt="screenshot-1754141258" src="https://github.com/user-attachments/assets/82ef15be-5e14-4a71-9c8d-d9c14d5e4c69" />




<img width="1920" height="1042" alt="screenshot-1754556800" src="https://github.com/user-attachments/assets/3c1f00e9-1bb5-49c3-8186-228b787f7f53" />






<img width="1881" height="1005" alt="screenshot-1753964934" src="https://github.com/user-attachments/assets/cf6e906e-f288-4131-99c0-a1aae7b79328" />

