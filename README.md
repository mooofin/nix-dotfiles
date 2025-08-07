# 🌸 My NixOS Dotfiles

> A cozy haven of seamless blurs, delicate pastel glows.

This repository holds my personal dotfiles for a custom NixOS setup, centered around the **Hyprland** Wayland compositor. The configuration is crafted for a visually pleasing, keyboard-centric, and highly efficient desktop experience. It's built around a "glassy" theme with a pastel color palette, powered by a custom setup for Waybar, Kitty, and Rofi, all managed declaratively with Nix.

-----

### 📂 Directory Structure

```
nix-dotfiles/
├── btop/             # Btop resource monitor config & custom theme
├── cava/             # Cava audio visualizer config & shaders
├── drun/             # Rofi application launcher configuration
├── fastfetch/        # Fastfetch system information tool config
├── fish/             # Fish shell configuration
├── hyprland/         # Hyprland window manager & related configs
│   ├── hypridle/     # Hypridle lockscreen behavior configuration
│   ├── hyprlock/     # Hyprlock screen locker config & README
│   ├── waybar/       # Waybar config and CSS for the taskbar
│   └── hyprland.conf # Main Hyprland configuration file
├── kitty/            # Kitty terminal config & themes
├── lanita/           # Collection of wallpapers and custom assets
├── main/             # Main NixOS flake and configuration files
│   └── nixos/
│       ├── configuration/  # Core NixOS configurations
│       └── flakes/         # Flake definitions
├── waybar/           # Waybar config and CSS
├── waypaper/         # Wallpaper management script
└── .zshrc            # My Zsh shell configuration
```

-----

### 🎨 Theming

The core aesthetic is defined by a soft, pastel-toned color palette that is applied system-wide.

#### Core Colors

| Name        | Hex       | Purpose            |
|-------------|-----------|--------------------|
| Pastel Pink | `#f2d5dc` | Accent / bars      |
| Dusty Rose  | `#d8a7b1` | Background tint    |
| Plum        | `#b08b9e` | Contrast text      |
| Deep Mauve  | `#7a4e65` | Highlights         |
| Nightshade  | `#2c1e2e` | Background / blur  |

#### Fonts

  - **Primary**: `Iosevka`, `JetBrains Mono`, or `Fira Code`
  - **Cursive overlay (optional)**: `Cedarville Cursive`, `EB Garamond`

-----

### 💻 Modules Overview

#### Hyprland

The core of my desktop experience.

  - **Aesthetic**: A "glassy" look is achieved through multi-pass blur and rounding on windows. Active and inactive window borders use themed RGBA values.
  - **Animations**: Custom `bezier` curves (`easeOutExpo`, `easeInOutCubic`) create smooth and elegant window and workspace transitions.
  - **Window Rules**: Specific `windowrulev2` rules are applied to applications like `kitty`, `firefox`, and `vscode` to set custom opacities, rounding, and floating status.
  - **Keybinds**: My workflow is keyboard-centric, with keybinds for everything from launching applications to window management and system control.

#### Waybar

My taskbar, configured for a minimalist "pill" layout.

  - **Layout**: Modules are arranged in rounded, semi-transparent blocks at the bottom of the screen.
  - **Modules**: Key modules displayed include workspaces, the active window title, CPU/memory usage, network status, battery, and a custom clock.
  - **Functionality**: Modules like `pulseaudio` launch `pavucontrol` with a click, and `hyprland/workspaces` can be navigated with the mouse scroll wheel.

#### Kitty

My preferred terminal emulator.

  - **Theme**: The configuration imports the **Catppuccin Mocha** theme for a soothing color scheme.
  - **Font**: The primary font is **Fira Code Nerd Font**, chosen for its programming ligatures and extensive collection of Nerd Font icons.
  - **Visuals**: A slight `background_opacity` creates a blurred effect, and `window_padding_width` improves readability.

#### Btop

A customizable resource monitor.

  - **Custom Theme**: Btop uses a custom theme file named `lana.theme` which defines a unique color palette for the interface.
  - **Layout**: `presets` are defined for quick layout switching, and the default view displays CPU, memory, network, and process information.
  - **Process Sorting**: The default sorting is set to `"cpu lazy"`, which makes it easier to track the most resource-intensive processes without the list constantly jumping.

