

### 📄 `README.md` for `nix-dotfiles`

```markdown
# 🌸 nix-dotfiles

> A modular, visually cohesive NixOS dotfiles setup built around a soft-glass, dreamlike aesthetic inspired by **Lana Del Rey**.  
> Designed for **Hyprland** on **Wayland**, featuring seamless blur, pastel glow, custom audio visualization, and a curated user experience.

```
##  Directory Structure


```
nix-dotfiles/
├── modules/
│   ├── cava/           # Audio visualizer configuration
│   ├── drun/           # Rofi launcher (themed config.rasi)
│   ├── fastfetch/      # Terminal fetch w/ image preview (Lana.jpg)
│   ├── hyprland/
│   │   ├── hyprlock/   # Lock screen w/ blur and glow
│   │   ├── waybar/     # Optional hyprlock-specific waybar
│   │   ├── README.md
│   │   └── hyprland.conf
│   └── waybar/         # Main system-wide Waybar config
└── flake.nix (soon)

```

---

## 🎨 Theming

### Core Colors
| Name        | Hex       | Purpose            |
|-------------|-----------|--------------------|
| Pastel Pink | `#f2d5dc` | Accent / bars      |
| Dusty Rose  | `#d8a7b1` | Background tint    |
| Plum        | `#b08b9e` | Contrast text      |
| Deep Mauve  | `#7a4e65` | Highlights         |
| Nightshade  | `#2c1e2e` | Background / blur  |

### Fonts
- Primary: `Iosevka`, `JetBrains Mono`, or `Fira Code`
- Cursive overlay (optional): `Cedarville Cursive`, `EB Garamond`

---

##  Screenshots


<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/f0b6679f-3a68-46e6-b0e8-0bf68c14c5a3" />


###Desktop Overview

![desktop](screenshots/desktop-overview.png)

- Waybar: pill layout with rounded modules, blurred background
- Fastfetch: soft overlay with Lana image
- Cava: pink spectrum visualizer
- Wallpaper: blurred, atmospheric photography

---

##  Modules Overview

###  `cava/`
- Pastel-pink audio visualizer
- Rounded bar config
- Integrated with Waybar layout

###  `drun/`
- Custom `config.rasi` for Rofi
- Glass-style launcher with elegant font
- Glow effect via Hyprland

###  `fastfetch/`
- Fastfetch with:
  - Terminal info
  - Image preview (`lana.jpg`)
  - Matching border radius and shadow

###  `waybar/`
- Custom style with:
  - Pills, blur, hover effects
  - Battery, network, date, workspace modules
- Reused in lockscreen and normal bar

###  `hyprland/`
- `hyprland.conf` includes:
  - Window blur
  - Rounded corners
  - Drop shadows
  - Keybinds and workspace tweaks

###  `hyprlock/`
- Semi-transparent lock screen with:
  - User profile icon
  - Time, weather, battery, and greeting
  - Blur layer behind lock

---

##  Setup

### Dependencies

| Tool        | Purpose        |
|-------------|----------------|
| Hyprland    | WM             |
| Waybar      | Bar/dock       |
| Cava        | Audio viz      |
| Fastfetch   | System info    |
| Kitty       | Terminal       |
| Spotifyd    | Music backend  |
| Spicetify   | Spotify theming|

---

### Installation

> You can either **copy the modules manually** or **use Home Manager / flakes**:

#### Manual
```bash
# Clone the repo
git clone https://github.com/you/nix-dotfiles ~/.config/nix-dotfiles

# Symlink or copy each config manually
ln -s ~/.config/nix-dotfiles/modules/waybar ~/.config/waybar
````

#### With Flakes(sooon) 

1. Add the dotfiles as an input in `flake.nix`
2. Import `modules/*` into `home-manager.users.<name>.programs`



---

##  Customization

* 💾 Change background images → place your own `lana.jpg` in `fastfetch/`
* 🎵 Spotify now-playing module → customize with Spicetify or `playerctl`
* 🌤 Weather on lockscreen → requires custom script (can be added)
* 🎨 Theme tweaks → edit `style.css` in any module
* 🗒 Obsidian workflow → sync with your personal dashboard via `works.md`

---

## 📋 TODO / Roadmap

* [ ] Convert to full `home-manager` modules
* [ ] Make modules toggleable via flake options
* [ ] Add animated transitions via `waybar` CSS
* [ ] Optional `stylix` theme export
* [ ] More color palettes: `ethereal blue`, `digital twilight`

---







