<div align="center">

# Pastel Perfection

**NixOS + Niri + Hyprland + QuickShell**

A declarative, reproducible desktop environment featuring dynamic theming and modern aesthetics



[![NixOS](https://img.shields.io/badge/NixOS-5277C3?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)
[![Hyprland](https://img.shields.io/badge/Hyprland-00D9FF?style=for-the-badge&logo=wayland&logoColor=white)](https://hyprland.org)
[![Flakes](https://img.shields.io/badge/Nix_Flakes-7E7EFF?style=for-the-badge&logo=nix&logoColor=white)](#)

[Watch Demo](https://youtu.be/ffDwGmziiCg?si=ATK48WMnEsbNwPK6) • [Report Bug](#troubleshooting) • [Request Feature](#)

<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/d4ab9ebf-a514-4b3f-96a4-8b57e9ba907d" />
<img width="900" alt="Pastel Perfection Preview" src="https://github.com/user-attachments/assets/b0acaef3-12da-4114-9763-f364805d1819" />
<img width="1918" height="1078" alt="image" src="https://github.com/user-attachments/assets/dd961b32-9ae3-4532-8576-974156fce0d4" />


---

</div>

## Features

- **Declarative Configuration** - Fully reproducible NixOS setup with Flakes and Home Manager
- **Dynamic Theming** - Automatic color scheme generation from wallpapers
- **Modern Compositor** - Hyprland with smooth animations and gestures
- **Custom Shell** - QuickShell-based desktop environment (Caelestia)
- **Integrated Workflow** - Unified launcher, dashboard, and quick settings

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Post-Installation](#post-installation)
- [Configuration Files](#configuration-files)
- [Quick Start](#quick-start)
- [Keybindings](#keybindings)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

## Prerequisites

Before installing, ensure you have:

- **NixOS** installed (23.11 or later recommended)
- **Nix Flakes** enabled in your configuration
- **Git** for cloning the repository
- Basic familiarity with NixOS configuration

### Enable Flakes

If you haven't enabled flakes yet, add this to your `/etc/nixos/configuration.nix`:

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

Then rebuild:

```bash
sudo nixos-rebuild switch
```

## Installation

### Automated Installation (Recommended)

The easiest way to install is using the automated installer:

```bash
# Clone the repository
cd ~
git clone https://github.com/YOUR_USERNAME/pastel-perfection.git nix-dotfiles
cd nix-dotfiles

# Run the installer
chmod +x install.sh
./install.sh
```

The installer will:
- Check prerequisites and enable flakes if needed
- Backup your existing configuration automatically
- Prompt for system information (username, hostname, timezone)
- Update configuration files with your information
- Copy hardware configuration
- Install system configuration to `/etc/nixos`
- Build and switch to the new system
- Link all dotfiles to `~/.config`
- Offer to reboot when complete

### Manual Installation

If you prefer manual installation or need more control:

#### 1. Backup Your Current Configuration

```bash
# Backup existing NixOS config
sudo cp -r /etc/nixos /etc/nixos.backup

# Backup existing dotfiles
cp -r ~/.config ~/.config.backup
```

#### 2. Clone This Repository

```bash
# Clone to your home directory
cd ~
git clone https://github.com/YOUR_USERNAME/pastel-perfection.git nix-dotfiles
cd nix-dotfiles
```

#### 3. Review and Customize Configuration

Before applying, review these critical files:

#### [`nixos/flake.nix`](nixos/flake.nix)
Main flake configuration defining inputs and outputs.

```bash
nano nixos/flake.nix
```

Update the hostname if needed:
```nix
nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
  # Change "nixos" to your hostname
```

#### [`nixos/configuration.nix`](nixos/configuration.nix)
System-level configuration (bootloader, networking, users, etc.).

```bash
nano nixos/configuration.nix
```

Update:
- Username and user settings
- Timezone and locale
- Network settings
- Boot configuration

#### [`nixos/hardware-configuration.nix`](nixos/hardware-configuration.nix)
Hardware-specific settings (auto-generated during NixOS install).

```bash
# Copy your existing hardware config
sudo cp /etc/nixos/hardware-configuration.nix nixos/hardware-configuration.nix
```

#### [`nixos/home-manager.nix`](nixos/home-manager.nix)
User environment and dotfiles configuration.

```bash
nano nixos/home-manager.nix
```

Update:
- Home directory path
- User-specific packages
- Git configuration

#### 4. Copy Configuration to System

```bash
# Remove old config
sudo rm -rf /etc/nixos

# Copy new config
sudo cp -r ~/nix-dotfiles/nixos /etc/nixos

# Set proper permissions
sudo chown -R root:root /etc/nixos
```

#### 5. Build and Switch

```bash
# Test the configuration first (doesn't activate)
sudo nixos-rebuild test --flake /etc/nixos#nixos

# If test succeeds, switch to new configuration
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

#### 6. Install Dotfiles

```bash
# Create necessary directories
mkdir -p ~/.config
mkdir -p ~/Pictures/Wallpapers

# Link dotfiles
ln -sf ~/nix-dotfiles/hyprland ~/.config/hypr
ln -sf ~/nix-dotfiles/kitty ~/.config/kitty
ln -sf ~/nix-dotfiles/fish ~/.config/fish
ln -sf ~/nix-dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/nix-dotfiles/btop ~/.config/btop
ln -sf ~/nix-dotfiles/cava ~/.config/cava
ln -sf ~/nix-dotfiles/waybar ~/.config/waybar

# Setup Caelestia shell
mkdir -p ~/.config/caelestia
ln -sf ~/nix-dotfiles/shell.qml ~/.config/caelestia/shell.qml
ln -sf ~/nix-dotfiles/shell/* ~/.config/caelestia/
touch ~/.config/caelestia/hypr-user.conf
```

#### 7. Reboot

```bash
sudo reboot
```

## Post-Installation

### First Login

1. Log in to your user account
2. Select "Hyprland" as your session
3. The desktop should load with Caelestia shell

### Add Wallpapers

```bash
# Copy your wallpapers
cp /path/to/your/wallpapers/* ~/Pictures/Wallpapers/

# Or download some
cd ~/Pictures/Wallpapers
wget https://example.com/wallpaper.jpg
```

### Set Initial Wallpaper

```bash
# Set wallpaper with swww
swww img ~/Pictures/Wallpapers/your-wallpaper.jpg --transition-type fade

# Or use the GUI: Super + D → search "wallpaper"
```

### Verify Installation

```bash
# Check Hyprland is running
hyprctl version

# Check Caelestia shell is running
ps aux | grep caelestia

# Check swww daemon
ps aux | grep swww

# View Caelestia logs if needed
journalctl --user -xe | grep caelestia
```

## Configuration Files

### Core System Files

| File | Description | Link |
|------|-------------|------|
| `nixos/flake.nix` | Main flake configuration | [View](nixos/flake.nix) |
| `nixos/configuration.nix` | System configuration | [View](nixos/configuration.nix) |
| `nixos/home-manager.nix` | User environment config | [View](nixos/home-manager.nix) |
| `nixos/hardware-configuration.nix` | Hardware settings | [View](nixos/hardware-configuration.nix) |

### Desktop Environment

| Directory | Description | Link |
|-----------|-------------|------|
| `hyprland/` | Hyprland compositor config | [View](hyprland/) |
| `shell/` | Caelestia (QuickShell) config | [View](shell/) |
| `waybar/` | Status bar configuration | [View](waybar/) |

### Applications

| Directory | Description | Link |
|-----------|-------------|------|
| `kitty/` | Terminal emulator config | [View](kitty/) |
| `fish/` | Fish shell configuration | [View](fish/) |
| `fastfetch/` | System info tool config | [View](fastfetch/) |
| `btop/` | System monitor config | [View](btop/) |
| `cava/` | Audio visualizer config | [View](cava/) |

### Utilities

| File | Description | Link |
|------|-------------|------|
| `backup.sh` | Backup script for dotfiles | [View](backup.sh) |
| `git.nix` | Git configuration | [View](git.nix) |

## Quick Start

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

## Keybindings

| Key Combo             | Action              |
| --------------------- | ------------------- |
| `Super + D`           | Launcher            |
| `Super + A`           | Dashboard           |
| `Super + X`           | Quick Settings      |
| `Super + N`           | Session Menu        |
| `Super + L`           | Lock Screen         |
| `Super + S`           | Screenshot          |
| `Super + Shift + S`   | Screenshot (freeze) |
| `Super + C`           | Clear Notifications |
| `Super + Return`      | Terminal            |
| `Super + T`           | File Manager        |
| `Super + Q`           | Close Window        |
| `Super + F`           | Fullscreen          |
| `Super + 1-9`         | Workspace 1-9       |

## Directory Structure

```
/etc/nixos/              # System configuration
~/.config/caelestia/     # Caelestia shell config
~/.config/hypr/          # Hyprland (managed)
~/Pictures/Wallpapers/   # Wallpapers directory
~/nix-dotfiles/          # Dotfiles repository
```

## Customization

### Adding Wallpapers

```bash
cp /path/to/image.jpg ~/Pictures/Wallpapers/
# Then use Super + D to select it
```

### Customizing Keybindings

Edit [`hyprland/hyprland.conf`](hyprland/hyprland.conf) or create user overrides:

```bash
nano ~/.config/hypr/hypr-user.conf
hyprctl reload
```

### Theming

#### Dynamic Colors from Wallpaper

1. Set wallpaper: `Super + D` → wallpaper picker
2. Open launcher: `Super + D` → color scheme → "dynamic"

#### Custom Colors

Edit [`shell/shell.json`](shell/shell.json):

```bash
nano ~/.config/caelestia/shell.json
```

#### Terminal Theme

Edit [`kitty/kitty.conf`](kitty/kitty.conf):

```bash
nano ~/.config/kitty/kitty.conf
```

### Package Management

#### Adding System Packages

Edit [`nixos/configuration.nix`](nixos/configuration.nix):

```nix
environment.systemPackages = with pkgs; [
  # Add your packages here
  firefox
  vscode
];
```

#### Adding User Packages

Edit [`nixos/home-manager.nix`](nixos/home-manager.nix):

```nix
home.packages = with pkgs; [
  # Add your packages here
  discord
  spotify
];
```

Then rebuild:

```bash
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

#### Searching for Packages

```bash
# Search in nixpkgs
nix search nixpkgs <package-name>

# Example
nix search nixpkgs firefox
```

### Monitor Configuration

Edit [`hyprland/hyprland.conf`](hyprland/hyprland.conf):

```bash
nano ~/.config/hypr/hyprland.conf
```

Find the monitor section and adjust:

```conf
monitor=DP-1,1920x1080@144,0x0,1
# Format: monitor=NAME,RESOLUTION@REFRESH,POSITION,SCALE
```

### Startup Applications

Edit [`hyprland/hyprland.conf`](hyprland/hyprland.conf) and add to the `exec-once` section:

```conf
exec-once = discord
exec-once = spotify
```

### Shell Configuration

#### Fish Shell

Edit [`fish/config.fish`](fish/config.fish):

```bash
nano ~/.config/fish/config.fish
```

#### Zsh Shell

Edit [`.zshrc`](.zshrc):

```bash
nano ~/.zshrc
```

## Troubleshooting

| Problem                | Solution                                |
| ---------------------- | --------------------------------------- |
| Keybinds not working   | `hyprctl reload`                        |
| Scaling wrong          | Edit monitor line in hypr-user.conf     |
| Screen flickering      | Uncomment VRR disable in hypr-user.conf |
| Shell not starting     | Check `journalctl -xe`                  |
| Wallpaper not changing | Ensure swww-daemon is running           |

### System Recovery

```bash
# Rebuild if something breaks
sudo nixos-rebuild switch --flake /etc/nixos#nixos

# Check logs
journalctl -xe

# Restart Hyprland
# Super + Escape (then login again)
```

### Rollback to Previous Generation

NixOS keeps previous system generations. If something breaks:

```bash
# List available generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Rollback to previous generation
sudo nixos-rebuild switch --rollback

# Or boot into previous generation from GRUB menu
```

### Common Issues

#### Flakes Not Working

```bash
# Ensure flakes are enabled
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

#### Home Manager Conflicts

```bash
# Remove conflicting files
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty

# Then rebuild
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

#### Caelestia Shell Not Starting

```bash
# Check if caelestia-shell is installed
which caelestia-shell

# Check logs
journalctl --user -xe | grep caelestia

# Check if it's running
ps aux | grep caelestia

# Restart manually
killall caelestia-shell
caelestia-shell &

# Verify config exists
ls -la ~/.config/caelestia/
```

#### Wallpaper Not Loading

```bash
# Start swww daemon
swww init

# Set wallpaper
swww img ~/Pictures/Wallpapers/your-wallpaper.jpg
```

## Updating

### Update System

```bash
# Update flake inputs
cd /etc/nixos
sudo nix flake update

# Rebuild with new inputs
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

### Update Dotfiles

```bash
cd ~/nix-dotfiles
git pull origin main

# Copy updated configs
sudo cp -r ~/nix-dotfiles/nixos/* /etc/nixos/

# Rebuild
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

### Garbage Collection

Clean up old generations to free space:

```bash
# Delete generations older than 7 days
sudo nix-collect-garbage --delete-older-than 7d

# Optimize nix store
sudo nix-store --optimize
```

## Backup

Use the included backup script:

```bash
# Run backup
~/nix-dotfiles/backup.sh

# Backup will be created in ~/nix-dotfiles-backup/
```

Or manually:

```bash
# Backup system config
sudo cp -r /etc/nixos ~/nixos-backup

# Backup dotfiles
cp -r ~/.config ~/config-backup
```

## Screenshots

<div align="center">

### Desktop Overview
<img width="1920" alt="Desktop Overview" src="https://github.com/user-attachments/assets/b0acaef3-12da-4114-9763-f364805d1819" />

### Launcher
<img width="1920" alt="Launcher" src="https://github.com/user-attachments/assets/587793b6-564a-4ec2-8966-e7db45d82a98" />

### Dashboard
<img width="1918" alt="Dashboard" src="https://github.com/user-attachments/assets/31743dbe-d147-4467-ad07-2829b3ce9cb6" />

### Quick Settings
<img width="1920" alt="Quick Settings" src="https://github.com/user-attachments/assets/fc3ad18b-f906-46cc-9135-b778f58283f6" />

### Terminal
<img width="3277" alt="Terminal" src="https://github.com/user-attachments/assets/d0a7f333-db2c-41e9-bd32-258010c3de77" />

### Workspace
<img width="3286" alt="Workspace" src="https://github.com/user-attachments/assets/5094cf63-4235-4ba9-a04b-a61fae8a9e87" />

### Notifications
<img width="1920" alt="Notifications" src="https://github.com/user-attachments/assets/82ef15be-5e14-4a71-9c8d-d9c14d5e4c69" />

### Lock Screen
<img width="1920" alt="Lock Screen" src="https://github.com/user-attachments/assets/3c1f00e9-1bb5-49c3-8186-228b787f7f53" />

### File Manager
<img width="1881" alt="File Manager" src="https://github.com/user-attachments/assets/cf6e906e-f288-4131-99c0-a1aae7b79328" />

</div>

## Contributing

Contributions are welcome! Feel free to:

- Report bugs
- Suggest features
- Submit pull requests
- Share your customizations

## License

This project is open source and available under the MIT License.

## Acknowledgments

Built with:
- [NixOS](https://nixos.org) - Declarative Linux distribution
- [Hyprland](https://hyprland.org) - Dynamic tiling Wayland compositor
- [QuickShell](https://github.com/outfoxxed/quickshell) - QtQuick-based desktop shell
- [Home Manager](https://github.com/nix-community/home-manager) - Dotfiles management

Special thanks to the FOSS community for making this possible.

## Support

If you find this project helpful, consider:
- Starring the repository
- Sharing with others
- Contributing improvements

For questions or issues, open an issue on GitHub.

---

# Extended Configuration Guide

This repository contains a comprehensive collection of dotfiles beyond the core Hyprland setup. Below is the complete guide for all included configurations.

## Table of Contents - Extended

- [Alternative Window Managers](#alternative-window-managers)
  - [Niri Configuration](#niri-configuration)
  - [Noctalia Desktop](#noctalia-desktop)
- [Terminal Emulators](#terminal-emulators-1)
  - [Alacritty](#alacritty)
  - [Ghostty](#ghostty)
  - [WezTerm](#wezterm)
  - [Terminal Comparison](#terminal-comparison)
- [Text Editors](#text-editors)
  - [Doom Emacs](#doom-emacs)
  - [GNU Emacs](#gnu-emacs)
  - [Micro](#micro)
- [Theme System](#theme-system)
  - [Matugen](#matugen)
  - [GTK Theming](#gtk-theming)
  - [Qt Theming](#qt-theming)
  - [Spicetify](#spicetify)
- [Launchers & Utilities](#launchers--utilities-1)
  - [Fuzzel](#fuzzel)
  - [Nvtop](#nvtop)
- [Complete Setup Guide](#complete-setup-guide)
- [Workflow Examples](#workflow-examples)
- [Performance Tuning](#performance-tuning)

---

## Alternative Window Managers

### Niri Configuration

Niri is a scrollable-tiling Wayland compositor with a unique approach to window management. Instead of traditional workspaces, windows scroll horizontally.

**Location:** [`niri/`](niri/)

#### Files Structure
```
niri/
├── config.kdl       # Main Niri configuration
└── noctalia.kdl     # Noctalia theme integration
```

#### Installation

```bash
# Install Niri (NixOS)
nix-shell -p niri

# Link configuration
ln -sf ~/nix-dotfiles/niri ~/.config/niri

# Test configuration
niri validate

# Start Niri (from TTY or display manager)
niri
```

#### Key Features

- **Scrollable workspaces** - Windows scroll horizontally instead of switching workspaces
- **Dynamic tiling** - Automatic window arrangement
- **Touchpad gestures** - Swipe between windows
- **Animations** - Smooth transitions and effects
- **Wayland native** - Built for modern display servers

#### Default Keybindings

| Key Combo | Action |
|-----------|--------|
| `Mod+Return` | Open terminal |
| `Mod+D` | Launcher |
| `Mod+Q` | Close window |
| `Mod+H/L` | Scroll left/right |
| `Mod+J/K` | Focus window up/down |
| `Mod+Shift+H/L` | Move window left/right |
| `Mod+F` | Toggle fullscreen |
| `Mod+Shift+E` | Exit Niri |

#### Customization

Edit `~/.config/niri/config.kdl`:

```kdl
// Change layout gaps
layout {
    gaps 10
}

// Modify animations
animations {
    workspace-switch {
        duration-ms 200
    }
}

// Add custom keybindings
binds {
    Mod+B { spawn "firefox"; }
}
```

#### Troubleshooting

```bash
# Check Niri logs
journalctl --user -u niri

# Reload configuration
niri msg reload-config

# Verify config syntax
niri validate
```

---

### Noctalia Desktop

Noctalia is a desktop environment framework with plugin support and customizable widgets.

**Location:** [`noctalia/`](noctalia/)

#### Files Structure
```
noctalia/
├── colors.json                      # Color scheme
├── settings.json                    # Main settings
├── plugins.json                     # Plugin configuration
├── pam/password.conf               # PAM authentication
└── plugins/
    ├── catwalk/                    # Workspace switcher
    ├── fancy-audiovisualizer/      # Audio visualization
    ├── launcher-button/            # App launcher widget
    └── simple-notes/               # Notes widget
```

#### Installation

```bash
# Install Noctalia
# (Check NixOS packages or build from source)

# Link configuration
ln -sf ~/nix-dotfiles/noctalia ~/.config/noctalia

# Start Noctalia
noctalia
```

#### Plugins

##### Catwalk - Workspace Switcher
Visual workspace navigation with custom icons.

**Features:**
- Animated workspace switching
- Custom workspace icons
- Active/idle state indicators
- Multi-language support

**Configuration:** `plugins/catwalk/manifest.json`

##### Fancy Audio Visualizer
Desktop audio visualization with shader effects.

**Features:**
- Real-time audio visualization
- Custom shader support
- Configurable appearance
- Performance optimized

**Shaders:** `plugins/fancy-audiovisualizer/shaders/`

##### Launcher Button
Quick access application launcher widget.

**Features:**
- Customizable launcher command
- Icon configuration
- Positioning options

##### Simple Notes
Desktop notes widget with persistence.

**Features:**
- Quick note taking
- Auto-save functionality
- Customizable appearance

#### Customization

Edit `~/.config/noctalia/settings.json`:

```json
{
  "theme": "noctalia",
  "plugins": {
    "catwalk": {
      "enabled": true,
      "position": "bottom"
    },
    "audiovisualizer": {
      "enabled": true,
      "bars": 64
    }
  }
}
```

---

## Terminal Emulators

### Alacritty

GPU-accelerated terminal emulator focusing on simplicity and performance.

**Location:** [`alacritty/`](alacritty/)

#### Files Structure
```
alacritty/
├── alacritty.toml           # Main configuration
└── themes/
    └── noctalia.toml        # Noctalia color scheme
```

#### Installation

```bash
# Install (NixOS)
nix-shell -p alacritty

# Link configuration
ln -sf ~/nix-dotfiles/alacritty ~/.config/alacritty

# Set as default terminal
echo 'export TERMINAL=alacritty' >> ~/.zshrc
```

#### Features

- **GPU Acceleration** - Uses OpenGL for rendering
- **Low Latency** - Minimal input lag
- **Cross Platform** - Linux, macOS, Windows
- **Configurable** - TOML-based configuration
- **Vi Mode** - Built-in vi-style navigation

#### Configuration Highlights

```toml
# Font configuration
[font]
size = 11.0
normal = { family = "JetBrainsMono Nerd Font", style = "Regular" }

# Window padding
[window.padding]
x = 10
y = 10

# Opacity
[window]
opacity = 0.95
```

#### Customization

```bash
# Edit config
nano ~/.config/alacritty/alacritty.toml

# Change font
[font.normal]
family = "YourFont"

# Adjust opacity
[window]
opacity = 0.9
```

#### Keybindings

| Key Combo | Action |
|-----------|--------|
| `Ctrl+Shift+C` | Copy |
| `Ctrl+Shift+V` | Paste |
| `Ctrl+Shift+F` | Search |
| `Ctrl+Shift+Space` | Vi mode |
| `Ctrl+Shift+N` | New instance |
| `Ctrl+Plus` | Increase font |
| `Ctrl+Minus` | Decrease font |

---

### Ghostty

High-performance native terminal emulator.

**Location:** [`ghostty/`](ghostty/)

#### Files Structure
```
ghostty/
└── themes/
    └── noctalia          # Noctalia color scheme
```

#### Installation

```bash
# Install Ghostty
# (Check distribution packages)

# Link configuration
ln -sf ~/nix-dotfiles/ghostty ~/.config/ghostty
```

#### Features

- **Native Performance** - Written in Zig
- **Fast Rendering** - Optimized display
- **Modern** - Latest terminal features
- **Lightweight** - Minimal resource usage

#### Configuration

```bash
# Main config location
~/.config/ghostty/config

# Theme customization
~/.config/ghostty/themes/noctalia
```

---

### WezTerm

GPU-accelerated terminal with built-in multiplexer.

**Location:** [`wezterm/`](wezterm/)

#### Files Structure
```
wezterm/
├── wezterm.lua              # Main configuration (Lua)
└── colors/
    └── Noctalia.toml        # Noctalia color scheme
```

#### Installation

```bash
# Install (NixOS)
nix-shell -p wezterm

# Link configuration
ln -sf ~/nix-dotfiles/wezterm ~/.config/wezterm

# Launch
wezterm
```

#### Features

- **GPU Acceleration** - Hardware-accelerated rendering
- **Multiplexer** - Built-in tmux-like functionality
- **Lua Configuration** - Powerful scripting
- **Ligatures** - Font ligature support
- **Tabs & Panes** - Native split support
- **Image Protocol** - Inline image display

#### Configuration Highlights

```lua
-- Font configuration
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11.0

-- Color scheme
config.color_scheme = "Noctalia"

-- Opacity
config.window_background_opacity = 0.95

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
```

#### Keybindings

| Key Combo | Action |
|-----------|--------|
| `Ctrl+Shift+T` | New tab |
| `Ctrl+Shift+W` | Close tab |
| `Ctrl+Shift+N` | New window |
| `Ctrl+Shift+H/J/K/L` | Navigate panes |
| `Ctrl+Shift+%` | Split horizontal |
| `Ctrl+Shift+"` | Split vertical |
| `Ctrl+Shift+Z` | Toggle pane zoom |

#### Multiplexer Usage

```bash
# Create new tab
Ctrl+Shift+T

# Split pane horizontally
Ctrl+Shift+%

# Split pane vertically
Ctrl+Shift+"

# Navigate between panes
Ctrl+Shift+H/J/K/L

# Close pane
Ctrl+Shift+W
```

#### Customization

Edit `~/.config/wezterm/wezterm.lua`:

```lua
local wezterm = require 'wezterm'
local config = {}

-- Font
config.font = wezterm.font("YourFont")
config.font_size = 12.0

-- Custom keybindings
config.keys = {
  {
    key = 'Enter',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitHorizontal,
  },
}

return config
```

---

### Terminal Comparison

| Feature | Kitty | Alacritty | Ghostty | WezTerm |
|---------|-------|-----------|---------|---------|
| **GPU Acceleration** | ✓ | ✓ | ✓ | ✓ |
| **Multiplexer** | ✓ | ✗ | ✗ | ✓ |
| **Config Language** | Conf | TOML | Conf | Lua |
| **Image Support** | ✓ | ✗ | ✓ | ✓ |
| **Ligatures** | ✓ | ✓ | ✓ | ✓ |
| **Resource Usage** | Medium | Low | Low | Medium |
| **Startup Time** | Fast | Fastest | Fastest | Fast |
| **Extensibility** | High | Low | Medium | Very High |

**Recommendation:**
- **Speed priority** → Alacritty or Ghostty
- **Features priority** → WezTerm or Kitty
- **Simplicity** → Alacritty
- **Scripting** → WezTerm (Lua)
- **Multiplexing** → WezTerm or Kitty

---

## Text Editors

### Doom Emacs

Evil (Vim) keybindings for Emacs with curated packages and optimizations.

**Location:** [`doom/`](doom/)

#### Files Structure
```
doom/
├── config.el                # User configuration
├── init.el                  # Module selection
├── packages.el              # Package management
└── themes/
    └── noctalia-theme.el    # Custom theme
```

#### Installation

```bash
# Install dependencies (NixOS)
nix-shell -p emacs git ripgrep fd

# Clone Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs

# Link Doom config
ln -sf ~/nix-dotfiles/doom ~/.config/doom

# Install Doom
~/.config/emacs/bin/doom install

# Sync packages
~/.config/emacs/bin/doom sync
```

#### Enabled Modules

Check `~/.config/doom/init.el` for enabled modules:

- **Completion:** vertico, company
- **UI:** doom, modeline, ophints, treemacs
- **Editor:** evil, snippets, multiple-cursors
- **Tools:** magit, lsp, debugger
- **Lang:** nix, markdown, org, shell-script

#### Custom Theme

The Noctalia theme is included at `themes/noctalia-theme.el`.

Activate in `config.el`:
```elisp
(setq doom-theme 'noctalia)
```

#### Essential Keybindings

| Key | Action |
|-----|--------|
| `SPC f f` | Find file |
| `SPC f r` | Recent files |
| `SPC b b` | Switch buffer |
| `SPC p p` | Switch project |
| `SPC s s` | Search in buffer |
| `SPC g g` | Magit status |
| `SPC c c` | Compile |
| `SPC h r r` | Reload config |
| `SPC q q` | Quit |

#### Customization

Edit `~/.config/doom/config.el`:

```elisp
;; Font
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))

;; Theme
(setq doom-theme 'noctalia)

;; Line numbers
(setq display-line-numbers-type 'relative)

;; Custom keybindings
(map! :leader
      :desc "My function" "m f" #'my-function)
```

#### Package Management

Add packages in `~/.config/doom/packages.el`:

```elisp
;; Add package from MELPA
(package! package-name)

;; Add package from Git
(package! package-name
  :recipe (:host github :repo "user/repo"))
```

Then sync:
```bash
~/.config/emacs/bin/doom sync
```

#### Troubleshooting

```bash
# Check for errors
~/.config/emacs/bin/doom doctor

# Rebuild packages
~/.config/emacs/bin/doom sync -u

# Clear cache
~/.config/emacs/bin/doom clean

# Reload config
# Inside Emacs: SPC h r r
```

---

### GNU Emacs

Standard Emacs configuration.

**Location:** [`emacs/`](emacs/)

#### Installation

```bash
# Install Emacs
nix-shell -p emacs

# Link configuration
ln -sf ~/nix-dotfiles/emacs ~/.config/emacs

# Launch Emacs
emacs
```

#### Features

- Custom configuration
- Package management with straight.el or package.el
- Personal customizations

---

### Micro

Modern terminal text editor with mouse support and sane defaults.

**Location:** [`micro/`](micro/)

#### Files Structure
```
micro/
├── settings.json            # Editor settings
├── bindings.json            # Custom keybindings
├── buffers/history          # Buffer history
├── colorschemes/            # Color schemes
│   ├── catppuccin-frappe.micro
│   ├── catppuccin-latte.micro
│   ├── catppuccin-macchiato.micro
│   └── catppuccin-mocha.micro
└── syntax/                  # 100+ syntax definitions
```

#### Installation

```bash
# Install (NixOS)
nix-shell -p micro

# Link configuration
ln -sf ~/nix-dotfiles/micro ~/.config/micro

# Launch
micro file.txt
```

#### Features

- **Mouse Support** - Click to position cursor
- **Syntax Highlighting** - 100+ languages
- **Multiple Cursors** - Multi-cursor editing
- **Plugin System** - Extend functionality
- **Sane Defaults** - Works out of the box
- **Common Keybindings** - Ctrl+C/V/Z work as expected

#### Default Keybindings

| Key | Action |
|-----|--------|
| `Ctrl+S` | Save |
| `Ctrl+Q` | Quit |
| `Ctrl+F` | Find |
| `Ctrl+Z` | Undo |
| `Ctrl+Y` | Redo |
| `Ctrl+C` | Copy |
| `Ctrl+X` | Cut |
| `Ctrl+V` | Paste |
| `Ctrl+A` | Select all |
| `Ctrl+N` | New file |
| `Ctrl+O` | Open file |

#### Configuration

Edit `~/.config/micro/settings.json`:

```json
{
  "colorscheme": "catppuccin-mocha",
  "tabsize": 4,
  "tabstospaces": true,
  "autoindent": true,
  "mouse": true,
  "syntax": true,
  "statusline": true
}
```

#### Available Color Schemes

- `catppuccin-frappe`
- `catppuccin-latte`
- `catppuccin-macchiato`
- `catppuccin-mocha`

Change theme:
```bash
# Inside micro, press Ctrl+E then type:
set colorscheme catppuccin-mocha
```

#### Plugin Management

```bash
# Install plugin
micro -plugin install pluginname

# List plugins
micro -plugin list

# Update plugins
micro -plugin update
```

---

## Theme System

### Matugen

Material Design color scheme generator that creates themes from wallpapers.

**Location:** [`matugen/`](matugen/)

#### Files Structure
```
matugen/
├── config.toml              # Matugen configuration
└── templates/
    └── alacritty.toml       # Alacritty theme template
```

#### Installation

```bash
# Install matugen
# (Check NixOS packages or cargo install)

# Link configuration
ln -sf ~/nix-dotfiles/matugen ~/.config/matugen
```

#### Usage

```bash
# Generate theme from wallpaper
matugen image ~/Pictures/Wallpapers/wallpaper.jpg

# Generate and apply
matugen image ~/Pictures/Wallpapers/wallpaper.jpg --apply

# Use specific template
matugen image wallpaper.jpg --template alacritty

# Generate colors only
matugen image wallpaper.jpg --json > colors.json
```

#### Features

- **Material Design 3** - Google's latest design system
- **Template System** - Generate configs for any app
- **Multiple Schemes** - Light and dark variants
- **Color Extraction** - Intelligent color selection
- **Integration** - Works with various applications

#### Configuration

Edit `~/.config/matugen/config.toml`:

```toml
# Output directory
output_dir = "~/.config/matugen/colors"

# Template directory
template_dir = "~/.config/matugen/templates"

# Color scheme variant
variant = "dark"  # or "light"

# Contrast level
contrast = 0.0  # -1.0 to 1.0
```

#### Creating Templates

Create template in `~/.config/matugen/templates/`:

```toml
# Example: my-app.toml
background = "{{ colors.surface }}"
foreground = "{{ colors.on_surface }}"
primary = "{{ colors.primary }}"
accent = "{{ colors.secondary }}"
```

#### Integration Examples

```bash
# Generate Alacritty theme
matugen image wallpaper.jpg --template alacritty > ~/.config/alacritty/colors.toml

# Generate and reload Alacritty
matugen image wallpaper.jpg --template alacritty > ~/.config/alacritty/colors.toml && pkill -USR1 alacritty

# Generate for multiple apps
matugen image wallpaper.jpg --template alacritty --template kitty --template wezterm
```

---

### GTK Theming

Custom GTK3 and GTK4 themes with Noctalia color scheme.

**GTK3 Location:** [`gtk-3.0/`](gtk-3.0/)
**GTK4 Location:** [`gtk-4.0/`](gtk-4.0/)

#### Files Structure
```
gtk-3.0/
├── gtk.css                  # Main stylesheet
├── colors.css               # Color variables
├── window_decorations.css   # Titlebar styling
├── settings.ini             # GTK settings
└── assets/                  # SVG icons
    ├── close-*.svg
    ├── maximize-*.svg
    └── minimize-*.svg

gtk-4.0/
├── gtk.css
├── colors.css
├── window_decorations.css
└── settings.ini
```

#### Installation

```bash
# Link GTK3
ln -sf ~/nix-dotfiles/gtk-3.0 ~/.config/gtk-3.0

# Link GTK4
ln -sf ~/nix-dotfiles/gtk-4.0 ~/.config/gtk-4.0

# Apply immediately
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
```

#### Features

- **Custom Window Decorations** - Styled titlebar buttons
- **Color Scheme Integration** - Noctalia colors
- **SVG Assets** - Scalable titlebar icons
- **Dark Theme** - Optimized for dark mode
- **Consistent Styling** - Matches overall theme

#### Customization

Edit `~/.config/gtk-3.0/colors.css`:

```css
/* Color variables */
@define-color theme_fg_color #ffffff;
@define-color theme_bg_color #1e1e2e;
@define-color theme_selected_bg_color #89b4fa;
@define-color theme_selected_fg_color #000000;

/* Accent color */
@define-color accent_color #89b4fa;
```

#### GTK Settings

Edit `~/.config/gtk-3.0/settings.ini`:

```ini
[Settings]
gtk-theme-name=Adwaita
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=Sans 10
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=24
gtk-application-prefer-dark-theme=1
gtk-enable-animations=true
```

#### Troubleshooting

```bash
# Reload GTK settings
gsettings reset-recursively org.gnome.desktop.interface

# Force dark mode
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Check current theme
gsettings get org.gnome.desktop.interface gtk-theme
```

---

### Qt Theming

Qt5 and Qt6 application theming with Caelestia color scheme.

**Qt5 Location:** [`qt5ct/`](qt5ct/)
**Qt6 Location:** [`qt6ct/`](qt6ct/)

#### Files Structure
```
qt5ct/
├── qt5ct.conf               # Qt5 settings
└── colors/
    └── caelestia.colors     # Color scheme

qt6ct/
├── qt6ct.conf               # Qt6 settings
└── colors/
    └── caelestia.colors     # Color scheme
```

#### Installation

```bash
# Install qt5ct and qt6ct
nix-shell -p qt5ct qt6ct

# Link configurations
ln -sf ~/nix-dotfiles/qt5ct ~/.config/qt5ct
ln -sf ~/nix-dotfiles/qt6ct ~/.config/qt6ct

# Set environment variables
echo 'export QT_QPA_PLATFORMTHEME=qt5ct' >> ~/.zshrc
echo 'export QT_QPA_PLATFORMTHEME=qt6ct' >> ~/.zshrc

# For current session
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=qt6ct
```

#### Features

- **Caelestia Color Scheme** - Matching colors
- **Font Configuration** - System font integration
- **Icon Theme** - Consistent icons
- **Style Settings** - Qt application appearance

#### Configuration

Edit `~/.config/qt5ct/qt5ct.conf`:

```ini
[Appearance]
color_scheme_path=~/.config/qt5ct/colors/caelestia.colors
style=Breeze
icon_theme=Papirus-Dark

[Fonts]
fixed=@Variant(\0\0\0@\0\0\0\x1e\0J\0\x65\0t\0\x42\0r\0\x61\0i\0n\0s\0M\0o\0n\0o@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)
general=@Variant(\0\0\0@\0\0\0\x12\0S\0\x61\0n\0s\0 \0S\0\x65\0r\0i\0\x66@$\0\0\0\0\0\0\xff\xff\xff\xff\x5\x1\0\x32\x10)
```

#### Using qt5ct/qt6ct GUI

```bash
# Launch Qt5 configuration tool
qt5ct

# Launch Qt6 configuration tool
qt6ct

# In the GUI:
# 1. Go to "Appearance" tab
# 2. Select "caelestia" color scheme
# 3. Choose icon theme
# 4. Apply changes
```

#### Custom Color Scheme

Edit `~/.config/qt5ct/colors/caelestia.colors`:

```ini
[ColorScheme]
active_colors=#ffffff, #1e1e2e, #89b4fa, ...
disabled_colors=#6c7086, #1e1e2e, #313244, ...
inactive_colors=#cdd6f4, #1e1e2e, #89b4fa, ...
```

#### Troubleshooting

```bash
# Check environment variable
echo $QT_QPA_PLATFORMTHEME

# If Qt apps don't theme:
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=qt6ct

# Verify qt5ct is installed
which qt5ct

# Reset to defaults
rm ~/.config/qt5ct/qt5ct.conf
qt5ct  # Reconfigure
```

---

### Spicetify

Spotify theming and customization framework.

**Location:** [`spicetify/`](spicetify/)

#### Files Structure
```
spicetify/
└── Themes/
    └── caelestia/
        └── color.ini        # Theme colors
```

#### Installation

```bash
# Install Spicetify
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh

# Give Spicetify permissions
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R

# Link theme
ln -sf ~/nix-dotfiles/spicetify ~/.config/spicetify

# Set theme
spicetify config current_theme caelestia
spicetify config color_scheme base

# Apply
spicetify backup apply
```

#### Features

- **Custom Colors** - Caelestia color scheme
- **Theme Matching** - Matches system theme
- **Spotify Integration** - Seamless theming

#### Customization

Edit `~/.config/spicetify/Themes/caelestia/color.ini`:

```ini
[base]
main_fg                = ffffff
secondary_fg           = b4befe
main_bg                = 1e1e2e
sidebar_and_player_bg  = 181825
cover_overlay_and_shadow = 11111b
indicator_fg_and_button_bg = 89b4fa
pressing_fg            = cba6f7
slider_bg              = 313244
sidebar_indicator_and_hover_button_bg = 89b4fa
scrollbar_fg_and_selected_row_bg = 313244
pressing_button_fg     = 1e1e2e
pressing_button_bg     = cba6f7
selected_button        = 6c7086
miscellaneous_bg       = 313244
miscellaneous_hover_bg = 45475a
```

#### Update Theme

```bash
# After editing colors
spicetify apply

# Restore original Spotify
spicetify restore

# Backup Spotify
spicetify backup

# Update Spicetify
spicetify upgrade
```

#### Troubleshooting

```bash
# Spotify won't start
spicetify restore
spicetify backup apply

# Theme not applying
spicetify config current_theme caelestia
spicetify apply

# Check config
spicetify config-dir
```

---

## Launchers & Utilities

### Fuzzel

Wayland-native application launcher with keyboard-driven interface.

**Location:** [`fuzzel/`](fuzzel/)

#### Files Structure
```
fuzzel/
└── fuzzel.ini               # Main configuration
```

#### Installation

```bash
# Install (NixOS)
nix-shell -p fuzzel

# Link configuration
ln -sf ~/nix-dotfiles/fuzzel ~/.config/fuzzel

# Launch
fuzzel
```

#### Features

- **Wayland Native** - Built for Wayland
- **Fast** - Efficient launcher
- **Keyboard Driven** - Vi-like navigation
- **Theme Integration** - System colors
- **Icon Support** - Application icons

#### Configuration

Edit `~/.config/fuzzel/fuzzel.ini`:

```ini
[main]
font=JetBrainsMono Nerd Font:size=11
terminal=alacritty
layer=overlay
width=40
horizontal-pad=20
vertical-pad=10
inner-pad=10

[colors]
background=1e1e2eff
text=cdd6f4ff
match=89b4faff
selection=313244ff
selection-text=cdd6f4ff
border=89b4faff

[border]
width=2
radius=10
```

#### Usage

```bash
# Launch fuzzel
fuzzel

# Launch with custom options
fuzzel --width 50 --lines 15

# Launch specific app
fuzzel --query "firefox"
```

#### Keybindings

| Key | Action |
|-----|--------|
| `Type to search` | Filter apps |
| `Enter` | Launch selected |
| `Esc` | Close |
| `Up/Down` | Navigate |
| `Ctrl+N/P` | Navigate |
| `Ctrl+U` | Clear input |

#### Integration with Compositor

Add to Hyprland config:
```conf
bind = SUPER, D, exec, fuzzel
```

Add to Niri config:
```kdl
binds {
    Mod+D { spawn "fuzzel"; }
}
```

---

### Nvtop

GPU and system monitoring tool with ncurses interface.

**Location:** [`nvtop/`](nvtop/)

#### Files Structure
```
nvtop/
└── nvtop.colors             # Color scheme
```

#### Installation

```bash
# Install (NixOS)
nix-shell -p nvtop

# Link configuration
ln -sf ~/nix-dotfiles/nvtop ~/.config/nvtop

# Launch
nvtop
```

#### Features

- **GPU Monitoring** - NVIDIA, AMD, Intel
- **Process Tracking** - GPU process list
- **Multi-GPU** - Support for multiple GPUs
- **Color Customization** - Custom colors
- **Real-time Stats** - Live monitoring

#### Usage

```bash
# Launch nvtop
nvtop

# Monitor specific GPU
nvtop -d 0

# ASCII mode (no unicode)
nvtop -a
```

#### Keybindings

| Key | Action |
|-----|--------|
| `q` | Quit |
| `Up/Down` | Navigate processes |
| `F1` | Toggle GPU info |
| `F2` | Setup |
| `F3` | Sort by GPU usage |
| `F9` | Kill process |

---

## Complete Setup Guide

### Full Installation Script

Install all configurations at once:

```bash
#!/bin/bash
# Complete dotfiles installation

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/nix-dotfiles"

# Create config directory
mkdir -p "$CONFIG_DIR"

echo "Installing core configurations..."

# Core configs
ln -sf "$DOTFILES_DIR/hyprland" "$CONFIG_DIR/hypr"
ln -sf "$DOTFILES_DIR/kitty" "$CONFIG_DIR/kitty"
ln -sf "$DOTFILES_DIR/fish" "$CONFIG_DIR/fish"
ln -sf "$DOTFILES_DIR/fastfetch" "$CONFIG_DIR/fastfetch"
ln -sf "$DOTFILES_DIR/btop" "$CONFIG_DIR/btop"
ln -sf "$DOTFILES_DIR/cava" "$CONFIG_DIR/cava"
ln -sf "$DOTFILES_DIR/waybar" "$CONFIG_DIR/waybar"
ln -sf "$DOTFILES_DIR/zsh" "$CONFIG_DIR/zsh"
ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "Installing alternative terminals..."

ln -sf "$DOTFILES_DIR/alacritty" "$CONFIG_DIR/alacritty"
ln -sf "$DOTFILES_DIR/ghostty" "$CONFIG_DIR/ghostty"
ln -sf "$DOTFILES_DIR/wezterm" "$CONFIG_DIR/wezterm"

echo "Installing editors..."

ln -sf "$DOTFILES_DIR/doom" "$CONFIG_DIR/doom"
ln -sf "$DOTFILES_DIR/emacs" "$CONFIG_DIR/emacs"
ln -sf "$DOTFILES_DIR/micro" "$CONFIG_DIR/micro"

echo "Installing theming..."

ln -sf "$DOTFILES_DIR/gtk-3.0" "$CONFIG_DIR/gtk-3.0"
ln -sf "$DOTFILES_DIR/gtk-4.0" "$CONFIG_DIR/gtk-4.0"
ln -sf "$DOTFILES_DIR/qt5ct" "$CONFIG_DIR/qt5ct"
ln -sf "$DOTFILES_DIR/qt6ct" "$CONFIG_DIR/qt6ct"
ln -sf "$DOTFILES_DIR/matugen" "$CONFIG_DIR/matugen"

echo "Installing compositors and tools..."

ln -sf "$DOTFILES_DIR/niri" "$CONFIG_DIR/niri"
ln -sf "$DOTFILES_DIR/noctalia" "$CONFIG_DIR/noctalia"
ln -sf "$DOTFILES_DIR/fuzzel" "$CONFIG_DIR/fuzzel"
ln -sf "$DOTFILES_DIR/nvtop" "$CONFIG_DIR/nvtop"
ln -sf "$DOTFILES_DIR/spicetify" "$CONFIG_DIR/spicetify"

echo "Installation complete!"
echo ""
echo "Next steps:"
echo "1. Set environment variables for Qt theming:"
echo "   export QT_QPA_PLATFORMTHEME=qt5ct"
echo ""
echo "2. Install Doom Emacs (if using):"
echo "   git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs"
echo "   ~/.config/emacs/bin/doom install"
echo ""
echo "3. Configure Spicetify (if using):"
echo "   spicetify config current_theme caelestia"
echo "   spicetify backup apply"
echo ""
echo "4. Reload your shell or logout/login"
```

Save as `~/nix-dotfiles/install-all.sh` and run:
```bash
chmod +x ~/nix-dotfiles/install-all.sh
~/nix-dotfiles/install-all.sh
```

---

## Workflow Examples

### Daily Driver Setup

**Morning Routine:**
```bash
# Start day with Hyprland
# Login → Select Hyprland session

# Open terminals
Super+Return  # Kitty
Super+Alt+Return  # Alacritty (if bound)

# Check system
btop  # System monitor
nvtop  # GPU monitor

# Start apps
Super+D → "firefox"
Super+D → "code"
```

### Development Workflow

**Code Editing:**
```bash
# Terminal-based
micro project/file.rs  # Quick edits
emacs project/  # Full IDE experience

# With Doom Emacs
emacs
SPC f f → find file
SPC p p → switch project
SPC g g → git status (magit)
```

**Terminal Multiplexing:**
```bash
# Using WezTerm
Ctrl+Shift+% → split horizontal
Ctrl+Shift+" → split vertical

# Or use built-in Hyprland/Niri tiling
```

### Theming Workflow

**Dynamic Theming:**
```bash
# 1. Choose wallpaper
swww img ~/Pictures/Wallpapers/new-wallpaper.jpg

# 2. Generate colors
matugen image ~/Pictures/Wallpapers/new-wallpaper.jpg

# 3. Apply to terminals
matugen image wallpaper.jpg --template alacritty > ~/.config/alacritty/colors.toml

# 4. Reload applications
pkill -USR1 alacritty  # Reload Alacritty
hyprctl reload  # Reload Hyprland
```

### Multi-Compositor Setup

**Switching Between Compositors:**

```bash
# From display manager (SDDM/GDM):
# Select session:
# - Hyprland (main)
# - Niri (scrollable)
# - Plasma (fallback)

# Each has its own workflow:
# Hyprland → traditional workspaces
# Niri → horizontal scrolling
```

---

## Performance Tuning

### Terminal Performance

**Alacritty:**
```toml
# Reduce latency
[terminal]
osc52 = "CopyPaste"

[scrolling]
history = 10000  # Reduce if needed

[window]
dynamic_padding = false
```

**WezTerm:**
```lua
-- Reduce resource usage
config.scrollback_lines = 10000
config.enable_tab_bar = false
config.enable_scroll_bar = false
```

### Compositor Performance

**Hyprland:**
```conf
# Performance tweaks
decoration {
    blur {
        enabled = false  # Disable for performance
    }
}

animations {
    enabled = true
    animation = windows, 1, 3, default  # Faster animations
}
```

**Niri:**
```kdl
// Reduce animations
animations {
    workspace-switch {
        duration-ms 150  // Faster
    }
}
```

### System Monitoring

```bash
# Check terminal rendering performance
# In any terminal, run:
yes "$(seq 1 100)" | head -n 10000

# Monitor GPU usage
nvtop

# Monitor CPU/RAM
btop

# Check Wayland compositor performance
# Watch frame times in compositor logs
```

### Resource Usage Comparison

| Application | RAM Usage | Startup Time | CPU Usage |
|-------------|-----------|--------------|-----------|
| **Terminals** |
| Kitty | ~30MB | Fast | Low |
| Alacritty | ~20MB | Fastest | Minimal |
| Ghostty | ~25MB | Fastest | Minimal |
| WezTerm | ~40MB | Fast | Low-Medium |
| **Editors** |
| Micro | ~10MB | Instant | Minimal |
| Emacs | ~150MB | Medium | Medium |
| Doom Emacs | ~200MB | Medium | Medium |
| **Compositors** |
| Hyprland | ~100MB | Fast | Low-Medium |
| Niri | ~80MB | Fast | Low |

---

## Configuration Overview

### All Included Configurations

| Category | Application | Config Location | Theme Support |
|----------|-------------|-----------------|---------------|
| **Compositors** | Hyprland | `hyprland/` | ✓ |
| | Niri | `niri/` | ✓ |
| **Desktop** | Caelestia | `shell/` | ✓ |
| | Noctalia | `noctalia/` | ✓ |
| | Waybar | `waybar/` | ✓ |
| **Terminals** | Kitty | `kitty/` | ✓ |
| | Alacritty | `alacritty/` | ✓ |
| | Ghostty | `ghostty/` | ✓ |
| | WezTerm | `wezterm/` | ✓ |
| **Shells** | Fish | `fish/` | ✓ |
| | Zsh | `.zshrc` | ✓ |
| **Editors** | Doom Emacs | `doom/` | ✓ |
| | Emacs | `emacs/` | ✓ |
| | Micro | `micro/` | ✓ |
| **Launchers** | Fuzzel | `fuzzel/` | ✓ |
| | Drun | `drun/` | ✓ |
| **Monitors** | Btop | `btop/` | ✓ |
| | Nvtop | `nvtop/` | ✓ |
| | Cava | `cava/` | ✓ |
| **Theming** | GTK3 | `gtk-3.0/` | ✓ |
| | GTK4 | `gtk-4.0/` | ✓ |
| | Qt5 | `qt5ct/` | ✓ |
| | Qt6 | `qt6ct/` | ✓ |
| | Matugen | `matugen/` | ✓ |
| | Spicetify | `spicetify/` | ✓ |
| **Utilities** | Fastfetch | `fastfetch/` | ✓ |
| | Waypaper | `waypaper/` | - |

### Total Configuration Count

- **25 Applications** configured
- **290+ Files** managed
- **13,000+ Lines** of configuration
- **Multiple Themes** integrated
- **Unified Color Scheme** (Noctalia/Caelestia)

---

## Quick Reference

### Essential Commands

```bash
# System
sudo nixos-rebuild switch --flake /etc/nixos#nixos
nix-collect-garbage -d

# Hyprland
hyprctl reload
hyprctl dispatch workspace 1

# Niri
niri validate
niri msg reload-config

# Terminals
alacritty
ghostty
wezterm
kitty

# Editors
emacs
doom run
micro

# Theming
matugen image wallpaper.jpg
spicetify apply
qt5ct

# Monitoring
btop
nvtop
```

### Directory Quick Reference

```
~/.config/
├── hypr/           # Hyprland
├── niri/           # Niri
├── noctalia/       # Noctalia
├── alacritty/      # Alacritty
├── ghostty/        # Ghostty
├── wezterm/        # WezTerm
├── kitty/          # Kitty
├── doom/           # Doom Emacs
├── emacs/          # Emacs
├── micro/          # Micro
├── gtk-3.0/        # GTK3
├── gtk-4.0/        # GTK4
├── qt5ct/          # Qt5
├── qt6ct/          # Qt6
├── matugen/        # Matugen
├── fuzzel/         # Fuzzel
└── spicetify/      # Spicetify
```


