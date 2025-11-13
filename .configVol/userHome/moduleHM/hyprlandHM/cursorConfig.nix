{
  wayland.windowManager.hyprland.settings = {
    cursor = {
			invisible = false;            # Don't render cursor.
      sync_gsettings_theme = false;  # Sync theme/size with gsettings (for GTK).
      no_hardware_cursors = 1;      # Disable HW cursors (2=auto/no tearing).
      no_break_fs_vrr = 2;          # Stop frame scheduling on move in fullscreen VRR.
      min_refresh_rate = 24;        # Min refresh rate for movement with no_break_fs_vrr.
      hotspot_padding = 1;          # Padding between cursor and screen edge.
      inactive_timeout = 0.0;       # Seconds until cursor hides (0=never).
      no_warps = false;             # Disable cursor warping (focusing, etc).
      persistent_warps = false;     # Cursor returns to last position relative to window.
      warp_on_change_workspace = 0; # Warp to last focused window after workspace change.
      warp_on_toggle_special = 0;   # Warp to last focused window when toggling special workspace.
      default_monitor = "";         # Set default monitor name on startup.
      zoom_factor = 1.0;            # Magnifying glass zoom level (1.0=no zoom).
      zoom_rigid = false;           # Make zoom follow cursor rigidly.
      enable_hyprcursor = true;     # Enable hyprcursor support.
      hide_on_key_press = false;    # Hide cursor on key press until mouse moves.
      hide_on_touch = true;         # Hide cursor after touch input until mouse input.
      use_cpu_buffer = 2;           # Use CPU buffer for HW cursors (Nvidia fix).
      warp_back_after_non_mouse_input = false; # Warp cursor back after non-mouse movement.
      zoom_disable_aa = false;      # Disable antialiasing when zooming.
    };
  };
}
