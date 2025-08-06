### README: My Rofi Configuration

This document provides a breakdown of my Rofi configuration, which is a powerful application launcher and window switcher. This setup is optimized for a minimalist and efficient workflow, leveraging custom icons and a NixOS-managed theme.

#### Key Features

- **Enabled Modes:** The configuration is set to primarily use the `drun` (Desktop Run) and `run` modes. This allows for quick launching of both installed applications (from `.desktop` files) and general shell commands.
- **Nerd Font Icons:** All Rofi modes are given custom labels with Nerd Font icons (`󰣖`, `󱓞`, etc.). This adds a clear, visual distinction to each mode and enhances the overall aesthetic.
- **Application Icons:** The `show-icons` setting is enabled, ensuring that applications in the `drun` mode are displayed with their respective icons, making them easier to identify at a glance.
- **NixOS-Managed Theme:** The active theme is sourced directly from the Nix store, specifically using the `fullscreen-preview.rasi` theme. This ensures that the theme is consistently available and managed by the Nix package manager, providing a clean and distraction-free full-screen interface.

#### Configuration Breakdown

| Setting               | Value                                                     | Purpose                                                            |
|-----------------------|-----------------------------------------------------------|--------------------------------------------------------------------|
| `modi`                | `"drun,run"`                                              | Enables the application launcher and command-line modes.           |
| `show-icons`          | `true`                                                    | Displays application icons in the list.                            |
| `display-drun`        | `"󰣖 drun:"`                                              | Customizes the label for the application launcher mode.            |
| `display-run`         | `"󱓞 run:"`                                               | Customizes the label for the command-line mode.                    |
| `@theme`              | `/nix/store/.../fullscreen-preview.rasi`                  | Specifies the full-screen theme managed by NixOS.                  |

#### Requirements

To ensure this configuration works as intended, the following are required:

- **Rofi:** The Rofi application launcher must be installed.
- **Nerd Fonts:** A Nerd Font must be installed on the system and used by your terminal or desktop environment to display the custom icons correctly.
- **NixOS:** The theme path is specific to a NixOS installation and relies on the `rofi` package being present in the Nix store.
