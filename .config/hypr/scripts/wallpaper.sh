#!/usr/bin/sh

WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"
CACHE_DIR="$HOME/.cache/hyprland-wallpaper"
SAVED_WALLPAPER="$CACHE_DIR/current_wallpaper"

mkdir -p "$CACHE_DIR"

if ! pgrep -x "awww-daemon" > /dev/null; then
    awww-daemon &
    sleep 0.5
fi

set_wallpaper() {
  local img="$1"
  if [ -f "$img" ]; then
    awww img "$img"
    echo "$img" > "$SAVED_WALLPAPER"
    cat <<EOF > "$HOME/.config/hypr/hyprlock_bg.conf"
background {
  monitor =
  path = $img
  blur_passes = 3
  blur_size = 3
  contrast = 1.2
  brightness = 0.8916
}
EOF
  fi
}

if [ "$1" == "--restore" ]; then
  if [ -f "$SAVED_WALLPAPER" ]; then
    RESTORE_IMG=$(cat "$SAVED_WALLPAPER")
    set_wallpaper "$RESTORE_IMG"
  fi
  exit 0
fi

ROFI_INPUT=""
for img in "$WALLPAPER_DIR"/*; do
    [ -f "$img" ] || continue
    filename=$(basename "$img")
    
    ROFI_INPUT+="${filename}\0icon\x1f${img}\n"
done

ROFI_THEME='
configuration {
    show-icons: true;
}
window {
    width: 60%;
    border-radius: 12px;
}
element {
    orientation: vertical;
    padding: 10px;
    border-radius: 8px;
}
element-icon {
    size: 160px;
    horizontal-align: 0.5;
}
element-text {
    horizontal-align: 0.5;
}
listview {
    columns: 4;
    lines: 2;
    cycle: true;
}
'

SELECTED_FILE=$(printf "%b" "$ROFI_INPUT" | rofi -dmenu -i -p "Select Wallpaper" -theme-str "$ROFI_THEME")

if [ -n "$SELECTED_FILE" ]; then
    FULL_PATH="$WALLPAPER_DIR/$SELECTED_FILE"
    set_wallpaper "$FULL_PATH"
fi
