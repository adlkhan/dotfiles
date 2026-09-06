# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level
directory is a stow *package* containing the path it maps to, relative to `$HOME`.

## Layout

```
hypr/.config/hypr/input.lua       Hyprland input config (XP-Pen tablet rotation)
hypr/.config/hypr/monitors.lua    Monitor layout and display scaling
keyd/.config/keyd/default.conf    keyd tablet key remapping (REFERENCE COPY -- see below)
```

Only files that actually differ from Omarchy's shipped defaults are tracked.
The rest of `~/.config/hypr/` is left as real files so `omarchy refresh` and
Omarchy updates can manage them without producing spurious diffs here.

## Install

```bash
stow -d ~/Work/dotfiles -t ~ --no-folding hypr keyd
```

Re-stow after adding a file to a package:

```bash
stow -d ~/Work/dotfiles -t ~ --no-folding -R hypr keyd
```

Always pass `--no-folding`. Without it, stow replaces `~/.config/keyd` with a
symlink to this repo, and anything the app later writes there (for example
`keyd-application-mapper`'s `app.conf` and `app.log`) lands in version control.

## keyd is a two-step

`keyd` only reads `/etc/keyd/`. It runs as root and grabs input devices at boot,
so it cannot read anything under `~/.config`. The file in this repo is a
**reference copy**; it is not live.

After editing it:

```bash
sudo install -Dm644 ~/.config/keyd/default.conf /etc/keyd/default.conf
sudo systemctl restart keyd
```

Use `restart`, not `keyd reload` -- reload does not always re-grab the device.
Validate first with `sudo keyd check`. Do not symlink `/etc/keyd/default.conf`
to this repo: keyd's `command()` action runs as root, so a root daemon reading
a user-writable config is a privilege-escalation risk.

Full restore on a new machine also needs the package and the service:

```bash
omarchy pkg add keyd
sudo install -Dm644 ~/.config/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
journalctl -u keyd -n 20     # confirm it matched the KEYBOARD, not the pen
```

## Omarchy resets un-stow these files

`omarchy reinstall configs` runs `cp -af /etc/skel/. ~/`, which replaces
symlinks with regular files. `omarchy refresh config hypr/<file>` does the same
for one file. Neither touches this repo -- just re-stow:

```bash
stow -d ~/Work/dotfiles -t ~ --no-folding -R hypr keyd
```

## Notes

- `input.lua` uses `left_handed = true` for the tablet's 180-degree rotation.
  Do not use `transform` -- Hyprland accepts it but it has no effect on tablets
  in 0.56.2.
- `monitors.lua` is written by `omarchy hyprland monitor scaling`, so changing
  display scale from the menu or a keybinding edits this tracked file.
