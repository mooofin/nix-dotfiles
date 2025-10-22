# 🎨 Muffin's NixOS Dotfiles with Caelestia Shell

Beautiful NixOS configuration featuring the Caelestia Shell - a stunning Quickshell-based desktop environment.

## 📸 Features

- **Window Manager**: Hyprland with custom animations
- **Shell**: Caelestia Shell (Quickshell)
- **Terminal**: Kitty with transparency
- **Editor**: Neovim
- **Shell**: Fish
- **Launcher**: Caelestia Launcher (replaces Rofi)
- **System Info**: Fastfetch + Btop
- **Display**: 1920x1080 @ 144Hz with proper 1.0 scaling

## 📁 Structure

```
nix-dotfiles/
├── nixos/                      # NixOS system configuration
│   ├── flake.nix              # Flake with inputs (nixpkgs, home-manager, caelestia-shell)
│   ├── flake.lock             # Locked dependencies
│   ├── configuration.nix      # Main system configuration
│   ├── hardware-configuration.nix
│   └── home-manager.nix       # Home Manager configuration
├── dotfiles/                   # User configuration files
│   ├── caelestia/             # Caelestia Shell config
│   ├── nvim/                  # Neovim configuration
│   ├── fish/                  # Fish shell
│   ├── rofi/                  # Rofi (backup launcher)
│   ├── kitty/                 # Kitty terminal
│   ├── waybar/                # Waybar
│   ├── btop/                  # System monitor
│   └── fastfetch/             # System info
└── README.md                   # This file
```

## 🚀 Installation

### Fresh Install

1. Clone this repository:
```bash
git clone https://github.com/yourusername/nix-dotfiles.git ~/nix-dotfiles
```

2. Copy NixOS configuration:
```bash
sudo cp ~/nix-dotfiles/nixos/* /etc/nixos/
```

3. Update hardware configuration (if needed):
```bash
sudo nixos-generate-config --show-hardware-config > /etc/nixos/hardware-configuration.nix
```

4. Rebuild system:
```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

5. Link dotfiles (optional, home-manager manages most):
```bash
ln -sf ~/nix-dotfiles/dotfiles/caelestia ~/.config/caelestia
```

## ⌨️ Keybinds

### Caelestia Shell
- **Super + D** - Launcher
- **Super + A** - Dashboard
- **Super + X** - Control Center (Quick Settings)
- **Super + N** - Session Menu
- **Super + L** - Lock Screen
- **Super + S** - Screenshot
- **Super + Shift + S** - Screenshot with freeze

### Window Management
- **Super + Q** - Close window
- **Super + F** - Fullscreen
- **Super + V** - Toggle floating
- **Super + 1-9** - Switch workspace
- **Super + Shift + 1-9** - Move window to workspace

### Applications
- **Super + Return** - Terminal (Kitty)
- **Super + T** - File Manager (Nemo)

### Visual Modes
- **Super + P** - Performance Mode
- **Super + G** - Glassy Mode

## 🎨 Customization

### Wallpapers
Add wallpapers to `~/Pictures/Wallpapers/` and use:
- **Super + D** to open launcher and click wallpaper picker
- Or use `swww img ~/Pictures/Wallpapers/your-wallpaper.png`

### Monitor Scaling
Edit `~/.config/caelestia/hypr-user.conf`:
```
monitor = eDP-1,1920x1080@144.15,0x0,1
```

### Custom Keybinds
Add to `~/.config/caelestia/hypr-user.conf` and run `hyprctl reload`

## 📦 Installed Packages

### System Tools
- caelestia-shell (with CLI)
- hyprland
- swww (wallpaper daemon)
- grim, slurp, swappy (screenshots)
- brightnessctl
- pipewire, pamixer

### Applications
- kitty
- nemo
- firefox
- spotify
- discord
- neovim

### Fonts
- CaskaydiaCove Nerd Font
- Material Symbols

## 🔧 Maintenance

### Update System
```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos --upgrade
```

### Update Flake Inputs
```bash
cd /etc/nixos
sudo nix flake update
sudo nixos-rebuild switch --flake .#nixos
```

### Backup Current Config
```bash
sudo cp /etc/nixos/{flake.nix,configuration.nix,home-manager.nix} ~/nix-dotfiles/nixos/
cp -r ~/.config/caelestia ~/nix-dotfiles/dotfiles/
```

## 📝 Notes

- **Email**: siddharthqln@gmail.com
- **User**: muffin
- **System**: NixOS Unstable
- **Display**: 1920x1080 @ 144Hz

## 🙏 Credits

- [Caelestia Dots](https://github.com/caelestia-dots/shell) - Beautiful Quickshell desktop
- [Quickshell](https://quickshell.outfoxxed.me/) - Qt-based desktop shell
- [Hyprland](https://hyprland.org/) - Tiling window manager
- [NixOS](https://nixos.org/) - Reproducible Linux distribution

## 📄 License

MIT License - Feel free to use and modify!

---
*Last updated: October 22, 2025*
