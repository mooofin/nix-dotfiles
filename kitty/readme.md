### README: My Kitty Terminal Configuration

This document provides a breakdown of my Kitty terminal emulator configuration, located at `~/.config/kitty/kitty.conf`. The goal of this setup is to create a visually appealing and comfortable terminal environment, optimized for productivity and an aesthetic that complements my Hyprland desktop.

#### Key Features

- **Catppuccin Theme:** The configuration imports the Catppuccin Mocha theme, a popular, eye-pleasing color scheme. This ensures a consistent, soothing color palette for all terminal text, syntax highlighting, and UI elements.
- **Fira Code Nerd Font:** The primary font is set to "Fira Code Nerd Font." This font is a key component of my setup for several reasons:
  - **Ligatures:** Fira Code provides programming ligatures (e.g., `->` and `==` are rendered as single, distinct characters), which can improve code readability.
  - **Nerd Font Icons:** As a Nerd Font variant, it includes a vast collection of icons, which are essential for command-line tools like Fastfetch, Neofetch, and file managers like Ranger.
- **Visual Comfort:**
  - **`background_opacity`:** The terminal background is set to be slightly transparent, allowing the desktop wallpaper to show through and creating a more integrated feel with the Hyprland environment.
  - **`cursor_trail`:** A subtle cursor trail effect is enabled, which can make it easier to track the cursor's movement in busy terminal sessions.
  - **`window_padding_width`:** Extra padding is added around the terminal content, preventing text from touching the window edges and improving readability.
- **Session Management:** The `confirm_os_window_close` setting is disabled (`0`), which allows me to close the terminal window immediately without a confirmation prompt, streamlining my workflow.

#### Configuration Breakdown

| Setting                   | Value                               | Purpose                                                              |
|---------------------------|-------------------------------------|----------------------------------------------------------------------|
| `include`                 | `catppuccin-mocha.conf`             | Imports the external Catppuccin theme file for color settings.       |
| `font_family`             | `FiraCode Nerd Font`                | Sets the primary font, providing ligatures and Nerd Font icons.      |
| `bold_font` & `italic_font`| `auto`                              | Automatically selects bold and italic variants of the `font_family`.   |
| `font_size`               | `15`                                | Sets the default font size for comfortable reading.                  |
| `confirm_os_window_close` | `0`                                 | Disables the confirmation dialog when closing the terminal window.   |
| `background_opacity`      | `0.7`                               | Controls the transparency of the terminal background.                |
| `cursor_trail`            | `1`                                 | Enables a subtle cursor trail effect.                                |
| `window_padding_width`    | `5`                                 | Adds padding around the terminal content.                            |

#### Requirements

To fully experience this configuration, you must have the `FiraCode Nerd Font` installed on your system. The `catppuccin-mocha.conf` theme file should also be correctly located in the specified path.
