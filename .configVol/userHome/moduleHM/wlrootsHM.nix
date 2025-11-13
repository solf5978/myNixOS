{ config, lib, pkgs, ... }:

let
  # Dynamically detect the first valid DRM device (e.g. /dev/dri/card0)
    drmDetectScript = pkgs.writeShellScript "detect-drm-device" ''
      for i in $(seq 1 5); do
        if ls /dev/dri/card* >/dev/null 2>&1; then
          ls /dev/dri/card* | head -n1
          exit 0
        fi
        sleep 0.2
      done
      echo "/dev/dri/card0"
    '';
in {
  # ──────────────────────────────────────────────
  # wlroots / Hyprland Environment Variables
  # Reference for all WLR_* vars, logically grouped
  # ──────────────────────────────────────────────
  home.sessionVariables = {

    # ─── Aquamarine (AQ_*) ──────────────────────────────────────
    # AQ_DRM_DEVICES = "$(${drmDetectScript})";
    # AQ_FORCE_LINEAR_BLIT = "0";
    # AQ_MGPU_NO_EXPLICIT = "0";
    # AQ_NO_MODIFIERS = "0";
    # AQ_TRACE = "0";

    # ─── Core Generic ───────────────────────────────────────────
    # DISPLAY: probe X11 backend in wlr_backend_autocreate
    # WAYLAND_DISPLAY: Wayland socket name
    # WAYLAND_SOCKET: socket path override
    # XCURSOR_PATH: directory where cursor themes live
    # XDG_SESSION_ID: session ID used by logind
    # (Usually managed by systemd/logind; not necessary to set manually)
    WLR_LOG_LEVEL = "info"; # Set wlroots log verbosity level (debug/info/warn/error)
    #WLR_LOG_FILE = "${logPath}/wlroots.log";

    # ─── DRM Backend ───────────────────────────────────────────
    WLR_DRM_DEVICES = "$(${drmDetectScript})";			# Primary GPU device path
    #WLR_DRM_FORCE_LIBLIFTOFF = "1";									#force libliftoff (plane allocation)
    WLR_DRM_NO_ATOMIC = "1";												# Use legacy DRM interface instead of atomic.
    WLR_DRM_NO_MODIFIERS = "1";											# Always allocate planes without modifiers.
    WLR_EGL_NO_MODIFIERS = "1";											# Disable EGL modifiers to avoid GL issues.

    # ─── Headless Backend ───────────────────────────────────────
    # WLR_HEADLESS_OUTPUTS: number of outputs when using headless backend

    # ─── Libinput Backend ───────────────────────────────────────
    # WLR_LIBINPUT_NO_DEVICES: do not fail if no input devices exist
    # (useful for headless/debug setups)
    # WLR_LIBINPUT_NO_DEVICES = "1";												# For Debuggin 

    # ─── Scenes (debugging) ─────────────────────────────────────
    # WLR_SCENE_DEBUG_DAMAG = "none";												# Damage debug option (none, rerender, highlight)
    # WLR_SCENE_DISABLE_DIRECT_SCANOUT: disable direct scan-out
    # WLR_SCENE_DISABLE_VISIBILITY: force all nodes to be visible (for debugging)
    # WLR_SCENE_HIGHLIGHT_TRANSPARENT_REGION: highlight transparent buffer regions
    # (useful for compositor developers; keep off normally)

    # ─── Wayland Backend ────────────────────────────────────────
    # WLR_WL_OUTPUTS: number of outputs for the Wayland backend
    # (used when running nested compositors like weston inside Hyprland)

    # ─── wlroots Core ───────────────────────────────────────────
    WLR_BACKENDS = "drm-backend.so,libinput";												# Comma-separated list of backends (libinput, drm, wayland, x11, headless).
		#WLR_BACKENDS = "drm,libinput";
    WLR_NO_HARDWARE_CURSORS = "0";												# Force software cursors for stability.
    # WLR_NO_HARDWARE_SCALING = "0"; 												# Disable hardware scaling for tearing issues.
    WLR_NO_UNSTABLE = "1"; 																# Disable unstable wlroots features
    WLR_RENDERER = "opengl";         											# OpenGL, GLES2, PIXMAN renderer
    WLR_RENDERER_ALLOW_SOFTWARE = "1"; 										# Enable software fallback
    # WLR_RENDER_DRM_DEVICE: specify DRM node for hardware-accelerated rendering
    # WLR_RENDERER_DEBUG = "0";															# Detailed GL info ( 0, 1 )
    WLR_RENDER_NO_EXPLICIT_SYNC = "0";										# Disable explicit synchronization.
    # WLR_RENDERER: force renderer (gles2, pixman, vulkan)
    # WLR_RENDERER_FORCE_SOFTWARE: force software rendering
    WLR_VSYNC = "1";                # Enable VSync
    # WLR_XWAYLAND: path to Xwayland binary

    # ─── Hyprland Specific ──────────────────────────────────────
    # HYPRLAND_CONFIG = "${config.xdg.configHome}/hypr/hyprland.conf";
    # HYPRLAND_NO_RT = "1";            # Disable realtime scheduling (can fix hangs)
    # HYPRLAND_NO_SD_NOTIFY = "0";     # Keep sd_notify active for systemd sessions
    # HYPRLAND_NO_SD_VARS = "0";       # Allow systemd env var integration
    # HYPRLAND_TRACE = "0";            # Set to 1 for verbose startup tracing

  };
}

