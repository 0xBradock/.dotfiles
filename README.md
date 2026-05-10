# Personal Dotfiles

Personal Linux workstation and notebook dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html).

## Install

Clone this repository into your home directory, then stow the packages you want:

```sh
cd ~
git clone git@github.com:0xBradock/.dotfiles.git .dotfiles
cd .dotfiles
stow nvim tmux kitty
```

## Packages

| Package | Purpose |
| --- | --- |
| `arch` | Arch Linux setup notes. |
| `bat` | Syntax-highlighting `cat` replacement configuration. |
| `helix` | Helix editor configuration. |
| `i3` | i3 window manager, i3blocks, and helper scripts. |
| `kitty` | kitty terminal settings and themes. |
| `nvim` | Neovim/kickstart.nvim configuration. |
| `picom` | X11 compositor settings. |
| `polybar` | Polybar status bar configuration. |
| `rofi` | Rofi launcher and menu themes. |
| `sesh` | Terminal session manager configuration. |
| `starship` | Cross-shell prompt configuration. |
| `task` | Taskwarrior configuration. |
| `tmux` | tmux terminal multiplexer configuration. |
| `xfce4` | XFCE terminal, Thunar, and xfconf settings. |
| `xinit` | X session startup script. |
| `yay` | Placeholder for yay/AUR helper notes or config. |

See each package's `.config/<package>/README.md` for a short description, upstream documentation link, and contents summary.
