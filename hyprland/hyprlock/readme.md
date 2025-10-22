### README: My Hyprlock Configuration

This document outlines the configuration for my Hyprlock screen locker, which is designed for a clean and informative lock screen experience. The setup uses pywal to dynamically theme the lock screen to match the current wallpaper, with a focus on a clear, time-centric display.

#### Key Features

- **Dynamic Theming:** The configuration sources colors from a pywal cache file (`colors-hyprland.conf`). This ensures that the lock screen's text and input field colors match the dominant colors of the current wallpaper.
- **Background:** A static PNG image is used as the background, located in the `Downloads` folder. The background has been configured with subtle blurring and vibrant color effects to create a modern aesthetic.
- **Time & Date Display:** The lock screen prominently displays the time, day of the week, and date using distinct labels.
  - **Hours and Minutes:** The hours and minutes are shown in a large, bold font (`Geist Mono`).
  - **Day and Date:** The day and date are displayed in a smaller font (`JetBrainsMono Nerd Font`).
- **Live Weather:** A `curl` command fetches the "feels like" temperature from `wttr.in` and displays it on the lock screen, providing a quick weather update at a glance.
- **Input Field:** A minimalist password input field is positioned at the bottom of the screen. Its colors are dynamically set by pywal, and it features a rounded design with a subtle placeholder text.

#### Configuration Breakdown

| Section        | Purpose                                                                                                 |
|----------------|---------------------------------------------------------------------------------------------------------|
| `source`       | Specifies the path to the pywal-generated color palette, enabling dynamic color changes.                |
| `background`   | Defines the lock screen's background image and applies subtle blur, contrast, and vibrancy effects.     |
| `label` (Time) | Configures three separate labels to display hours, minutes, and the day of the week with custom fonts.  |
| `label` (Weather)| Fetches and displays the current "feels like" temperature using a shell command.                          |
| `input-field`  | Customizes the password entry box, including its size, colors (dynamically from pywal), and placeholder text.|

#### Requirements

To use this configuration, you will need:

- **Hyprlock:** The screen locker from the Hyprland ecosystem.
- **pywal:** A tool that generates a color palette from an image. The `colors-hyprland.conf` file is assumed to be generated and updated by a pywal script.
- **Fonts:** The fonts `Geist Mono` and `JetBrainsMono Nerd Font` must be installed on your system.
- **curl:** The `curl` command-line tool must be installed for fetching the weather.
- **Image:** The specified background image (`1357530.png`) must be present in the `/home/muffin/Downloads/` directory.
