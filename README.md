# My Arch dotfiles

## MangoWM
> [MangoWM](https://github.com/mangowm/mango) is as lightweight as dwl and can be built completely within a few seconds. Despite this, Mango does not compromise on functionality.

## Niri
> [Niri](https://github.com/YaLTeR/niri) is a scrollable-tiling Wayland compositor written in Rust. It offers a unique approach to window management compared to traditional tiling compositors.

## Hyprland
> [Hyprland](https://github.com/hyprwm/Hyprland) is an independent, highly customizable, dynamic tiling Wayland compositor without sacrificing its looks.

## DriftWM
> [DriftWM](https://github.com/malbiruk/driftwm) is a trackpad-first infinite canvas Wayland compositor.

Curious about what it looks like? Here's a glimpse.

## Screenshots

| **Desktop & Status Bar** |
|:---:|
| ![Desktop](Screenshots/waybar.png) |

| **App launcher** |
|:---:|
| ![Rofi](Screenshots/rofi.png) |

| **Clipboard manager** |
|:---:|
| ![clipboard](Screenshots/clipboard.png) |

| **Power menu** |
|:---:|
| ![Wlogout](Screenshots/wlogout.png) |

| **Screenlock** |
|:---:|
| ![Main](Screenshots/hyprlock.png) |

## Components

List of all applications and tools used in this setup.

| **Category** | **Application** | **Description** |
|:---:|:---|:---|
| **Window Manager** | [MangoWM](https://github.com/mangowm/mango) | Practical and powerful Wayland compositor (dwm but Wayland) |
| | [Niri](https://github.com/niri-wm/niri) | A scrollable-tiling Wayland compositor. |
| | [Hyprland](https://github.com/hyprwm/Hyprland) | Highly customizable dynamic tiling Wayland compositor. |
| | [DriftWM](https://github.com/malbiruk/driftwm) | A trackpad-first infinite canvas Wayland compositor. |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) | Highly customizable modular status bar. |
| **Wallpaper Manager** | [swaybg](https://github.com/swaywm/swaybg) | Wallpaper tool for Wayland compositors. |
| **Terminal** | [Kitty](https://github.com/kovidgoyal/kitty) | Fast, feature-rich, GPU-based terminal emulator. |
| | [Alacritty](https://github.com/alacritty/alacritty) | GPU-accelerated terminal emulator. |
| **Shell** | [Fish](https://fishshell.com/) | User-friendly command line shell. |
| **Prompt** | [Starship](https://starship.rs/) | Minimal, fast, customizable shell prompt. |
| **Editor** | [Neovim](https://neovim.io/) | Powered by [NvChad](https://nvchad.com) v2.5. |
| **Launcher** | [Rofi](https://github.com/davatorium/rofi) | Window switcher, application launcher, and dmenu replacement. |
| **System Monitor** | [Btop](https://github.com/aristocratos/btop) | A monitor of resources. |
| **File Manager** | [Yazi](https://github.com/sxyazi/yazi) | Blazing-fast terminal file manager written in Rust. |
| **Notifications** | [Mako](https://github.com/emersion/mako) | Lightweight notification daemon. |
| **Lock Screen** | [Hyprlock](https://github.com/hyprwm/hyprlock/) | Hyprland's GPU-accelerated screen locking utility. |
| **Logout Menu** | [Wlogout](https://github.com/ArtsyMacaw/wlogout) | Wayland-based logout menu. |
| **Media Player** | [MPV](https://mpv.io/) | Video player with `modernz` script. |
| **Git Client** | [Lazygit](https://github.com/jesseduffield/lazygit) | Simple terminal UI for git commands. |
| **Multiplexer** | [Tmux](https://github.com/tmux/tmux) | Terminal multiplexer. |
| **Screenshot** | [Swappy](https://github.com/jtheoof/swappy) | Wayland snapshot and editor tool. |
| **Audio Visualizer** | [Cava](https://github.com/karlstav/cava) | Console-based audio visualizer. |

## Essential Keybindings

> These keybindings are consistent across all listed Wayland compositors. Check each compositor's config file for the full list.

| **Key Combination** | **Action** |
|:---|:---|
| <kbd>Super</kbd> + <kbd>T</kbd> | Open Terminal (`Kitty`) |
| <kbd>Super</kbd> + <kbd>Space</kbd> | Open App Launcher (`Rofi`) |
| <kbd>Super</kbd> + <kbd>Q</kbd> | Quit focused window |
| <kbd>Super</kbd> + <kbd>B</kbd> | Open Browser (`Librewolf`) |
| <kbd>Super</kbd> + <kbd>N</kbd> | Open File Manager (`Yazi`) |
| <kbd>Super</kbd> + <kbd>P</kbd> | Power Menu (`Wlogout`) |
| <kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>E</kbd> | Exit Wayland compositor |

## Installation

### Prerequisites
- Arch Linux or an Arch-based distro (e.g. EndeavourOS, Manjaro)
- A Wayland session (X11 is not supported)
- AUR helper recommended for AUR packages (e.g. `yay` or `paru`)

### 1. Install Required Packages

```bash
sudo pacman -S niri waybar kitty alacritty fish starship neovim btop \
  yazi rofi mako hyprlock wlogout mpv cava swappy swaybg tmux lazygit
```

> **Note:** `hyprland`, `mangowm`, and `driftwm` may need to be installed via the AUR:
> ```bash
> yay -S hyprland-git mangowm driftwm
> ```

### 2. Clone Repository

```bash
git clone https://github.com/BlackSparkz/dotfiles.git
cd dotfiles
```

### 3. Deploy Configs

**Option A — Using `stow` (recommended):**
```bash
sudo pacman -S stow
cd dotfiles
stow -t ~/.config Configs
```

**Option B — Manual copy:**
```bash
cd dotfiles/Configs
cp -r niri hyprland waybar kitty alacritty fish btop rofi mako wlogout ~/.config/
# Add mangowm, driftwm, etc. as needed
```
