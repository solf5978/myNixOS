{
  wayland.windowManager.hyprland.settings = {
    exec-once = [

      # ──── 1. Input / Keyboard Services ─────────────────────────────
      "fcitx5 -d"                                      # Input method framework
      # ──── 2. System / Environment Setup ───────────────────────────
      "hyprctl setcursor CmoixCursors-Orange 32"
      # ──── 3. System / Environment Setup ───────────────────────────
      "dbus-update-activation-environment --systemd --all WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"         # PolicyKit agent for GUI auth

    ];
  };
}

