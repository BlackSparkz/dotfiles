# Hobbyist dotfiles

## MangoWM
> [MangoWM](https://github.com/mangowm/mango) is as lightweight as dwl and can be built completely within a few seconds. Despite this, Mango does not compromise on functionality.

## Niri
> [Niri](https://github.com/YaLTeR/niri) is a scrollable-tiling Wayland compositor written in Rust. It offers a unique approach to window management compared to traditional tiling compositors.

## Hyprland
> [Hyprland](https://github.com/hyprwm/Hyprland) is an independent, highly customizable, dynamic tiling Wayland compositor without sacrificing its looks.

## DriftWM
> [DriftWM](https://github.com/malbiruk/driftwm) is a trackpad-first infinite canvas Wayland compositor.

### Curious about what it looks like? Here's a glimpse.

| **Desktop & Status Bar** |
|:---:|
| ![Desktop](Screenshots/waybar.png) |

| **App launcher** |
|:---:|
| ![Rofi](Screenshots/rofi.png) |
| ![Rofi2](Screenshots/rofi2.png) |

| **Clipboard history** |
|:---:|
| ![clipboard](Screenshots/clipboard.png) |

| **Power menu** |
|:---:|
| ![Wlogout](Screenshots/wlogout.png) |

| **Screenlock** |
|:---:|
| ![hyprlock](Screenshots/hyprlock.png) |
| ![hyprlock_alt](Screenshots/hyprlock_alt.png) |

| **Fastfetch** |
|:---:|
| ![fastfetch](Screenshots/fastfetch.png) |


## Components

> This setup uses the following applications and tools:

| **Category** | **Application** | **Description** |
|:---:|:---|:---|
| **Window Manager** | [MangoWM](https://github.com/mangowm/mango) | Practical and powerful Wayland compositor (dwm but Wayland) |
| | [Niri](https://github.com/niri-wm/niri) | A scrollable-tiling Wayland compositor. |
| | [Hyprland](https://github.com/hyprwm/Hyprland) | Highly customizable dynamic tiling Wayland compositor. |
| | [DriftWM](https://github.com/malbiruk/driftwm) | A trackpad-first infinite canvas Wayland compositor. |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) | Highly customizable modular status bar. |
| **Info fetch** | [Fastfetch](https://github.com/fastfetch-cli/fastfetch) | Fastfetch is a neofetch-like tool for fetching system information |
| **Wallpaper Manager** | [swaybg](https://github.com/swaywm/swaybg) | Wallpaper tool for Wayland compositors. |
| **Terminal** | [Kitty](https://github.com/kovidgoyal/kitty) | Fast, feature-rich, GPU-based terminal emulator. |
| | [Alacritty](https://github.com/alacritty/alacritty) | GPU-accelerated terminal emulator. |
| **Shell** | [Fish](https://fishshell.com/) | User-friendly command line shell. |
| **Editor** | [Neovim](https://neovim.io/) | Neovim is a modern, fast and feature-rich editor that is fully compatible with Vim. Powered by [NvChad](https://nvchad.com) |
| **Launcher** | [Rofi](https://github.com/davatorium/rofi) | Window switcher, application launcher, and dmenu replacement. |
| **System Monitor** | [Btop](https://github.com/aristocratos/btop) | A monitor of resources. |
| **File Manager** | [Yazi](https://github.com/sxyazi/yazi) | Blazing-fast terminal file manager written in Rust. |
| **Notifications** | [Mako](https://github.com/emersion/mako) | Lightweight notification daemon. |
| **Lock Screen** | [Hyprlock](https://github.com/hyprwm/hyprlock/) | Hyprland's GPU-accelerated screen locking utility. |
| **Logout Menu** | [Wlogout](https://github.com/ArtsyMacaw/wlogout) | Wayland-based logout menu. |
| **Media Player** | [MPV](https://mpv.io/) | Video player with `modernz` script. |
| **Git Client** | [Lazygit](https://github.com/jesseduffield/lazygit) | Simple terminal UI for git commands. |
| **Multiplexer** | [Tmux](https://github.com/tmux/tmux) | Terminal multiplexer. |
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
- Arch Linux (recommended) or an Arch-based distro (e.g. EndeavourOS, Manjaro)
- A Wayland session (X11 is not supported)
- AUR helper recommended for AUR packages (e.g. `yay` or `paru`)

### 1. Install Required Packages

```bash
yay -S waybar kitty fish neovim btop \
  yazi rofi mako hyprlock wlogout mpv \
  cava swaybg tmux lazygit fastfetch
```

> **Note:** `hyprland`, `niri`, `mangowm`, and `driftwm` may need to be installed via the AUR:
> ```bash
> yay -S mangowm-git
> ```

> ```bash
> yay -S niri
> ```

> ```bash
> yay -S hyprland
> ```

> ```bash
> yay -S driftwm
> ```

### 2. Clone Repository

```bash
git clone https://github.com/BlackSparkz/hobbyist-dotfiles.git
```

### 3. Deploy Configs

**Option A — Using `stow` (recommended):**
```bash
sudo pacman -S stow
cd ~/hobbyist-dotfiles/
stow -t ~/.config Configs
```

**Option B — Manual copy:**
```bash
cd ~/hobbyist-dotfiles/
cp -r niri hyprland waybar kitty alacritty fish btop rofi mako wlogout ~/.config/
# Add mangowm, driftwm, etc. as needed
```
