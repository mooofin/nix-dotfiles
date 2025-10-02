### A Guide to Customizing Fastfetch



<img width="704" height="408" alt="screenshot-1759388263" src="https://github.com/user-attachments/assets/fc396ae8-3fd5-49e7-b6dd-111cbe54a1dd" />







Tired of the same old terminal? Want to add a personal touch that showcases your setup? Fastfetch is a command-line tool that displays system information in a fast and beautiful way, and with a simple configuration file, you can transform your terminal into a personalized work of art.

This guide will walk you through how to configure Fastfetch, using a real-world example to show you just how easy it is to customize.

-----

### Understanding the Fastfetch Configuration

The heart of Fastfetch's customization is its `config.jsonc` file, typically found in `~/.config/fastfetch/`. This file is where you define every aspect of your Fastfetch output, from the logo to the system information displayed.

Let's break down an example configuration to see what each section does.

```json

{
    "logo": {
        "source": "/home/muffin/Downloads/lana.gif",
        "type": "kitty-icat",
        "height": 10,
        "width": 20,
        "padding": {
            "top": 2
        }
    },
    "modules": [
        "break",
        {
            "type": "title",
            "keyWidth": 10
        },
        "break",
        {
            "type": "os",
            "key": " ",
            "keyColor": "34"
        },
        // ... (other modules)
    ]
}
```

#### The `logo` Section

This is where the magic happens. The `logo` block defines the image or ASCII art that appears next to your system information.

  * `source`: The absolute path to your image file. Fastfetch can handle a variety of formats, including PNGs, JPGs, and even GIFs\!
  * `type`: This specifies the terminal image protocol. `kitty-icat` is an excellent choice for terminals like Kitty that support high-quality image rendering.
  * `height` & `width`: These values control the size of your image in terminal "character cells." Experiment with these to get the perfect fit.
  * `padding`: Adds space around the logo. In this example, `padding.top` is used to align the logo with the first line of text.

#### The `modules` Array

The `modules` array is a list of all the system information you want to display. Each item in the array is a module.

  * `"break"`: A simple but powerful module that inserts a new line, perfect for spacing out your information.
  * `"title"`: This displays your user and hostname, like `muffin@Hyprland`.
  * `"os"`, `"shell"`, `"terminal"`, `"wm"`: These are just a few examples of the many built-in modules. They automatically fetch and display details about your operating system, shell, terminal emulator, and window manager.
  * `"key"`: The text or icon that appears before the module's output. The icons you see (``, ``) are from **Nerd Fonts**. To display these correctly, you must have a Nerd Font installed and enabled in your terminal.
  * `"keyColor"`: Sets the color of the key/icon using a simple ANSI color code.

-----

### Step-by-Step Customization Guide

Ready to make it your own? Follow these steps.

1.  **Find or Create the Configuration File:** If you don't have one, create a file at `~/.config/fastfetch/config.jsonc` and paste the example configuration above as a starting point.

2.  **Change the Logo:**

      * Replace the `source` path with the path to your desired image or GIF. You can also use `type: "chafa"` for a terminal-based ASCII art logo.
      * Adjust the `height` and `width` to your liking.

3.  **Add or Remove Modules:**

      * To add a new module, simply add a new object to the `modules` array. For example, to add CPU and memory information, you would add:
        ```json
        {
            "type": "cpu",
            "key": " ",
            "keyColor": "34"
        },
        {
            "type": "memory",
            "key": "orie",
            "keyColor": "34"
        }
        ```
      * To see a full list of available modules, run `fastfetch --help`.
      * To remove a module, just delete its block from the `modules` array.

4.  **Change Icons and Colors:**

      * Find new icons at a site like [Nerd Fonts](https://www.nerdfonts.com/cheat-sheet). Copy the icon and paste it into the `"key"` field.
      * Change the `"keyColor"` to a different ANSI code or a hex color code if your terminal supports it.

5.  **Save and Run:** Save the `config.jsonc` file. The next time you run `fastfetch` in your terminal, your new configuration will be applied automatically\!

-----

### The Final Word

Fastfetch is a powerful yet easy-to-use tool for personalizing your terminal. By understanding the basic structure of its configuration file, you can create a unique and visually appealing setup that is truly your own. Don't be afraid to experiment with different images, modules, and colors—your ideal terminal is just a few keystrokes away.
