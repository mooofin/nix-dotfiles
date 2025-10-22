### My Hyprland Configuration

This repository holds my personal dotfiles for the **Hyprland** Wayland compositor. The configuration is crafted for a fast, visually pleasing, and highly efficient desktop experience. It's built around a "glassy" theme, featuring a custom setup for Waybar, Kitty, and Rofi, and includes a host of shortcuts and scripts to streamline the workflow.

-----

### Key Features

  * **Hyprland**: My configuration leverages Hyprland's powerful features to create a dynamic tiling environment with smooth, custom animations.
  * **"Glassy" Aesthetic**: The core theme is centered on a transparent, blurred look. This is achieved through specific settings in the `decoration` and `blurls` sections of the configuration, applying a frosted-glass effect to windows and panels like Waybar.
  * **Themed Applications**: The configuration includes custom settings for key applications, ensuring they blend seamlessly with the overall theme. This includes specific opacity and rounding rules for Kitty, Firefox, and VS Code.
  * **Performance & Flexibility**: I've included two preset modes—**Performance Mode** and **Glassy Mode**—that can be toggled with a single keybinding. This allows you to quickly switch between a high-performance, minimal-effects setup and a full-featured, visually rich one.
  * **Keyboard-Centric Workflow**: The configuration is optimized for keyboard use, with a comprehensive set of keybindings for everything from launching applications and managing windows to taking screenshots and exiting the session.

-----

### Configuration Breakdown

The configuration is broken down into logical sections to make it easy to understand and modify.

  * **Monitor**: Sets up the monitor to use its preferred resolution and refresh rate automatically.
  * **Exec-once**: These are commands that run once when Hyprland starts. This includes initializing `swww` for the wallpaper and launching `waybar`.
  * **Input & General**: Defines basic input settings like keyboard layout and touchpad natural scrolling. The `general` section sets the layout to `dwindle` and defines the gaps and border sizes for windows.
  * **Decorations**: This is where the visual style is defined.
      * **Rounding**: Windows have a corner radius of `25`.
      * **Blur**: A heavy, multi-pass blur is enabled, giving the system its signature glassy look.
      * **Border Colors**: The colors for active and inactive window borders are set using hexadecimal RGBA values to provide a consistent theme.
  * **Animations**: The configuration uses several custom `bezier` curves and animation rules to create smooth, elegant window and workspace transitions.
      * `easeOutExpo`: Used for border and fade animations for a quick, "snappy" effect.
      * `easeInOutCubic`: Provides a smooth start and end for workspace switching.
  * **Keybinds**: All shortcuts are defined here. They are categorized for clarity, covering application launching, window management, and system control.
  * **Window Rules (`windowrulev2`)**: These are specific rules that apply to individual applications. They are used to set custom opacity levels, rounding, and floating status for different programs, ensuring a consistent user experience.
  * **Toggles & Presets**: This section defines keybinds that use `hyprctl` to dynamically change the configuration. This includes toggles for blur, shadows, and animations, as well as the **Performance** and **Glassy** modes.

-----

### Installation and Usage

1.  **Prerequisites**: Make sure you have the following packages installed on your system: `hyprland`, `waybar`, `rofi`, `kitty`, `thunar`, `dunst`, `swww`, `grim`, `slurp`.
2.  **Clone the Repo**:
3.  **Symlink Configuration Files**: Create symbolic links from the cloned repository to your `~/.config` directory to apply the settings.
4.  **Start Hyprland**: Log out and select the Hyprland session from your display manager (like SDDM) or run `Hyprland` from a TTY.
