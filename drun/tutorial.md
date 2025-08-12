
# My Rofi Configuration

This is a custom Rofi configuration that provides a clean, grid-based application launcher with a dark color scheme. The configuration is broken down into a main settings block and a custom theme.

## Configuration Block

The `configuration` block sets up the core behavior of Rofi.

* **`modi`**: This is set to `drun`, which stands for "desktop run." This mode uses `.desktop` files to list and launch installed applications, making it a powerful application launcher.
* **`font`**: The font is set to "Rubik 10," giving a clean, modern look to the text.
* **`show-icons`**: This is set to `true`, so Rofi will display application icons next to their names.
* **`icon-theme`**: Rofi uses the "Reversal-dark" icon theme to match the overall dark aesthetic.
* **`display-drun`**: This is an empty string, which removes the "drun" label that would normally appear at the top of the window, creating a cleaner interface.
* **`drun-display-format`**: This is set to `{name}`, so only the application's name will be shown, not its full `.desktop` file path.
* **`sidebar-mode`**: This is set to `false`, disabling the sidebar that would normally show a list of available modes (like `run` or `drun`).

## Custom Theme

This section defines the colors and layout for the Rofi window, creating a custom theme from scratch.

* **`@theme "/dev/null"`**: This line tells Rofi to ignore any default theme files and start with a completely blank canvas.

### Colors

A set of color variables are defined for easy reuse throughout the theme.

* `bg`: The main background color, a dark gray.
* `fg`: The main foreground (text) color, a light cream.
* `accent`: A subtle accent color, a muted green. This isn't currently used in the theme, but it's available for later customization.
* `button`: A slightly lighter dark gray used for the input bar and selected elements.

### Window

The `window` block defines the main Rofi window's appearance.

* **`border-radius`**: A value of `7px` gives the window slightly rounded corners.
* **`width`**: The window is set to `50%` of the screen's width.
* **`padding`**: The internal padding is set to `32px` to give the elements a lot of breathing room.

### Input Bar

The `inputbar` contains the search prompt and entry field.

* **`children`**: This specifies the layout of the input bar, with the `prompt` on the left and the `entry` field on the right.
* **`border-radius`**: A value of `6px` gives the input bar rounded corners.
* **`padding`**: A value of `10px` adds internal padding around the prompt and entry field.

### Prompt and Entry

The `prompt` is the text that appears before the cursor (e.g., a search icon). The `entry` is the actual text field.

* **`placeholder`**: The text "Search" is displayed when the entry field is empty.
* **`padding`**: The padding is adjusted to align the prompt and entry fields correctly within the input bar.

### List View

The `listview` is where the search results are displayed.

* **`columns`**: The results are shown in a grid with `4` columns.
* **`lines`**: Only `3` lines (rows) of results are displayed at a time, keeping the window compact.
* **`dynamic`**: Set to `true`, which means the number of lines can change dynamically based on the number of search results.
* **`layout`**: The results are laid out `vertical` within the grid.

### Elements

The `element` block controls the appearance of each individual item (the application icon and name) in the list view.

* **`orientation`**: Each element is laid out `vertical`, with the icon on top and the text below.
* **`padding`**: Adds internal spacing to each element.

### Element Icons and Text

These blocks control the styling of the application icons and names.

* **`element-icon`**: The icon size is set to `48px`. `horizontal-align: 0.5` centers the icon.
* **`element-text`**: The text is centered both horizontally and vertically, with a small margin for spacing.
* **`element selected`**: This block applies styling to the currently highlighted item, changing its background color to the `@button` color and adding `6px` of border radius.
```
