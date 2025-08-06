### README: My Waybar Configuration

This document provides a comprehensive breakdown of my Waybar configuration, which is a key component of my Hyprland desktop environment. The configuration is designed to be highly functional, minimalist, and visually cohesive with a "glassy" theme, making it easy for you to understand and modify.

-----

### Key Features

  - **Pill-based Layout**: The design uses a unique "pill" style, where modules are grouped into independent, rounded blocks. This creates a clean, segmented appearance that reduces visual clutter.
  - **Minimalist Aesthetic**: The bar is positioned at the bottom of the screen with a semi-transparent background. It features generous padding and rounded corners, seamlessly integrating with the Hyprland desktop's overall theme.
  - **Nerd Font Integration**: The configuration relies on Nerd Fonts to provide a wide array of icons for visually representing system information, from CPU usage to network status.
  - **Extensive Customization**: Almost every aspect of the bar—from module order to icon colors and hover effects—is customizable through the `config` and `style.css` files.

-----

### Configuration Breakdown

The configuration is split into two main files: `config` (for module logic and layout) and `style.css` (for visual appearance).

#### `config` file

This file defines the layout, behavior, and specific settings for each module.

  - **Global Settings**:
      - `"layer": "top"`: Positions the bar above other windows, preventing them from overlapping it.
      - `"position": "bottom"`: Places the bar at the bottom of the screen.
      - `"mode": "dock"`: Sets the bar to act like a dock, reserving space on the screen.
      - `"height": 32`: Defines the height of the bar.
  - **Layout**:
      - `modules-left`, `modules-center`, `modules-right`: These arrays determine which modules are loaded and where they are placed. This configuration uses a "pill" layout with multiple groups.
  - **Module Customization**: Each module block contains specific settings:
      - `hyprland/workspaces`: Displays the active workspaces. You can switch workspaces by scrolling up or down on the module (`on-scroll-up` & `on-scroll-down`) or activate a workspace by clicking on it (`on-click`).
      - `hyprland/window`: Shows the title of the active window, truncated to a `max-length` of 50 characters.
      - `pulseaudio`: Displays the volume percentage and an icon. It has custom formats for Bluetooth devices (`format-bluetooth`) and muted states (`format-muted`), and clicking on it launches `pavucontrol`.
      - `network`: Uses different formats for Wi-Fi (`format-wifi`) and Ethernet (`format-ethernet`) connections, displaying details like signal strength and IP address.
      - `cpu` & `memory`: Show usage percentage with a custom Nerd Font icon (`` and `` respectively).
      - `clock`: Displays the time (`format`) and a calendar tooltip (`tooltip-format`) when you hover over the clock.
      - `battery`: Defines different icon states for `warning` (30%) and `critical` (15%) battery levels, as well as separate formats for charging and plugged-in states.
      - `custom/media`: This module runs a script (`mediaplayer.py`) to get information about what is currently playing, displaying the player name and track details.

#### `style.css` file

This file dictates the visual styling of every element in the bar.

  - `*` selector: Sets the global font (`JetBrainsMono Nerd Font` and `Font Awesome 6 Free`), font size (`13px`), and a default text color.
  - `window#waybar`: The overall bar has a slightly transparent background (`background: rgba(31,33,48,0.8)`) and a large `12px` border radius.
  - **Pill Groups**: `#group-pills` and related selectors ensure the module groups have a transparent background and no padding, creating a cohesive block.
  - **Pill Buttons (`#workspaces button`)**: The buttons for workspaces have a unique styling for active, inactive, and hover states, giving them a distinct "pill" button look.
  - **Pill Modules (`#clock`, `#memory`, etc.)**: Each module block has its own background color (`background-color: rgba(31,33,48,0.6)`), which is slightly more transparent than the main bar, and a `16px` border radius.

-----

### How to Customize with Examples

#### 1\. Change the Color Palette

