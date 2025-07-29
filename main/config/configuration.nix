
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

#  system.stateVersion = "25.05";

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

  # Enable X11 and SDDM display manager
#  services.xserver.enable = true;
#  services.displayManager.sddm.enable = true;

  # Auto-login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "muffin";

  # Enable Hyprland window manager
  programs.hyprland.enable = true;

  # Printing
  services.printing.enable = true;

  #flakes-expemental
  

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #nix-ld
  programs.nix-ld.enable = true;
 

 




  # Audio with PipeWire (replacing PulseAudio)
 # hardware.pulseaudio.enable = false;
 # security.rtkit.enable = true;
 # services.pipewire = {
 #   enable = true;
 #   alsa.enable = true;
 #   alsa.support32Bit = true;
 #   pulse.enable = true;
    # jack.enable = true;
#  };

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
      # thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Firefox
  programs.firefox.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    kitty
    waybar
    wofi
    swww
    brightnessctl
    pamixer
    playerctl
    wl-clipboard
    pavucontrol
    networkmanager
    fastfetch
    cmatrix
    btop
    vscode
    discord
    spotify
    grim
    slurp
    capitaine-cursors
    xfce.thunar
    xfce.tumbler
    pipes
    hyprlock
    hypridle
    cliphist
    bluetuith
    bluez
    bluez-tools
    blueman
    pipes
    cava
    wget	
    rofi
    unzip
    zoxide    
    rofi-wayland
    pkgs.obsidian
    python3Full    
    python3Packages.tqdm
    pkgs.binaryninja-free
    hyprpaper
    go 
    git
    git gcc gnumake
  ddcutil
  brightnessctl
  lm_sensors
  fish
  aubio
  qt6.qtdeclarative
  material-symbols
  swappy
  libqalculate
#  app2unit
  burpsuite
  rustc
  cargo
  fzf
   pkgs.hyprpaper

 ];

  services.displayManager.sddm.enable = true;
  services.xserver.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
  

   # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  

programs.zsh.enable = true;

environment.etc."zshenv".text = ''
  export ZDOTDIR="$HOME/.config/zsh"
'';









  } 
