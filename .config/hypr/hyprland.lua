require("monitors")
require("animations")
require("keybindings")

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("swaync")
  hl.exec_cmd("quickshell")
  hl.exec_cmd("awww-daemon")
  hl.exec_cmd("awww img home/$USER/.config/hypr/wallpapers/grove.png")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("hyprctl setcursor $CURSOR_THEME $CURSOR_SIZE")
  hl.exec_cmd("hyprpm reload")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XDG_CURRENT_DESKTOP",   "Hyprland")
hl.env("XDG_SESSION_TYPE",      "wayland")
hl.env("XDG_SESSION_DESKTOP",   "Hyprland")

hl.env("CURSOR_THEME",          "Bibata-Modern-Classic")
hl.env("CURSOR_SIZE",           "26")

hl.env("XCURSOR_THEME",         "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE",          "26")

hl.env("GTK_THEME",             "Gruvbox-Retro")
hl.env("GDK_BACKEND",           "wayland,x11")
hl.env("QT_QPA_PLATFORMTHEME",  "qt5ct")
hl.env("QT_QPA_PLATFORM",       "wayland;xcb")

hl.env("MOZ_ENABLE_WAYLAND", "1")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in           = 6,
    gaps_out          = 12,

    border_size       = 3,
    col = {
      active_border   = "rgba(60, 56, 54, 0.7)",
      inactive_border = "rgba(40, 36, 34, 0.7)",
    },

    resize_on_border  = false,
    allow_tearing     = false,
    layout            = "dwindle",
  },

  decoration = {
    rounding          = 8,
    rounding_power    = 2,

    active_opacity    = 0.9,
    inactive_opacity  = 0.8,

    blur = {
      enabled         = true,
      size            = 3,
      passes          = 1,
      vibrancy        = 0.1696,
    },
  },

  xwayland = {
    force_zero_scaling = true
  },
})

hl.config({
  dwindle = {
    preserve_split     = true,
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout           = "de",
    follow_mouse        = 1,

    sensitivity         = -0.5,

    touchpad = {
      natural_scroll    = false,
    },
  },
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
  name  = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

hl.window_rule({
  match = { class = ".*" },
  opaque = true,
})

hl.window_rule({
  match = { class = "kitty" },
  opaque = false,
})

hl.window_rule(({
  match = { class = "md.obsidian.Obsidian" },
  opaque = false,
}))

hl.window_rule({
  -- Fix some dragging issues with XWayland
  name  = "fix-xwayland-drags",
  match = {
    class      = "^$",
    title      = "^$",
    xwayland   = true,
    float      = true,
    fullscreen = false,
    pin        = false,
  },
  no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },

  move  = "20 monitor_h-120",
  float = true,
})
