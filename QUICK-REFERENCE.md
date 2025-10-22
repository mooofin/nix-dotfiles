# 🎯 Quick Reference - Caelestia NixOS Setup

## 🚀 Essential Commands

### System Management
```bash
# Update system
sudo nixos-rebuild switch --flake /etc/nixos#nixos

# Update flake inputs
cd /etc/nixos && sudo nix flake update

# Backup dotfiles
~/nix-dotfiles/backup.sh

# Reload Hyprland
hyprctl reload
```

### Wallpaper Management
```bash
# Change wallpaper with fade transition
swww img ~/Pictures/Wallpapers/wallpaper.png --transition-type fade

# Or use launcher: Super + D (look for wallpaper picker)
```

## ⌨️ Keybinds Cheatsheet

| Key Combo | Action |
|-----------|--------|
| **Super + D** | Launcher |
| **Super + A** | Dashboard |
| **Super + X** | Quick Settings |
| **Super + N** | Session Menu |
| **Super + L** | Lock Screen |
| **Super + S** | Screenshot |
| **Super + Shift + S** | Screenshot (freeze) |
| **Super + C** | Clear Notifications |
| **Super + Return** | Terminal |
| **Super + T** | File Manager |
| **Super + Q** | Close Window |
| **Super + F** | Fullscreen |
| **Super + 1-9** | Workspace 1-9 |

## 📂 Important Paths

```
/etc/nixos/              # System config
~/.config/caelestia/     # Caelestia shell config
~/.config/hypr/          # Hyprland (managed)
~/Pictures/Wallpapers/   # Wallpapers directory
~/nix-dotfiles/          # Your dotfiles repo
```

## 🔧 Common Tasks

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

## 📦 Package Management

```bash
# Search packages
nix search nixpkgs <package-name>

# Add package to home-manager.nix:
# home.packages = with pkgs; [ package-name ];

# Then rebuild
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

## 🎨 Theming

### Dynamic Colors from Wallpaper
1. Set wallpaper: Super + D → wallpaper picker
2. Open launcher: Super + D → color scheme → "dynamic"

### Custom Colors
Edit: `~/.config/caelestia/shell.json`

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| Keybinds not working | `hyprctl reload` |
| Scaling wrong | Edit monitor line in hypr-user.conf |
| Screen flickering | Uncomment VRR disable in hypr-user.conf |
| Shell not starting | Check `journalctl -xe` |
| Wallpaper not changing | Ensure swww-daemon is running |

## 📱 Contact

- User: muffin
- Email: siddharthqln@gmail.com
- Config: ~/nix-dotfiles/

---
*Keep this file handy for quick reference!*
