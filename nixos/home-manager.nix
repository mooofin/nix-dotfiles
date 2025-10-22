{ config, pkgs, inputs, system, ... }:

{
  home.username = "muffin";
  home.homeDirectory = "/home/muffin";
  home.stateVersion = "24.05";
  
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    inputs.caelestia-shell.packages.${system}.with-cli
    kitty
    nemo
    grim
    slurp
    swappy
    swww
    brightnessctl
    pipewire
    wireplumber
    pamixer
    pavucontrol
    networkmanagerapplet
    libnotify
    lm_sensors
    material-symbols
    nerd-fonts.caskaydia-cove
    libqalculate
    ddcutil
    fish
    imagemagick
    neofetch
    firefox
    spotify
    discord
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = "eDP-1,preferred,auto,1";
      exec-once = [
        "swww-daemon"
        "caelestia-shell"
      ];
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
        sensitivity = 0;
      };
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(89b4faee) rgba(cba6f7ee) 45deg";
        "col.inactive_border" = "rgba(313244aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 20;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 7;
          passes = 2;
          vibrancy = 0.1696;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };
      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master.new_status = "master";
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
    };
    extraConfig = "source = ~/.config/caelestia/hypr-user.conf";
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "muffin";
        email = "siddharthqln@gmail.com";
      };
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = "0.85";
      font_family = "CaskaydiaCove Nerd Font";
      font_size = 11;
      enable_audio_bell = false;
    };
  };
}
