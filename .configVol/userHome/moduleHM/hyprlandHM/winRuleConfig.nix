{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrule = [

      # ──── 1. Border / Shadow / Blur Adjustments ─────────────
      "noblur, class:^(yazi|thunar|wezterm)$"
      "noborder, class:^(mpv|vlc|obs)$"
      "noshadow, class:^(mpv|vlc|obs)$"

      # ──── 2. Core Floating Windows ─────────────────────────────
      "float, class:^(blueman-manager)$"
      "float, class:^(nm-connection-editor)$"
      "float, class:^(org.gnome.Calculator)$"
      "float, class:^(org.gnome.FileRoller)$"
      "float, class:^(org.gnome.NautilusPreviewer)$"
      "float, class:^(pavucontrol)$"
      #"float, class:^(thunar)$, center, size 1400x900"
      "float, title:^(Choose wallpaper|Color Picker)$"
      "float, title:^(Confirm|Preferences|Settings)$"
      "float, title:^(Open File|Save File|File Upload)$"

      # ──── 3. Centered Dialogs ─────────────────────────────────
      "center, class:^(pavucontrol)$"
      "center, class:^(org.gnome.NautilusPreviewer)$"
      "center, title:^(Open File|Save File|Confirm)$"

      # ──── 4. Opacity / Aesthetic Rules ────────────────────────
      "opacity 0.88, class:^(mpv|vlc)$"
      "opacity 0.90, class:^(wezterm)$"
      "opacity 0.90, class:^(yazi)$"
      "opacity 0.92, class:^(thunar)$"
      "opacity 0.95, class:^(firefox)$"
      "opacity 0.95, class:^(librewolf)$"
      "opacity 0.95, class:^(vivaldi)$"

      # ──── 5. Size Rules ───────────────────────────────────────
      "size 1100x750, class:^(Gimp|krita)$"
      "size 1280x720, class:^(mpv)$"
      "size 1280x720, class:^(vlc)$"
      "size 1600x900, class:^(obs)$"
      "size 800x600, title:^(Properties)$"
      "size 900x700, title:^(Settings)$"

      # ──── 6. Special Behavior ─────────────────────────────────
      "fullscreen, title:^(YouTube|VLC|mpv)$"
      "noanim, class:^(mpv|vlc|obs)$"
      "noanim, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "stayfocused, class:^(nm-connection-editor|pavucontrol)$"

      # ──── 7. Workspace Assignment ─────────────────────────────
      "workspace 1, class:^(firefox|librewolf|vivaldi|qutebrowser)$"
      "workspace 2, class:^(wezterm|alacritty)$"
      "workspace 3, class:^(thunar|dolphin|nemo)$"
      "workspace 4, class:^(obs|vlc|mpv)$"
      "workspace 5, class:^(helix|hx|zed|code|nvim)$"
      "workspace 6, class:^(dbeaver|sqlitebrowser)$"

      # ──── 8. Debug / Utilities ────────────────────────────────
      "float, class:^(org.gnome.Terminal)$"
      "float, class:^(qalculate-gtk)$"
      "float, class:^(yad)$"
      "float, class:^(zenity)$"

      # ──── 9. Future Expansion Ideas ───────────────────────────
      # • Per-workspace dynamic layouts (tiling/floating mix)
      # • Optional gestures if touchscreens are added
      # • App-specific animations for productivity apps
      # • Integrate multi-monitor rules based on serial numbers
    ];
  };
}

