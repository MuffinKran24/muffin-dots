# my new dotfiles repo

## Dependencies

maybe I will someday write a install script for this

### Stow
```bash
pacman -S stow
```
after installing stow, run 
```bash
stow .
``` 
in the main dotfiles directory

### Hyprland
```bash
pacman -S hyprland hyprlock awww kitty hyprpm wofi qt5ct gtk3 gtk4 xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-desktop-portal xsettingsd fontconfig swaync
```

#### Hyprland plugins
```bash
hyprpm update
hyprpm add https://github.com/gfhdhytghd/hymission
hyprpm enable hymission
hyprpm reload
```

### Zsh
```bash
pacman -S zsh fzf
```
after installing zsh, set it as your login shell

```bash
chsh $USER
```

### Quickshell
```bash
pacman -S quickshell
```

### Yazi
```bash
pacman -S yazi
```

### NeoVim
```bash
pacman -S nvim
```

### Tmux
```bash
pacman -S tmux
```

### Btop
```bash
pacman -S btop
```