#### Cava

A lightweight audio visualizer.

  - **Input**: Cava uses `pulseaudio` as its input source and automatically detects the correct source.
  - **Gradient Colors**: A color `gradient` is enabled with a custom palette of pastel hex codes, providing a unique visualizer effect.
  - **Equalizer**: A custom `eq` setting slightly boosts low and high frequencies, creating a "smiley face" curve for a more dynamic visualization.

#### Rofi

A powerful application launcher and window switcher.

  - **Modes**: The configuration is set to use `drun` (desktop applications) and `run` (shell commands) modes.
  - **Icons**: All modes are given custom labels with Nerd Font icons, enhancing the visual distinction between modes.
  - **Theme**: The active theme is sourced directly from the Nix store (`fullscreen-preview.rasi`), ensuring a consistent and distraction-free full-screen interface.

-----

### ⚙️ Setup and Customization

#### Dependencies

To use this configuration, you will need to have the following tools installed:

  - `Hyprland`: The window manager
  - `Waybar`: The taskbar
  - `Kitty`: The terminal emulator
  - `Rofi`: The application launcher
  - `Cava`: The audio visualizer
  - `Fastfetch`: The system information tool
  - `Btop`: The resource monitor
  - `swww`: For managing the wallpaper
  - `grim` & `slurp`: For screenshots
  - `pavucontrol`, `pamixer`, `playerctl`, `wl-clipboard`: For audio and clipboard management
  - **Nerd Fonts**: An essential dependency for icons in Waybar, Rofi, and Fastfetch.

#### Installation

You can either **copy the modules manually** or **use Nix Home Manager / flakes**.

1.  **Manual Installation**:

    ```bash
    # Clone the repo
    git clone https://github.com/your-username/nix-dotfiles ~/.config/nix-dotfiles

    # Create symlinks for each configuration file
    ln -s ~/.config/nix-dotfiles/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
    ln -s ~/.config/nix-dotfiles/waybar ~/.config/waybar
    # ...and so on for all modules.
    ```

2.  **With Flakes**:

      * Add this repository as an input to your `flake.nix` file.
      * Import the modules into your `home-manager` configuration.

#### Customization

  - **Wallpaper**: Use the `waypaper.sh` script to set a new wallpaper. The script automatically updates your Hyprland configuration.
  - **Colors**: The color themes for `btop` (`lana.theme`) and `cava` (`config`) can be easily edited by changing the hex color codes.
  - **Fonts**: The primary fonts for Kitty and Waybar can be changed by editing the `font_family` in their respective configuration files.
  - **Waybar Layout**: To change the order or content of your Waybar, simply edit the `modules-left`, `modules-center`, and `modules-right` arrays in `waybar/config`.

-----

<img width="1920" height="1076" alt="screenshot-1754558175" src="https://github.com/user-attachments/assets/fc3ad18b-f906-46cc-9135-b778f58283f6" />




<img width="3277" height="763" alt="screenshot-1753628591" src="https://github.com/user-attachments/assets/d0a7f333-db2c-41e9-bd32-258010c3de77" />




<img width="3286" height="768" alt="screenshot-1753957106" src="https://github.com/user-attachments/assets/5094cf63-4235-4ba9-a04b-a61fae8a9e87" />


<img width="1920" height="1080" alt="screenshot-1754141258" src="https://github.com/user-attachments/assets/82ef15be-5e14-4a71-9c8d-d9c14d5e4c69" />


<img width="1371" height="768" alt="screenshot-1754403714" src="https://github.com/user-attachments/assets/22ac5ca6-d68e-4783-9fc8-7568fa03229e" />

<img width="1920" height="1042" alt="screenshot-1754556800" src="https://github.com/user-attachments/assets/3c1f00e9-1bb5-49c3-8186-228b787f7f53" />






<img width="1881" height="1005" alt="screenshot-1753964934" src="https://github.com/user-attachments/assets/cf6e906e-f288-4131-99c0-a1aae7b79328" />

### 📋 TODO / Roadmap

  - [ ] Convert to full `home-manager` modules
  - [ ] Make modules toggleable via flake options
  - [ ] Add animated transitions via `waybar` CSS
  - [ ] Optional `stylix` theme export
  - [ ] More color palettes: `ethereal blue`, `digital twilight`
