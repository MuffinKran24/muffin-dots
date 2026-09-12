require("monitors")
require("animations")
require("keybindings")
require("windowrules")

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
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("xsettingsd")
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

hl.env("GDK_BACKEND",           "wayland,x11")
hl.env("QT_QPA_PLATFORMTHEME",  "qt5ct")
hl.env("QT_QPA_PLATFORM",       "wayland;xcb")

hl.env("MOZ_ENABLE_WAYLAND",    "1")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
  general = {
    gaps_in           = 6,
    gaps_out          = 12,

    border_size       = 2,
    col = {
      active_border   = "rgba(184, 187, 38, 1)",
      inactive_border = "rgba(184, 187, 38, 0.5)",
    },

    resize_on_border  = false,
    allow_tearing     = false,
    layout            = "dwindle",
  },

  decoration = {
    rounding          = 20,
    rounding_power    = 1,

    active_opacity    = 1,
    inactive_opacity  = 1,

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
