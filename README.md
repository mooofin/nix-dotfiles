<div align="center">

# Pastel Perfection

**NixOS + Hyprland + QuickShell**

A declarative, reproducible desktop environment featuring dynamic theming and modern aesthetics

[![NixOS](https://img.shields.io/badge/NixOS-5277C3?style=for-the-badge&logo=nixos&logoColor=white)](https://nixos.org)
[![Hyprland](https://img.shields.io/badge/Hyprland-00D9FF?style=for-the-badge&logo=wayland&logoColor=white)](https://hyprland.org)
[![Flakes](https://img.shields.io/badge/Nix_Flakes-7E7EFF?style=for-the-badge&logo=nix&logoColor=white)](#)

[Watch Demo](https://youtu.be/ffDwGmziiCg?si=ATK48WMnEsbNwPK6) • [Report Bug](#troubleshooting) • [Request Feature](#)

<img width="900" alt="Pastel Perfection Preview" src="https://github.com/user-attachments/assets/b0acaef3-12da-4114-9763-f364805d1819" />

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


