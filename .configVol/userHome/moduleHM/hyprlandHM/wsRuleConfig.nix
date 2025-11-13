{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    workspace = [

      # ──── 1. Default Workspace Properties ─────────────────────────
      # Initial workspace setup, fallback layouts
      "default-layout, workspace 1, master-tile"
      "default-layout, workspace 2, master-tile"
      "default-layout, workspace 3, master-tile"
      "default-layout, workspace 4, master-tile"
      "default-layout, workspace 5, master-tile"
      "default-layout, workspace 6, master-tile"

      # ──── 2. Floating/Centering Overrides ─────────────────────────
      # For apps that should always float or start centered
      "center, workspace 3, class:^(thunar|dolphin|nemo)$"
      "float, workspace 4, class:^(mpv|vlc|obs)$"
      "float, workspace 5, class:^(helix|hx|zed|code|nvim)$"

      # ──── 3. Workspace-Specific Applications ───────────────────────
      # Assign common apps to workspaces for productivity
      "workspace 1, class:^(firefox|librewolf|vivaldi|qutebrowser)$"
      "workspace 2, class:^(wezterm|alacritty)$"
      "workspace 3, class:^(thunar|dolphin|nemo)$"
      "workspace 4, class:^(obs|vlc|mpv)$"
      "workspace 5, class:^(helix|hx|zed|code|nvim)$"
      "workspace 6, class:^(dbeaver|sqlitebrowser)$"

      # ──── 4. Monitor-Based Rules ──────────────────────────────────
      # Map workspaces to specific monitors (use serial numbers)
      "monitor=desc:Microstep MSI MP273Q E2 PB6H485300387, workspace 1-3"
      "monitor=desc:Microstep MSI MP273Q E2 PB6H485300388, workspace 4-6"

      # ──── 5. Layout Preferences ──────────────────────────────────
      # Tile or float per workspace by default
      "layout=bstack, workspace 1"
      "layout=bstack, workspace 2"
      "layout=monocle, workspace 3"
      "layout=bstack, workspace 4"
      "layout=monocle, workspace 5"
      "layout=tile, workspace 6"

      # ──── 6. Future Expansion Ideas ──────────────────────────────
      # • Per-monitor dynamic workspace switching
      # • Advanced tiling layouts for dev apps (e.g., Helix, Zed)
      # • Optional touch/gesture support if monitors change
      # • Workspace-specific wallpaper, color themes, or transparency
      # • Integration with workspace keybindings for faster switching
    ];
  };
}

