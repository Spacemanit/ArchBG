# ArchBG

A pitch-black OLED live desktop wallpaper dashboard for Wayland / Hyprland, rendered directly on the `wlr-layer-shell` background layer using `kitty +kitten panel` and Python `curses`.

```text
╭──────────────────────────╮  ╭──────────────────────────╮
│                          │  │  󰎈 RADIAL SPECTRUM       │
│  󰞌 SYSTEM JOURNAL        │  │  Braille 2x4 Subpixel    │
│  Live sanitized logs     │  │  FFT Audio Visualizer    │
│  (journalctl, semantic   │  ╰──────────────────────────╯
│   highlighting)          │  ╭──────────────────────────╮
│                          │  │  󰣇 ARCH CORE             │
│                          │  │  3D Shaded Arch Logo     │
│                          │  │  + Live CPU / MEM / UP   │
╰──────────────────────────╯  ╰──────────────────────────╯
```

## Features

- **Rounded Bento Card UI** — OLED pitch-black background with Material-You inspired periwinkle, glacial cyan, and lilac 256-color palette, top-bar safe padding, and Nerd Font icons.
- **Sanitized Live System Journal** — Streams `journalctl -f` with aligned timestamps, severity glyphs, fixed-width unit tags, and automatic redaction (`[REDACTED]`) of hostnames, IPv4/IPv6 addresses, 6-byte & UFW 14-byte MAC addresses, UUIDs, 32+ char hex IDs, emails, credentialed URLs, auth tokens/secrets, and hardware serial numbers.
- **High-Res Braille Radial Audio Spectrum** — Captures system audio via `parec` + `numpy` FFT and renders a smooth 2×4 Unicode Braille radial waveform with bass-reactive inner halo, peak-hold sparks, and an ambient idle wave when silent.
- **3D Shaded Arch Core + System Vitals** — Solid extruded 3D Arch Linux chevron with Lambertian directional lighting, a counter-rotating 3D orbital ring, and lightweight `/proc`-based CPU sparkline, memory bar, and uptime strip.

## Requirements

- Wayland compositor supporting `wlr-layer-shell` (e.g., **Hyprland**, **Sway**)
- [kitty](https://sw.kovidgoyal.net/kitty/) (`kitten panel`)
- Python 3 with `numpy`
- `systemd` (`journalctl`)
- PulseAudio / PipeWire (`pactl`, `parec`)
- A [Nerd Font](https://www.nerdfonts.com/) (e.g., `JetBrainsMono Nerd Font`)

On Arch Linux:

```bash
sudo pacman -S kitty python-numpy pipewire-pulse ttf-jetbrains-mono-nerd
```

## Installation & Usage

```bash
git clone https://github.com/Spacemanit/ArchBG.git
cd ArchBG
./install.sh
start-dashboard-wallpaper
```

### Hyprland Autostart

Add to your Hyprland config (`autostart.conf` / `hyprland.conf`):

```ini
exec-once = ~/.local/bin/start-dashboard-wallpaper
```

Or run as a user systemd transient unit:

```bash
systemd-run --user --no-block --collect --unit=live-wallpaper-dashboard \
  kitten panel --edge=background --focus-policy=not-allowed \
  --class=live-wallpaper-dashboard --override font_size=10 \
  --override background=#000000 --override background_opacity=1.0 \
  --override window_padding_width=10 --override cursor_blink_interval=0 \
  --override confirm_os_window_close=0 ~/.local/bin/live-desktop-dashboard
```

## License

MIT
