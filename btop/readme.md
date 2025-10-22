### README: My Btop Configuration

This document serves as a guide to my personal `btop` configuration file, designed for both new users to understand and for me to remember my customizations. Btop is a resource monitor that provides a detailed overview of system performance, and this configuration tailors its appearance and functionality to my specific preferences.

#### My Purpose & Philosophy

My goal is to have a Btop setup that is both aesthetically pleasing and highly functional. This configuration prioritizes the following:

- **Clean Aesthetic:** The theme is set to `lana`, a custom theme that complements my overall desktop environment.
- **High Information Density:** All the essential boxes—CPU, memory, network, and processes—are shown at all times.
- **Readability:** I've enabled features that make the data easier to read and parse, such as rounded corners, clear graphs, and a readable font size.
- **Productivity:** The configuration is designed to give me a quick, at-a-glance view of system health without unnecessary clutter.

#### How to Understand and Modify This Configuration

The configuration file is well-commented by default, but here is a breakdown of the key settings I've customized to help you understand and modify it.

##### **1. Theming and Appearance**

-   `color_theme = "lana"`: This is the name of my custom theme. To use your own, you would change this value to the name of a `.theme` file located in `~/.config/btop/themes/`.
-   `theme_background = False`: This is important for transparency. Setting this to `False` allows the terminal's background to show through, creating a more integrated look.
-   `truecolor = True`: Ensures Btop uses the full range of 24-bit colors, which is necessary for modern themes and gradients.
-   `rounded_corners = True`: Adds a subtle, modern touch to the boxes by giving them rounded edges.

##### **2. Layout and Information Display**

-   `presets = "..."`: This is a powerful setting that defines different layouts. My primary layout shows the CPU, memory, and network graphs at the top, with the process list below. The multiple presets allow me to quickly switch layouts for different use cases.
-   `shown_boxes = "cpu mem net proc"`: Explicitly lists the main boxes I want to see at all times. You can add "gpu0" through "gpu5" if you have a graphics card and want to monitor it.
-   `update_ms = 2000`: Sets the update interval to 2 seconds. This is a good balance between a responsive display and not taxing the CPU with constant updates.

##### **3. Process Management and Details**

-   `proc_sorting = "cpu lazy"`: This sets the default sorting for the process list. "CPU lazy" is an excellent option as it sorts processes by CPU usage over time, making it easier to track the most resource-intensive applications without the list constantly jumping around.
-   `proc_mem_bytes = True`: I prefer to see memory usage in bytes (e.g., 512 MiB) rather than as a percentage, as it gives a more precise view of resource consumption.
-   `proc_tree = False`: I've chosen not to show processes as a tree to keep the list clean and easy to read.

##### **4. Customizing Graphs and Widgets**

-   `graph_symbol = "braille"`: I've set the default graph symbol to "braille" for its high resolution, which provides a more detailed view of historical data.
-   `clock_format = "%X"`: This displays the current time in the top right corner of the terminal. You can change the format using `strftime` codes.

Feel free to use this configuration as a starting point. Simply copy the contents into your `btop.conf` file, and then modify the values to suit your own needs and preferences.
