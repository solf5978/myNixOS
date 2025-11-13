{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    settings = {
      # ─────────────────────────────────────────────
      # ─── Base Variables ──────────────────────────
      # ─────────────────────────────────────────────
      "$mainMod" = "SUPER";

      # ─── Launchers & Utilities ───────────────────
      "$LAUNCHER" = "walker --show drun";
      "$TERMINAL" = "wezterm";
      "$FILEMANAGER_TUI" = "wezterm -e yazi";
      "$FILEMANAGER_GUI" = "thunar";
      "$BROWSER_CHROMIUM" = "vivaldi";
      "$BROWSER_FIREFOX" = "firefox";
      "$BROWSER_LIBREWOLF" = "librewolf";
      "$BROWSER_QUTE" = "qutebrowser";
      "$EDITOR_VIM" = "wezterm -e nvim";
      "$EDITOR_HELIX" = "wezterm -e hx";
      "$EDITOR_ZED" = "zed";
      "$LOCKSCREEN" = "hyprlock";
      "$SCREENSHOT_DIR" = "~/Pictures/Screenshots";

      # ─────────────────────────────────────────────
      # ─── Keyboard Bindings ───────────────────────
      # ─────────────────────────────────────────────
      bind = [

        # ─── Audio ─────────────────────────────────────────────
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"

        # ─── Brightness ─────────────────────────────────────────
        ", XF86MonBrightnessDown, exec, ddcutil setvcp 10 - 10"
        ", XF86MonBrightnessUp, exec, ddcutil setvcp 10 + 10"

        # ─── Clipboard / Screenshot ─────────────────────────────
        ", Print, exec, grimblast --notify copy area"
        "SHIFT, Print, exec, grimblast --notify copy active"
        "CTRL, Print, exec, grimblast --notify save area $SCREENSHOT_DIR"
        "ALT, Print, exec, grimblast --notify save active $SCREENSHOT_DIR"

        # ─── Focus Navigation ───────────────────────────────────
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # ─── Launchers / Apps ───────────────────────────────────
        "$mainMod, D, exec, $LAUNCHER"
        "$mainMod, RETURN, exec, $TERMINAL"
        "$mainMod, E, exec, $FILEMANAGER_GUI"
        "$mainMod, Y, exec, $FILEMANAGER_TUI"
      	"$mainMod, B, exec, ~/.config/eww/scripts/toggle.sh"

        # ─── Browsers ───────────────────────────────────────────
        "$mainMod, F, exec, $BROWSER_FIREFOX"
        "$mainMod, L, exec, $BROWSER_LIBREWOLF"
        "$mainMod, V, exec, $BROWSER_CHROMIUM"
        "$mainMod, Q, exec, $BROWSER_QUTE"

        # ─── Editors ────────────────────────────────────────────
        "$mainMod, N, exec, $EDITOR_VIM"
        "CTRL, N, exec, $EDITOR_HELIX"
        "SHIFT, N, exec, $EDITOR_ZED"

        # ─── System / Session ───────────────────────────────────
        "$mainMod SHIFT, L, exec, $LOCKSCREEN"
        "$mainMod CTRL, Q, exit"
        "$mainMod CTRL, R, exec, systemctl reboot"
        "$mainMod CTRL, P, exec, systemctl poweroff"
        "$mainMod CTRL, S, exec, systemctl suspend"
        "$mainMod, R, exec, hyprctl reload"

        # ─── Window Management ─────────────────────────────────
        "$mainMod, F11, fullscreen"
        "$mainMod, F, togglefloating"
        "$mainMod, G, togglegroup"
        "$mainMod, P, pseudo"
        #"$mainMod, Q, killactive"
        "$mainMod SHIFT, C, centerwindow"
        #"$mainMod SHIFT, F, togglepin"

        # ─── Workspace Management ──────────────────────────────
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"

        # ─── Misc ───────────────────────────────────────────────
        "$mainMod, B, exec, pkill eww || eww open bar"
        "$mainMod ALT, T, exec, notify-send 'Hyprland' 'Configuration reloaded'"
      ];

      # ─────────────────────────────────────────────
      # ─── Mouse Bindings ──────────────────────────
      # ─────────────────────────────────────────────
      bindm = [
        # ─── Window Management ────────────────────────────────────────
        "$mainMod, mouse:272, movewindow"               # Left-click + Super to move window
        "$mainMod, mouse:273, resizewindow"             # Right-click + Super to resize window
        "$mainMod, mouse:274, togglefloating"           # Middle-click + Super toggles floating

        # ─── Workspace Navigation ────────────────────────────────────
        #", mouse_down, workspace, e+1"                  # Scroll down to next workspace
        #", mouse_up, workspace, e-1"                    # Scroll up to previous workspace

        # ─── Quick Actions ───────────────────────────────────────────
        ", mouse:274, killactive"                       # Middle-click (no mod) to close focused window
        "$mainMod ALT, mouse:272, centerwindow"         # Center window instantly
      ];

      # ─────────────────────────────────────────────
      # ─── Debug Options ───────────────────────────
      # ─────────────────────────────────────────────
      debug = {
        disable_logs = false;
      };
    };
  };
}

