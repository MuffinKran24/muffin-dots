hl.window_rule({
  match = { class = ".*" },
  opaque = true,
})

hl.window_rule({
  match = { class = "kitty|md.obsidian.Obsidian" },
  opaque = false,
})

hl.window_rule({
  match = { initial_title = "termfilechooser" },
  float = true,
  center = true,
  size = {1200, 800},
  stay_focused = true,
})

hl.window_rule({
  name  = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

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
