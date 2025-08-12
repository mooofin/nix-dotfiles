````markdown
# Rofi Configuration

This repository contains my personal configurations and themes for Rofi, a window switcher, run launcher, and dmenu replacement.

## Configuration Location

Rofi's configuration and custom themes are located in the following directory:

`${XDG_CONFIG_HOME}/rofi/`

On most systems, this path resolves to:

`~/.config/rofi/`

The primary configuration file is named `config.rasi`.

`~/.config/rofi/config.rasi`

## Creating a Configuration File

### Method 1: Start with an Empty Configuration

To create a new, empty configuration file, open `~/.config/rofi/config.rasi` in your favorite text editor and add the following block:

```rasi
configuration {

}
````

You can then add your desired options within this block.

### Method 2: Create a Configuration from Your Current Setup

If you want to start with a comprehensive configuration file that includes all possible settings and their current values, you can tell Rofi to dump its configuration:

```bash
rofi -dump-config > ~/.config/rofi/config.rasi
```

This will generate a file where default values are commented out. For example:

```rasi
configuration {               
/* modes: "window,run,ssh,drun";*/
/* font: "mono 12";*/
/* location: 0;*/
/* yoffset: 0;*/
/* xoffset: 0;*/
...
}
```

### Creating a Custom Theme File

To create a copy of your current Rofi theme, you can use the `-dump-theme` option:

```bash
rofi -dump-theme > ~/.config/rofi/current.rasi
```

## Configuration File Format

### Encoding

The configuration file uses **UTF-8** encoding. Both Unix (`\n`) and Windows (`\r\n`) newline formats are supported, but Unix format is preferred.

### Comments

The file supports both C and C++ style comments:

  * **Single-line comments**: Start with `//` and continue until the end of the line.
  * **Multi-line comments**: Enclosed between `/*` and `*/`.

Example:

```rasi
// This is a single-line comment.
property: /* This is a multi-line comment */ value;
```

### White Space

White space and newlines are ignored by the parser. This allows for flexible formatting.

```rasi
property: name;
```

is identical to:

```rasi
     property             :
name

;
```

### Data Types

Rofi's configuration supports several data types:

  * **String**: Always enclosed in double quotes (`"`).
    ```rasi
    ml-row-down: "ScrollDown";
    ```
  * **Number**: Any full number (integer).
    ```rasi
    eh: 2;
    ```
  * **Boolean**: `true` or `false` (case-sensitive).
    ```rasi
    show-icons: true;
    ```
  * **List**: A comma-separated list of entries enclosed in square brackets (`[]`).
    ```rasi
    combi-modes: [window,drun];
    ```

### Finding All Possible Options

You can get a list of all available options in two ways:

1.  **Dump the configuration file**: As described above, `rofi -dump-config` will list all options with their current values.
2.  **View help output**: Use `rofi -h` to see a list of command-line options, which often correspond to configuration file options.

For detailed information on what values an option supports, refer to the `rofi-theme(5)` and `rofi(1)` manpages.

### Splitting Configuration

You can split your configuration across multiple files using imports. In `~/.config/rofi/config.rasi`, you can use the `@import` and `@theme` directives.

```rasi
configuration {
}
@import "myConfig"
@theme "myTheme"
```

In this example, Rofi will first parse the `config` block, then include the settings from `~/.config/rofi/myConfig.rasi`, and finally load the specified theme. Imports can be nested.

```
```
