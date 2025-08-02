```nix
# This file defines what should be installed on your system.
# Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the latest stable release of NixOS.
  system.stateVersion = "24.05";

  # --- Bootloader ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- Hostname and Networking ---
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # --- Time zone and Locale ---
  time.timeZone = "Asia/Kolkata";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "en_US.UTF-8/UTF-8" "en_IN/UTF-8" ];
    extraLocaleSettings = {
      LC_ADDRESS        = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT    = "en_IN";
      LC_MONETARY       = "en_IN";
      LC_NAME           = "en_IN";
      LC_NUMERIC        = "en_IN";
      LC_PAPER          = "en_IN";
      LC_TELEPHONE      = "en_IN";
      LC_TIME           = "en_IN";
    };
  };

  # --- Keyboard Layout ---
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # --- Flake and nix-ld configuration ---
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;

  # --- Graphics and Display Manager ---
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "muffin";

  # --- Window Manager ---
  programs.hyprland.enable = true;

  # --- Audio ---
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  # --- Bluetooth ---
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # --- Printing ---
  services.printing.enable = true;

  # --- User Accounts ---
  users.users.muffin = {
    isNormalUser = true;
    description = "muffin";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
      # thunderbird
    ];
  };

  # --- Package Management ---
  nixpkgs.config.allowUnfree = true;

  # --- Program Settings ---
  programs.firefox.enable = true;
  programs.zsh.enable = true;
  environment.etc."zshenv".text = ''
    export ZDOTDIR="$HOME/.config/zsh"
  '';

  # --- System Packages ---
  environment.systemPackages = with pkgs; [
    # Terminal and Shell
    zsh
    fish
    kitty
    fastfetch
    cmatrix
    btop
    unzip
    git
    git
    zoxide
    fzf
    # Hyprland and Wayland Tools
    waybar
    wofi
    rofi
    rofi-wayland
    swww
    swaylock
    hyprlock
    hypridle
    hyprpaper
    waypaper
    grim
    slurp
    swappy
    wl-clipboard
    # File Management
    xfce.thunar
    xfce.tumbler
    # Audio and Bluetooth
    pavucontrol
    pamixer
    playerctl
    cava
    bluetuith
    bluez
    bluez-tools
    blueman
    # System Utilities
    brightnessctl
    ddcutil
    lm_sensors
    wget
    libqalculate
    # Applications
    vscode
    discord
    spotify
    obsidian
    binaryninja-free
    ghidra
    burpsuite
    # Programming
    rustc
    cargo
    gcc
    gnumake
    python3Full
    python3Packages.tqdm
    # Visuals and Themes
    capitaine-cursors
    material-symbols
    # Other
    pipes
    aubio
    qt6.qtdeclarative
  ];

  # --- Final Configuration ---
  # This value determines the NixOS release from which the default
  # settings for stateful data were taken.
  # It's recommended to leave this value at the release version of the
  # first install of this system.
  # Before changing this value, read the documentation for this option.
  system.stateVersion = "25.05";
}
```
