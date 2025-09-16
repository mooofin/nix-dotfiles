# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, libs,inputs,system,... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  system.stateVersion = "25.05";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Hostname and networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Asia/Kolkata";

  # Locale
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

  # Keyboard layout
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #fonts
  
  fonts = {
    packages = with pkgs; [
      pkgs.nerd-fonts.jetbrains-mono	
      font-awesome
    ];
  }; 
	


  # Enable X11 and SDDM display manager
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  # Auto-login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "muffin";

  # Enable Hyprland window manager
  programs.hyprland.enable = true;

  # Printing
  services.printing.enable = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # nix-ld
  programs.nix-ld.enable = true;

  # Bluetooth support
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # User account
  users.users.muffin = {
    isNormalUser = true;
    description = "muffin";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Firefox
  programs.firefox.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    kitty
    neovim
    pkgs.code-cursor
    waybar

    vlc
    wofi
    swww
    brightnessctl
    pkgs.yazi
    pamixer
    playerctl
    inputs.caelestia-shell.packages.${system}.with-cli
    wl-clipboard
   pavucontrol
  networkmanager
    fastfetch
    pkgs.unimatrix
    btop
    vscode
    discord
    spotify
    grim
    slurp
    capitaine-cursors
    pkgs.nemo
    xfce.tumbler
    pipes
    hyprlock
    hypridle
    bluetuith
    bluez
    bluez-tools
    blueman
    cava
    wget
    rofi
    unzip
    zoxide
    rofi
    waypaper
    obsidian
    python3
    pkgs.sfml
    binaryninja-free
    hyprpaper
    git
    pkgs.nodejs_24
    pkgs.mpvpaper
    gcc
    gnumake
    ddcutil
    lm_sensors
    fish
    aubio
    qt6.qtdeclarative
    material-symbols
    swappy
    libqalculate
    burpsuite
    rustc
    swaylock
    cargo
    pkgs.clock-rs		
    fzf
    ghidra
    
  ];

  programs.zsh.enable = true;

  environment.etc."zshenv".text = ''

    export ZDOTDIR="$HOME/.config/zsh"

  '';
 programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };


}
