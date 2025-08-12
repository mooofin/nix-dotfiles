# My Rofi Configuration (README Template)

This document serves as a comprehensive guide to my Rofi configuration. It's designed for users who want to not only copy my settings but also understand the function of each component, enabling them to confidently customize the setup to their liking.
credits - Aditya Shakya : 3
-----

## Core Configuration (`config.rasi`)

The `config.rasi` file is the heart of my Rofi setup. It dictates the program's fundamental behavior and functionality, ensuring it operates as a powerful and efficient application launcher. This file is where you define how Rofi interacts with your system and the data it presents.

  - **`modi`**: This is set to `"drun"`, which stands for "desktop run." This mode is the most common for application launching as it uses the `.desktop` files from your system to create an easy-to-navigate list of all your installed software. These `.desktop` files are a standard way for Linux to recognize and launch applications, making this mode a universal and robust choice for an application launcher. This is crucial for anyone who wants to use Rofi as a primary tool for starting programs.
  - **`font`**: The font is set to `"Rubik 10"`, providing a clean, modern, and easily readable typeface. You're encouraged to replace this with any font family you have installed on your system. A great way to find the perfect font is by using a font viewer or by simply experimenting. The number `10` refers to the font size in points, which you can also adjust to your preference.
  - **`show-icons`**: Set to `true`, this is a key visual setting. It ensures that application icons are displayed next to their names in the list. This not only makes the launcher more visually appealing but also significantly speeds up the process of finding a specific application, as our brains often recognize images faster than text.
  - **`icon-theme`**: Set to `"Reversal-dark"`. Rofi integrates with your system's icon themes. You can change this to match your desktop environment's current icon theme, such as "Papirus," "Adwaita," or "Tela," for a seamless look. The name you specify here must exactly match the name of the icon theme folder located in your system's icon directories (e.g., `/usr/share/icons`).
  - **`drun-display-format`**: Set to `"{name}"`, this is a great setting for keeping the interface clutter-free. It tells Rofi to only display the application's name, rather than showing a longer, more technical path or description, which is often unnecessary for quick launching. Other available placeholders include `{comment}`, `{exec}`, and `{icon}` for more detailed displays.

-----

## Custom Theme

This section of the configuration is all about aesthetics. It's built from the ground up to define the colors, spacing, and layout, offering a personalized and visually pleasing user experience. The file uses the `@theme "/dev/null"` directive to ignore all default themes and build a completely custom one.

  - **Color Variables**: At the very beginning of the theme, you'll find a few variables that make it simple to change the color scheme.
      - `bg`: The primary **background color**, used for the window's main area.
      - `fg`: The primary **foreground color**, used for text throughout the launcher.
      - `button`: A slightly different color used for the **input bar and selected items**, helping them stand out from the main background.
      - `accent`: An additional color variable that isn't currently used but is included for future customizations or for those who want to add an extra splash of color to their theme.
  - **Window**: The `window` block defines the main Rofi pop-up box. I've set the `width` to `50%` of the screen and added a generous `padding` of `32px` to give the contents plenty of breathing room. The `border-radius` of `7px` gives the window a modern, soft-edged look. These settings work together to create a launcher that feels both spacious and integrated into the desktop.
  - **Input Bar**: The `inputbar` is the horizontal bar at the top where you type your search query. It's composed of two children: the `prompt` (the label to the left of the cursor) and the `entry` (the text field itself). The `border-radius` of `6px` and `padding` of `10px` give it a distinct, well-defined appearance that sets it apart from the rest of the window.
  - **List View**: The `listview` block controls how the search results are displayed. I've set `columns` to `4` and `lines` to `3` to create a compact, grid-based layout that minimizes vertical space and looks great with application icons. The `dynamic` property is set to `true` to allow the number of lines to adjust if there are fewer than three results.
  - **Elements**: Each individual item in the list is an `element`. I've customized the `element` to have a `vertical` orientation, placing the icon above the text. The `element selected` block is a special part of the theme that applies unique styling to the currently highlighted item, making it easy to see which application you're about to launch. This is where you can define how the highlighted item's background and text color change.

-----

## Getting Started and Customizing

Ready to make this configuration your own? Follow these simple steps.

### 1\. Locate the Files

All Rofi's configuration and themes are stored in your home directory, in a hidden folder named `.config/rofi/`. The `~` symbol is a shortcut for your home directory (e.g., `/home/username/`).

```bash
~/.config/rofi/
```

### 2\. Edit with Your Favorite Editor

You can open the main configuration file with any text editor. A common choice is a simple terminal editor like `nano` or a graphical editor like VS Code or Sublime Text.

```bash
# Using nano, a simple terminal editor
nano ~/.config/rofi/config.rasi
```

### 3\. Change What You Want\!

Feel free to experiment\! This is where you can change the look and feel to match your personal style. The syntax is simple: `property: value;`.

  - **Change the font**: In the `configuration` block, change `font: "Rubik 10";` to a font like `"Fira Code 12";`. The font name must be exactly as it's registered on your system.
  - **Change the colors**: Modify the color variables at the top of the theme. For example, to switch to a classic dark theme, you could change `bg: #151515;` to a darker hex code like `#222222;`.
  - **Change the layout**: In the `listview` block, you could change `columns: 4;` to `columns: 2;` to have a two-column list instead of a four-column grid.

### 4\. Reload the Configuration

After you save your changes, the new settings will take effect the next time you launch Rofi. You don't need to restart your computer or your shell. Just hit your Rofi keybind, and your new theme will be ready\!
