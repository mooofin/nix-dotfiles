#!/usr/bin/env bash
# Backup script for NixOS dotfiles

set -e

DOTFILES_DIR="$HOME/nix-dotfiles"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "🔄 Backing up NixOS configuration and dotfiles..."

# Create backup directory if it doesn't exist
mkdir -p "$DOTFILES_DIR"/{nixos,dotfiles,backups}

# Backup NixOS configuration
echo "📦 Backing up NixOS configuration..."
sudo cp /etc/nixos/flake.nix "$DOTFILES_DIR/nixos/" 2>/dev/null || echo "⚠️  flake.nix not found"
sudo cp /etc/nixos/flake.lock "$DOTFILES_DIR/nixos/" 2>/dev/null || echo "⚠️  flake.lock not found"
sudo cp /etc/nixos/configuration.nix "$DOTFILES_DIR/nixos/" 2>/dev/null || echo "⚠️  configuration.nix not found"
sudo cp /etc/nixos/hardware-configuration.nix "$DOTFILES_DIR/nixos/" 2>/dev/null || echo "⚠️  hardware-configuration.nix not found"
sudo cp /etc/nixos/home-manager.nix "$DOTFILES_DIR/nixos/" 2>/dev/null || echo "⚠️  home-manager.nix not found"
sudo chown -R $USER:users "$DOTFILES_DIR/nixos/"

# Backup dotfiles
echo "📂 Backing up dotfiles..."
[ -d ~/.config/caelestia ] && cp -r ~/.config/caelestia "$DOTFILES_DIR/dotfiles/"
[ -d ~/.config/nvim ] && cp -r ~/.config/nvim "$DOTFILES_DIR/dotfiles/"
[ -d ~/.config/fish ] && cp -r ~/.config/fish "$DOTFILES_DIR/dotfiles/"
[ -d ~/.config/kitty ] && cp -r ~/.config/kitty "$DOTFILES_DIR/dotfiles/"
[ -d ~/.config/rofi ] && cp -r ~/.config/rofi "$DOTFILES_DIR/dotfiles/"
[ -d ~/.config/waybar ] && cp -r ~/.config/waybar "$DOTFILES_DIR/dotfiles/"
[ -d ~/.config/btop ] && cp -r ~/.config/btop "$DOTFILES_DIR/dotfiles/"
[ -d ~/.config/fastfetch ] && cp -r ~/.config/fastfetch "$DOTFILES_DIR/dotfiles/"

# Create timestamped backup
echo "💾 Creating timestamped backup..."
tar -czf "$DOTFILES_DIR/backups/dotfiles-backup-$TIMESTAMP.tar.gz" \
    -C "$DOTFILES_DIR" nixos dotfiles 2>/dev/null || echo "⚠️  Backup creation had warnings"

echo ""
echo "✅ Backup complete!"
echo "📁 Location: $DOTFILES_DIR"
echo "💾 Timestamped backup: $DOTFILES_DIR/backups/dotfiles-backup-$TIMESTAMP.tar.gz"
echo ""
echo "To restore:"
echo "  sudo cp $DOTFILES_DIR/nixos/* /etc/nixos/"
echo "  sudo nixos-rebuild switch --flake /etc/nixos#nixos"
