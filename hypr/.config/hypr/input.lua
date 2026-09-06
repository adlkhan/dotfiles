-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
-- hl.config({
--   input = {
--     -- Use multiple keyboard layouts and switch between them with Left Alt + Right Alt.
--     kb_layout = "us,dk,eu",
--     kb_options = "compose:caps,shift:both_capslock_cancel,grp:alts_toggle",
--
--     -- Use a specific keyboard variant if needed (e.g. intl for international keyboards).
--     kb_variant = "intl",
--
--     -- Change speed of keyboard repeat.
--     repeat_rate = 40,
--     repeat_delay = 250,
--
--     -- Start with numlock on by default.
--     numlock_by_default = true,
--
--     -- Increase sensitivity for mouse/trackpad (default: 0).
--     sensitivity = 0.35,
--
--     -- Turn off mouse acceleration (default: adaptive).
--     accel_profile = "flat",
--
--     touchpad = {
--       -- Use natural (inverse) scrolling.
--       natural_scroll = true,
--
--       -- Use two-finger clicks for right-click instead of lower-right corner.
--       clickfinger_behavior = true,
--
--       -- Control the speed of your scrolling.
--       scroll_factor = 0.4,
--
--       -- Enable the touchpad while typing.
--       disable_while_typing = false,
--
--       -- Left-click-and-drag with three fingers.
--       drag_3fg = 1,
--     },
--   },
-- })

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })

-- ===========================================================================
-- XP-Pen Deco LW tablet
-- ===========================================================================
--
-- ROTATION: left_handed = true rotates the tablet 180 degrees, for using it
-- flipped with the express keys on the right. Set false to go back to
-- right-handed. Hyprland reloads on save; check with:
--   hyprctl configerrors            (blank output = fine)
--   hyprctl getoption input:tablet:left_handed
--
-- Do NOT use `transform` here. It looks like the obvious rotation option and
-- Hyprland even accepts it (getoption reports it as set), but it has no effect
-- on tablets in 0.56.2. left_handed is the one that works.
--
-- Other tablet options that DO exist, if you ever want them:
--   output              bind the pen to one monitor, e.g. output = "eDP-1"
--   active_area_size    use only part of the tablet surface
--   region_position / region_size    map the pen to part of the screen
--
-- EXPRESS KEYS are not configured here -- they are remapped by keyd in
--   /etc/keyd/default.conf     (that file documents how to change them)
-- and only over Bluetooth; the USB cable gives a working pen but dead keys.
-- ===========================================================================
hl.config({
  input = {
    tablet = {
      left_handed = true,
    },
  },
})
