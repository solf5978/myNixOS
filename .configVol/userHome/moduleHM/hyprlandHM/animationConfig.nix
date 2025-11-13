{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;
      workspace_wraparound = true;

      # ──── 1. Bézier Curves ────────────────────────────────
      bezier = [
        "softPop, 0.3, 0.0, 0.2, 1.0"        # gentle entry/exit easing
        "smoothY, 0.42, 0, 0.58, 1"          # classic smooth curve
        "overShot, 0.65, -0.15, 0.35, 1.15"  # light elastic bounce
        "swiftY, 0.8, 0, 0.2, 1"             # snappy transitions
        "easeIn, 0.42, 0, 1, 1"              # smooth acceleration
        "easeOut, 0, 0, 0.58, 1"             # smooth deceleration
      ];

      # ──── 2. Animations (combined list) ───────────────────
      animation = [
        # ─── WINDOWS ─────────────────────────────
        "windows,         1, 4, overShot"          # main window motion
        "windowsIn,       1, 4, softPop, popin"   # window entry (style supported)
        "windowsOut,      1, 4, softPop, popin"   # window exit
        "windowsMove,     1, 5, smoothY"          # reposition / dragging

        # ─── LAYERS / FADE ─────────────────────────
        "layers,          1, 4, smoothY, slide"   # main layers (style supported)
        "layersIn,        1, 4, softPop, popin"   # layer open
        "layersOut,       1, 4, softPop, popin"   # layer close

        "fade,            1, 6, smoothY"          # generic fade
        "fadeIn,          1, 6, smoothY"          # window open
        "fadeOut,         1, 6, smoothY"          # window close
        "fadeSwitch,      1, 6, smoothY"          # active window switch
        "fadeShadow,      1, 6, smoothY"          # shadow fade
        "fadeDim,         1, 6, smoothY"          # inactive window dim
        "fadeLayers,      1, 6, smoothY"          # layer fade
        "fadeLayersIn,    1, 6, softPop"          # layer entry
        "fadeLayersOut,   1, 6, softPop"          # layer exit
        "fadePopups,      1, 6, smoothY"          # popup fade
        "fadePopupsIn,    1, 6, softPop"          # popup open
        "fadePopupsOut,   1, 6, softPop"          # popup close
        "fadeDpms,        1, 6, smoothY"          # DPMS toggle

        # ─── BORDERS / FOCUS ───────────────────────
        "border,          1, 4, swiftY"           # focus border fade
        "borderangle,     1, 6, overShot, once"   # subtle gradient spin

        # ─── WORKSPACES ────────────────────────────
        "workspaces,      1, 4, smoothY, slidefade"         # desktop switch
        "workspacesIn,    1, 4, smoothY, slidefade"         # workspace entry
        "workspacesOut,   1, 4, smoothY, slidefade"         # workspace exit
        "specialWorkspace,1, 5, smoothY, fade"              # special workspace
        "specialWorkspaceIn,  1, 5, smoothY, fade"          # special entry
        "specialWorkspaceOut, 1, 5, smoothY, fade"          # special exit

        # ─── FULLSCREEN / ZOOM ─────────────────────
        "zoomFactor,      1, 5, easeIn"                     # subtle zoom effect
        "monitorAdded,    1, 5, easeIn"                     # monitor added
      ];
    };
  };
}

