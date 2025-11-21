#!/usr/bin/env bash

# Pastel Perfection Installer
# Automated installation script for NixOS + Hyprland + QuickShell setup

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Functions
print_header() {
    echo -e "${MAGENTA}"
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║                                                            ║"
    echo "║              Pastel Perfection Installer                  ║"
    echo "║         NixOS + Hyprland + QuickShell Setup                ║"
    echo "║                                                            ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_step() {
    echo -e "${CYAN}==>${NC} ${BLUE}$1${NC}"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

prompt_yes_no() {
    while true; do
        read -p "$(echo -e ${CYAN}$1 ${NC}[y/n]: )" yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

check_nixos() {
    if [ ! -f /etc/NIXOS ]; then
        print_error "This script must be run on NixOS"
        exit 1
    fi
    print_success "Running on NixOS"
}

check_flakes() {
    if ! nix flake --version &> /dev/null; then
        print_warning "Nix flakes not enabled"
        return 1
    fi
    print_success "Nix flakes enabled"
    return 0
}

enable_flakes() {
    print_step "Enabling Nix flakes..."
    
    if [ ! -f /etc/nixos/configuration.nix ]; then
        print_error "Cannot find /etc/nixos/configuration.nix"
        exit 1
    fi
    
    # Check if flakes already enabled
    if grep -q "experimental-features.*flakes" /etc/nixos/configuration.nix; then
        print_success "Flakes already enabled in configuration"
        return 0
    fi
    
    print_warning "Flakes need to be enabled manually"
    echo "Add this to your /etc/nixos/configuration.nix:"
    echo ""
    echo "  nix.settings.experimental-features = [ \"nix-command\" \"flakes\" ];"
    echo ""
    
    if prompt_yes_no "Open configuration.nix in editor?"; then
        ${EDITOR:-nano} /etc/nixos/configuration.nix
        echo ""
        if prompt_yes_no "Did you add the flakes configuration?"; then
            print_step "Rebuilding NixOS to enable flakes..."
            sudo nixos-rebuild switch
            print_success "Flakes enabled"
        else
            print_error "Flakes must be enabled to continue"
            exit 1
        fi
    else
        print_error "Flakes must be enabled to continue"
        exit 1
    fi
}

backup_existing() {
    print_step "Backing up existing configuration..."
    
    BACKUP_DIR="$HOME/nixos-backup-$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    # Backup system config
    if [ -d /etc/nixos ]; then
        print_step "Backing up /etc/nixos..."
        sudo cp -r /etc/nixos "$BACKUP_DIR/nixos-system"
        print_success "System config backed up to $BACKUP_DIR/nixos-system"
    fi
    
    # Backup dotfiles
    DOTFILES_TO_BACKUP=(
        ".config/hypr"
        ".config/kitty"
        ".config/fish"
        ".config/waybar"
        ".config/caelestia"
        ".config/fastfetch"
        ".config/btop"
        ".config/cava"
    )
    
    for dotfile in "${DOTFILES_TO_BACKUP[@]}"; do
        if [ -e "$HOME/$dotfile" ]; then
            print_step "Backing up ~/$dotfile..."
            mkdir -p "$BACKUP_DIR/$(dirname $dotfile)"
            cp -r "$HOME/$dotfile" "$BACKUP_DIR/$dotfile"
        fi
    done
    
    print_success "Backup completed: $BACKUP_DIR"
    echo "$BACKUP_DIR" > "$HOME/.pastel-perfection-backup"
}

get_user_info() {
    print_step "Gathering system information..."
    
    # Get username
    CURRENT_USER=$(whoami)
    echo -e "${CYAN}Current user:${NC} $CURRENT_USER"
    read -p "$(echo -e ${CYAN}Enter username for configuration ${NC}[${CURRENT_USER}]: )" INPUT_USER
    USERNAME=${INPUT_USER:-$CURRENT_USER}
    
    # Get hostname
    CURRENT_HOSTNAME=$(hostname)
    echo -e "${CYAN}Current hostname:${NC} $CURRENT_HOSTNAME"
    read -p "$(echo -e ${CYAN}Enter hostname ${NC}[${CURRENT_HOSTNAME}]: )" INPUT_HOSTNAME
    HOSTNAME=${INPUT_HOSTNAME:-$CURRENT_HOSTNAME}
    
    # Get timezone
    CURRENT_TIMEZONE=$(timedatectl show --property=Timezone --value 2>/dev/null || echo "America/New_York")
    echo -e "${CYAN}Current timezone:${NC} $CURRENT_TIMEZONE"
    read -p "$(echo -e ${CYAN}Enter timezone ${NC}[${CURRENT_TIMEZONE}]: )" INPUT_TIMEZONE
    TIMEZONE=${INPUT_TIMEZONE:-$CURRENT_TIMEZONE}
    
    print_success "Configuration will use:"
    echo "  Username: $USERNAME"
    echo "  Hostname: $HOSTNAME"
    echo "  Timezone: $TIMEZONE"
    echo ""
}

update_configs() {
    print_step "Updating configuration files..."
    
    # Update flake.nix hostname
    if [ -f "$SCRIPT_DIR/nixos/flake.nix" ]; then
        sed -i "s/nixosConfigurations\..*=/nixosConfigurations.$HOSTNAME =/" "$SCRIPT_DIR/nixos/flake.nix"
        print_success "Updated hostname in flake.nix"
    fi
    
    # Update configuration.nix
    if [ -f "$SCRIPT_DIR/nixos/configuration.nix" ]; then
        sed -i "s/networking\.hostName = \".*\"/networking.hostName = \"$HOSTNAME\"/" "$SCRIPT_DIR/nixos/configuration.nix"
        sed -i "s/time\.timeZone = \".*\"/time.timeZone = \"$TIMEZONE\"/" "$SCRIPT_DIR/nixos/configuration.nix"
        print_success "Updated configuration.nix"
    fi
    
    # Update home-manager.nix
    if [ -f "$SCRIPT_DIR/nixos/home-manager.nix" ]; then
        sed -i "s/home\.username = \".*\"/home.username = \"$USERNAME\"/" "$SCRIPT_DIR/nixos/home-manager.nix"
        sed -i "s|home\.homeDirectory = \"/home/.*\"|home.homeDirectory = \"/home/$USERNAME\"|" "$SCRIPT_DIR/nixos/home-manager.nix"
        print_success "Updated home-manager.nix"
    fi
}

copy_hardware_config() {
    print_step "Copying hardware configuration..."
    
    if [ -f /etc/nixos/hardware-configuration.nix ]; then
        cp /etc/nixos/hardware-configuration.nix "$SCRIPT_DIR/nixos/hardware-configuration.nix"
        print_success "Hardware configuration copied"
    else
        print_warning "No hardware configuration found, using existing one"
    fi
}

install_system_config() {
    print_step "Installing system configuration..."
    
    # Remove old config
    if prompt_yes_no "Remove existing /etc/nixos?"; then
        sudo rm -rf /etc/nixos
        print_success "Removed old configuration"
    fi
    
    # Copy new config
    sudo cp -r "$SCRIPT_DIR/nixos" /etc/nixos
    sudo chown -R root:root /etc/nixos
    print_success "System configuration installed to /etc/nixos"
}

build_system() {
    print_step "Building NixOS configuration..."
    echo ""
    print_warning "This may take a while on first build..."
    echo ""
    
    if sudo nixos-rebuild switch --flake "/etc/nixos#$HOSTNAME"; then
        print_success "System built successfully"
        return 0
    else
        print_error "Build failed"
        return 1
    fi
}

install_dotfiles() {
    print_step "Installing dotfiles..."
    
    # Create directories
    mkdir -p "$HOME/.config"
    mkdir -p "$HOME/Pictures/Wallpapers"
    
    # Link dotfiles
    DOTFILES=(
        "hyprland:hypr"
        "kitty:kitty"
        "fish:fish"
        "fastfetch:fastfetch"
        "btop:btop"
        "cava:cava"
        "waybar:waybar"
    )
    
    for dotfile in "${DOTFILES[@]}"; do
        SRC="${dotfile%%:*}"
        DEST="${dotfile##*:}"
        
        if [ -d "$SCRIPT_DIR/$SRC" ]; then
            # Remove existing
            if [ -e "$HOME/.config/$DEST" ]; then
                rm -rf "$HOME/.config/$DEST"
            fi
            
            # Create symlink
            ln -sf "$SCRIPT_DIR/$SRC" "$HOME/.config/$DEST"
            print_success "Linked $SRC -> ~/.config/$DEST"
        fi
    done
    
    # Setup Caelestia shell configuration
    print_step "Setting up Caelestia shell..."
    
    # The Caelestia shell looks for config in XDG_CONFIG_HOME/caelestia
    # We need to link the entire dotfiles directory as the shell config
    if [ -e "$HOME/.config/caelestia" ]; then
        rm -rf "$HOME/.config/caelestia"
    fi
    
    # Create caelestia config directory and link shell files
    mkdir -p "$HOME/.config/caelestia"
    
    # Link shell.qml (main entry point)
    if [ -f "$SCRIPT_DIR/shell.qml" ]; then
        ln -sf "$SCRIPT_DIR/shell.qml" "$HOME/.config/caelestia/shell.qml"
        print_success "Linked shell.qml"
    fi
    
    # Link shell directory contents (contains hypr.qml and other configs)
    if [ -d "$SCRIPT_DIR/shell" ]; then
        for item in "$SCRIPT_DIR/shell"/*; do
            if [ -e "$item" ]; then
                basename_item=$(basename "$item")
                ln -sf "$item" "$HOME/.config/caelestia/$basename_item"
                print_success "Linked shell/$basename_item"
            fi
        done
    fi
    
    # Link modules directory if it exists (for custom modules)
    if [ -d "$SCRIPT_DIR/modules" ]; then
        ln -sf "$SCRIPT_DIR/modules" "$HOME/.config/caelestia/modules"
        print_success "Linked modules directory"
    fi
    
    # Create hypr-user.conf for user customizations
    if [ ! -f "$HOME/.config/caelestia/hypr-user.conf" ]; then
        cat > "$HOME/.config/caelestia/hypr-user.conf" << 'EOF'
# User-specific Hyprland configuration
# This file is sourced by Hyprland and won't be overwritten by updates

# Example: Custom monitor configuration
# monitor=DP-1,1920x1080@144,0x0,1

# Example: Custom keybindings
# bind=SUPER,B,exec,firefox

EOF
        print_success "Created hypr-user.conf"
    fi
    
    # Copy zshrc if exists
    if [ -f "$SCRIPT_DIR/.zshrc" ]; then
        cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
        print_success "Copied .zshrc"
    fi
}

download_wallpapers() {
    print_step "Setting up wallpapers..."
    
    if prompt_yes_no "Do you want to add sample wallpapers?"; then
        echo "Please add your wallpapers to ~/Pictures/Wallpapers/"
        echo "You can do this after installation"
    fi
    
    print_success "Wallpaper directory ready: ~/Pictures/Wallpapers"
}

print_completion() {
    echo ""
    echo -e "${GREEN}"
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║                                                            ║"
    echo "║              Installation Complete!                        ║"
    echo "║                                                            ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
    echo -e "${CYAN}Next steps:${NC}"
    echo "  1. Reboot your system: ${YELLOW}sudo reboot${NC}"
    echo "  2. Select 'Hyprland' at login"
    echo "  3. Caelestia shell will start automatically"
    echo "  4. Add wallpapers to ~/Pictures/Wallpapers/"
    echo "  5. Press ${YELLOW}Super + D${NC} to open launcher"
    echo ""
    echo -e "${CYAN}Keybindings:${NC}"
    echo "  ${YELLOW}Super + D${NC}       - Launcher"
    echo "  ${YELLOW}Super + A${NC}       - Dashboard"
    echo "  ${YELLOW}Super + X${NC}       - Quick Settings"
    echo "  ${YELLOW}Super + Return${NC}  - Terminal"
    echo "  ${YELLOW}Super + L${NC}       - Lock Screen"
    echo ""
    echo -e "${CYAN}Caelestia Shell:${NC}"
    echo "  Config: ~/.config/caelestia/"
    echo "  Main file: ~/.config/caelestia/shell.qml"
    echo "  User config: ~/.config/caelestia/hypr-user.conf"
    echo ""
    echo -e "${CYAN}Backup location:${NC}"
    if [ -f "$HOME/.pastel-perfection-backup" ]; then
        cat "$HOME/.pastel-perfection-backup"
    fi
    echo ""
    echo -e "${CYAN}Troubleshooting:${NC}"
    echo "  Check shell status: ${YELLOW}ps aux | grep caelestia${NC}"
    echo "  View logs: ${YELLOW}journalctl --user -xe${NC}"
    echo ""
    echo -e "${CYAN}Documentation:${NC} See README.md for more information"
    echo ""
}

# Main installation flow
main() {
    print_header
    
    # Pre-flight checks
    check_nixos
    
    if ! check_flakes; then
        enable_flakes
    fi
    
    echo ""
    print_warning "This installer will:"
    echo "  • Backup your existing configuration"
    echo "  • Install NixOS configuration to /etc/nixos"
    echo "  • Link dotfiles to ~/.config"
    echo "  • Rebuild your system"
    echo ""
    
    if ! prompt_yes_no "Continue with installation?"; then
        print_error "Installation cancelled"
        exit 0
    fi
    
    echo ""
    
    # Installation steps
    backup_existing
    echo ""
    
    get_user_info
    echo ""
    
    update_configs
    echo ""
    
    copy_hardware_config
    echo ""
    
    install_system_config
    echo ""
    
    if ! build_system; then
        print_error "Installation failed during system build"
        echo ""
        echo "Your backup is available at:"
        cat "$HOME/.pastel-perfection-backup"
        exit 1
    fi
    
    echo ""
    install_dotfiles
    echo ""
    
    download_wallpapers
    
    print_completion
    
    if prompt_yes_no "Reboot now?"; then
        sudo reboot
    fi
}

# Run main function
main
