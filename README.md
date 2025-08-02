(quickshell when .. ) 

```markdown
# 🌸 nix-dotfiles

>cozy haven of seamless blurs, delicate pastel glows

```
##  Directory Structure

```
nix-dotfiles/
├── modules/
│   ├── btcup/          
│   ├── cava/          
│   ├── drun/           
│   ├── fastfetch/     
│   ├── fish/           
│   ├── hyprland/       
│   │   ├── hyprlock/   
│   │   ├── waybar/     
│   │   ├── README.md   
│   │   └── hyprland.conf 
│   ├── kitty/          
│   ├── waybar/        
│   └── waypaper/      
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



<img width="3277" height="763" alt="screenshot-1753628591" src="https://github.com/user-attachments/assets/d0a7f333-db2c-41e9-bd32-258010c3de77" />



<img width="3286" height="768" alt="screenshot-1753957106" src="https://github.com/user-attachments/assets/5094cf63-4235-4ba9-a04b-a61fae8a9e87" />

<img width="1920" height="1080" alt="screenshot-1754141258" src="https://github.com/user-attachments/assets/82ef15be-5e14-4a71-9c8d-d9c14d5e4c69" />

<img width="1881" height="1031" alt="screenshot-1754141547" src="https://github.com/user-attachments/assets/76ab956d-eaad-4ece-b4f8-c1b1d675d239" />



<img width="1881" height="1005" alt="screenshot-1753964934" src="https://github.com/user-attachments/assets/cf6e906e-f288-4131-99c0-a1aae7b79328" />


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







