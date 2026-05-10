# Arch Linux setup notes

Preference: simple, reliable, maintainable home desktop/server.

## ISO Wi-Fi fallback

If `archinstall` says no networks found:

```bash
iwctl device list
rfkill unblock all
iwctl
```

Inside `iwctl`:

```text
station wlan0 scan
station wlan0 get-networks
station wlan0 connect "SSID"
exit
```

Test and rerun installer:

```bash
ping archlinux.org
archinstall
```

## Main choices

| Item | Choice | Why |
|---|---|---|
| Filesystem | `ext4` | Simple, mature, reliable |
| LVM | No | Less complexity; fine for single-disk setup |
| Swap | zram | Fast compressed RAM swap; avoids disk writes |
| zram algorithm | `lz4` | Fast, low CPU overhead |
| Bootloader | `systemd-boot` | Simple and good for UEFI Linux-only installs |
| UKIs | Optional | Useful for Secure Boot; classic boot is fine |
| Kernel | `linux-lts` | Stable desktop/server base |
| Profile | `minimal` | Clean base; install only what is needed |
| Audio | `pipewire` | Modern default audio stack |
| Hostname | `triangulum` | Galaxy theme; laptop is `andromeda` |

Check UEFI:

```bash
ls /sys/firmware/efi
```

## User account

During `archinstall`, create a normal user account and set a password.

Recommended:

```text
Username: bradock
Add to sudo/wheel: yes
Root password: set one, or make sure the user has sudo
```

After install, login at the console with the username, not the hostname:

```text
triangulum login: bradock
Password: <user password>
```

Do **not** store real passwords in this file.

If password recovery is needed from ISO:

```bash
mount /dev/<root-partition> /mnt
arch-chroot /mnt
passwd bradock
usermod -aG wheel bradock
EDITOR=nano visudo   # uncomment: %wheel ALL=(ALL:ALL) ALL
exit
umount -R /mnt
reboot
```

## Useful packages after install

```bash
sudo pacman -S openssh rsync vim git
sudo systemctl enable --now sshd
```

PipeWire packages if needed:

```bash
sudo pacman -S pipewire pipewire-pulse wireplumber pipewire-alsa pipewire-jack
```

## Config locations

```text
System config: /etc
User config:   ~/.config
Dotfiles:      ~/.dotfiles
This file:     ~/.dotfiles/arch/.config/arch/setup.md
```

## Notes on alternatives

- `btrfs`: snapshots/compression/checksums; more complex.
- `xfs`: good for large files; cannot shrink easily.
- `f2fs`: flash-focused; less common for desktop/server root.
- `grub`: choose for dual boot, BIOS, or unusual boot setups.
- `linux`: choose if hardware is too new for `linux-lts`.
- `linux-hardened`: more security, possible compatibility tradeoffs.
- `linux-zen`: desktop responsiveness/gaming focus.