To change the color palette, you need to edit the `style.css` file. Here are some examples of what you can modify:

  - **Main Bar Background**: Change the `background` in `window#waybar`. The last number in `rgba()` controls transparency.
    ```css
    /* Original */
    window#waybar {
      background: rgba(31,33,48,0.8);
      /* ... */
    }

    /* Example: A dark gray with full opacity */
    window#waybar {
      background: #282a36;
      /* ... */
    }
    ```
  - **Workspaces Button Colors**: Modify the colors for `button`, `button.active`, and `button:hover`.
    ```css
    /* Example: Catppuccin Macchiato colors */
    #workspaces button {
      background-color: rgba(244,219,255,0.08); /* Lavender */
      color: rgba(239,235,255,0.8);
    }
    #workspaces button.active {
      background-color: rgba(147,208,230,0.4); /* Sky */
      color: rgba(244,219,255,1);
    }
    #workspaces button:hover {
      background-color: rgba(186,197,224,0.4); /* White */
    }
    ```
  - **Module Hover Effects**: To change the color on hover for modules, edit the `rgba` value in the `:hover` selectors.
    ```css
    /* Original */
    #clock:hover, #network:hover, #pulseaudio:hover, #battery:hover {
      background-color: rgba(75,81,125,0.4);
    }

    /* Example: A reddish hover effect */
    #clock:hover, #network:hover, #pulseaudio:hover, #battery:hover {
      background-color: rgba(237,135,150,0.4); /* Rosewater */
    }
    ```

#### 2\. Change Icons and Fonts

  - **Font Family**: In `style.css`, modify the `font-family` property in the `*` selector.
    ```css
    /* Original */
    * {
      font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free";
      /* ... */
    }

    /* Example: Using a different font */
    * {
      font-family: "Iosevka Nerd Font", "Font Awesome 6 Free";
      /* ... */
    }
    ```
  - **Nerd Font Icons**: To change an icon for a module, you need to replace the character in the `format` or `format-icons` section of the `config` file.
      - **Example: Change the Clock Icon**
        ```json
        
        "clock": {
            "format": "{:%H:%M}  ",
            
        }

        
        "clock": {
            "format": "{:%H:%M}  ", 
            
        }
        ```
      - **Example: Change the CPU Icon**
        ```json
        
        "cpu": {
            "format": "{usage}% ",
            
        }

       
        "cpu": {
            "format": "{usage}% ", 
            
        }
        ```

#### 3\. Adjust Layout and Spacing

  - **Module Order**: In the `config` file, you can easily reorder modules within their arrays.
      - **Example: Move the clock to the left side**
        ```json
        
        "modules-left": [ "hyprland/workspaces", "clock" ],
        "modules-right": [ "idle_inhibitor", "network", "cpu", "memory", "temperature", "backlight", "battery", "tray" ],
        ```
  - **Margins & Padding**: In `style.css`, adjust the `margin` and `padding` values to control the spacing.
      - `margin`: Adds space outside the modules.
      - `padding`: Adds space inside the modules.
    <!-- end list -->
    ```css
    /* Example: Increase padding for modules */
    #clock, #memory, #cpu, #network, #pulseaudio, #pulseaudio.microphone, #backlight, #battery, #tray, #idle_inhibitor, #hyprland-window {
      /* Original */
      padding: 4px 12px;

      /* Modified to be larger */
      padding: 8px 16px;
    }
    ```

-----

### Installation & Customization Workflow

1.  **Clone the Repository**: Start by cloning your dotfiles repository.
2.  **Create Symlinks**: Create symbolic links for the `config` and `style.css` files to the correct location: `~/.config/waybar/`.
3.  **Install Dependencies**: Make sure you have all the necessary packages installed, including Waybar, Hyprland, and the specific fonts and tools used (e.g., Nerd Fonts, `pavucontrol`, `playerctl`).
4.  **Edit and Reload**: After making any changes to the `config` or `style.css` file, save the file. Waybar is configured to reload its styles automatically (`reload_style_on_change: true`), but you might need to manually restart it for some changes to take effect.
