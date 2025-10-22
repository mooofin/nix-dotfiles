### A Guide to Customizing Fastfetch



<img width="704" height="408" alt="screenshot-1759388263" src="https://github.com/user-attachments/assets/fc396ae8-3fd5-49e7-b6dd-111cbe54a1dd" />


# 🌸 Fastfetch Hyprland Aesthetic Config Tutorial



Fastfetch is a modern replacement for Neofetch — it’s **faster**, **more customizable**, and uses **JSON configs**.
This tutorial shows how to build and personalize your own **Hyprland-themed Fastfetch**, like the config you shared.

---

##  Step 1: Install Fastfetch

On **NixOS**:

```bash
nix-env -iA nixos.fastfetch
```

or add it to your `home.packages` in Home Manager:

```nix
home.packages = [ pkgs.fastfetch ];
```

---

##  Step 2: Create Config Directory

Fastfetch reads from `~/.config/fastfetch/config.jsonc`.

Create it:

```bash
mkdir -p ~/.config/fastfetch
```

Copy your config file there:

```bash
nano ~/.config/fastfetch/config.jsonc
```

Paste your config (the one you posted).

---

##  Step 3: Understand the Config

We’ll go section by section.

###  1. **Schema and Header**

```jsonc
"$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json"
```

This line just provides **autocompletion** and **validation** if you use an editor like VS Code.

---

### 2. **Logo Settings**

```jsonc
"logo": {
  "source": "~/.local/share/fastfetch/images/hypr.png",
  "type": "kitty",
  "height": 18,
  "padding": { "top": 2 }
},
```

 **What it does:**

* Displays an **image logo** (PNG) using **Kitty’s graphics protocol**.
* You can use **any image**:

  ```bash
  mkdir -p ~/.local/share/fastfetch/images
  cp your-image.png ~/.local/share/fastfetch/images/hypr.png
  ```
* Change `height` to scale it.
* Adjust `padding.top` to control vertical spacing.

 Tip: Works only in **Kitty**, **WezTerm**, or **foot** terminals that support inline images.

---

###  3. **Display Settings**

```jsonc
"display": {
  "separator": " "
}
```

* Controls spacing between **keys** and **values** in output.
* You can change it to `:` or `→` or anything aesthetic.

---

###  4. **Modules**

This is where the **main info** appears. It’s an **array** that runs in order.

You can insert:

* `"break"` to add line breaks
* **modules** with `type`
* **custom** sections for colors or text

####  Color Line

```jsonc
{
  "type": "custom",
  "format": "\u001b[90m  \u001b[31m  \u001b[32m  \u001b[33m  \u001b[34m  \u001b[35m  \u001b[36m  \u001b[37m"
}
```

This prints little colored circles like a **palette divider**.
You can change colors or symbols (e.g. ``, ``).

####  System Info Modules

Each block looks like:

```jsonc
{
  "type": "os",
  "key": " ",
  "keyColor": "34"
},
```

Breakdown:

* `type`: Which info to display (`os`, `kernel`, `shell`, `packages`, etc.)
* `key`: Icon or text label before the value
* `keyColor`: ANSI color code (34 = blue)

 **Color codes:**

| Code | Color   |
| ---- | ------- |
| 31   | Red     |
| 32   | Green   |
| 33   | Yellow  |
| 34   | Blue    |
| 35   | Magenta |
| 36   | Cyan    |
| 37   | White   |
| 90   | Gray    |

You can make your own palette by changing `keyColor`.

---

####  Example Modules Explained:

```jsonc
{
  "type": "packages",
  "format": "{} (Nixpkg)",
  "key": " ",
  "keyColor": "34"
}
```

 Shows package count, adds custom text “(Nixpkg)”.

```jsonc
{
  "type": "datetime",
  "format": "{1}-{3}-{11}",
  "key": " ",
  "keyColor": "34"
}
```

 Shows date/time using placeholders:

* `{1}` = Year
* `{3}` = Day
* `{11}` = Time (HH:MM)

You can modify to:

```jsonc
"format": "{3}/{2}/{1} {11}"
```

```jsonc
{
  "type": "media",
  "key": "󰝚 ",
  "keyColor": "34"
},
{
  "type": "player",
  "key": " ",
  "keyColor": "34"
}
```

 Shows current **media info** and **player** (Spotify, mpv, etc.)

---

#### Extra Dividers

You used multiple `"break"` and color lines to give breathing room.
That’s good for **aesthetic balance**.

You can add custom text:

```jsonc
{
  "type": "custom",
  "format": "\u001b[35m~ crafted by Bina ~"
}
```

---

##  Step 4: Run and Test

Run Fastfetch:

```bash
fastfetch
```

If you want to always see this when opening a terminal, add to your shell rc:

For **bash**:

```bash
echo "fastfetch" >> ~/.bashrc
```

For **zsh**:

```bash
echo "fastfetch" >> ~/.zshrc
```

---

##  Step 5: Customization Ideas

 Try these:

* Change **logo**: use `type: ascii` with an ASCII Hyprland logo if your terminal doesn’t support images.
* Add **GPU**, **CPU**, **Memory**, **Battery** modules:

```jsonc
{ "type": "cpu", "key": " ", "keyColor": "34" },
{ "type": "gpu", "key": "󰍛 ", "keyColor": "34" },
{ "type": "memory", "key": " ", "keyColor": "34" },
{ "type": "battery", "key": " ", "keyColor": "34" }
```

* Change colors to match your **Hyprland theme** (pastel pinks, muted blues, dreamy vibes).
* Add **custom text** like:

```jsonc
{
  "type": "custom",
  "format": "\u001b[35mA black-magic-practicing NixOS witch 🧙"
}
```

---

##  Final Touch

You can keep iterating:

* Match the **colors** to your **Hyprland wallpaper**.
* Use **soft pink, violet, cyan** for a dreamy, glassy look.
* Add quotes or taglines like:

```jsonc
{ "type": "custom", "format": "\u001b[36m“I fucking love NixOS.”" }
```

---

