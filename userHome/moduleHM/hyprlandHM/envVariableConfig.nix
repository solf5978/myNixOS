{
  wayland.windowManager.hyprland.settings = {
    env = [
      # Mozilla Variables
      "MOZ_ENABLE_WAYLAND=1"                   # Forces Firefox/librewolf to use wayland backend instead of X11.
      "MOZ_ACCELERATED=1"                      # Enables GPU acceleration.
      #"MOZ_USE_XINPUT2=1"                      # Use XInput2 for input when on X11 (Mostly Optional).
      "MOZ_WEBRENDER=1"                        # Enable WebRender (GPU-accelerated rendering).
      # General Hyprland debugging and control
      # "HYPRLAND_TRACE,1"                       # Enables more verbose logging.
      # "HYPRLAND_NO_RT,0"
      # "HYPRLAND_NO_SD_NOTIFY,0"                # Disable sd_notify if 1 (for systemd sessions).
      # "HYPRLAND_NO_SD_VARS,0"                  # Disable sd/dbus var management if 1.
      # "HYPRLAND_CONFIG,/path/to/hyprland.conf"  # Custom config path (optional).

      # --- Aquamarine (renderer/DRM layer) Variables ---
      # "AQ_TRACE,0"                             # Enables verbose logging for Aquamarine.
      # "AQ_DRM_DEVICES,/dev/dri/card0"        # Explicit DRM device list (colon-separated).
      # "AQ_FORCE_LINEAR_BLIT,0"                 # Force linear blits (workaround Nvidia issues).
      # "AQ_MGPU_NO_EXPLICIT,0"                  # Disable explicit multi-GPU sync.
      # "AQ_NO_MODIFIERS,0"                      # Disable DRM modifiers.

      # --- Toolkit Backend Variables ---
      "GDK_BACKEND,wayland,x11,*"              # GTK: prefer Wayland, fallback to X11.
      "QT_QPA_PLATFORM,wayland;xcb"            # Qt: Wayland first, then X11.
      "SDL_VIDEODRIVER,wayland"                # SDL2: use Wayland.
      "CLUTTER_BACKEND,wayland"                # Clutter: force Wayland.

      # --- XDG Specifications ---
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"

      # --- Qt Variables ---
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"          # Enable automatic scaling by DPI.
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"  # Disable Qt window decorations.
      "QT_QPA_PLATFORMTHEME,qt5ct"             # Theme from qt5ct (works with Kvantum).
      "QT_STYLE_OVERRIDE,kvantum"              # Explicit style override.

      # --- Input Methods ---
      #"GTK_IM_MODULE,fcitx"
      "QT_IM_MODULE,fcitx"
      "SDL_IM_MODULE,fcitx"
      "XMODIFIERS,@im=fcitx"
      "GLFW_IM_MODULE,ibus"

      # --- NVIDIA / GBM Variables ---
      # Uncomment if using proprietary NVIDIA driver:
      #"GBM_BACKEND,nvidia-drm"
      #"__GLX_VENDOR_LIBRARY_NAME,nvidia"
      "LIBVA_DRIVER_NAME,nouveau"		#Hardware acceleration driver for VA-API.
			#"LIBVA_DRIVER_NAME,nvidia"
      # "__GL_GSYNC_ALLOWED,1"			# Allow G-Sync (VRR-capable displays).
      # "__GL_VRR_ALLOWED,1"			# Disable adaptive sync (for game issues).
      # "AQ_NO_ATOMIC,1"			# Use legacy DRM (not recommended).
      # "__GL_THREADED_OPTIMIZATIONS,1"

      # --- Theming / Appearance ---
      "SWWW_TRANSITION,grow"
      "SWWW_TRANSITION_STEP,200"
      "SWWW_TRANSITION_DURATION,1.5"
      "SWWW_TRANSITION_FPS,240"
      "SWWW_TRANSITION_WAVE,80,40"
      "GTK_THEME,Adwaita:dark"                 # Example GTK theme.
      #"XCURSOR_THEME,Bibata-Modern-Amber"      # Example cursor theme.
      #"XCURSOR_SIZE,24"                        # Cursor size in pixels.
      
      # --- HyprCursor Theme ---
      # Theme for Hyprland's native cursor (hyprcursor)
      "HYPRCURSOR_THEME=ComixCursors-Orange"
      
      # Cursor size for Hyprland (and hyprcursor)
      "HYPRCURSOR_SIZE=64"
       
      # Fallback for Qt/XWayland apps
      "XCURSOR_THEME=ComixCursors-Orange:Bibata-Modern-Amber"
      "XCURSOR_SIZE=64"
    ];
  };
}
