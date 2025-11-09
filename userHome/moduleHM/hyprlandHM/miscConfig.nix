{
  wayland.windowManager.hyprland.settings = {
    misc = {
      # ─────────────────────────────────────────────
      # 🛠 Hyprland Miscellaneous Settings
      # ─────────────────────────────────────────────

      # ─── Visual / Appearance ───────────────────────
      background_color = "0x11111111";
      "col.splash" = "0xFFFFFFFF";
      force_default_wallpaper = -1;
      font_family = "Noto Nerd Font";
      splash_font_family = "";
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      disable_scale_notification = false;

      # ─── Animation / Rendering ────────────────────
      animate_manual_resizes = false;
      animate_mouse_windowdragging = false;
      render_unfocused_fps = 15;
      vfr = true;
      vrr = 0;

      # ─── Window / Focus Behavior ─────────────────
      always_follow_on_dnd = true;
      close_special_on_empty = true;
      enable_swallow = false;
      focus_on_activate = false;
      key_press_enables_dpms = false;
      layers_hog_keyboard_focus = true;
      middle_click_paste = true;
      mouse_move_enables_dpms = false;
      mouse_move_focuses_monitor = true;
      name_vk_after_proc = true;
      size_limits_tiled = false;
      swallow_exception_regex = "";
      swallow_regex = "";

      # ─── Session / Lock / Security ───────────────
      allow_session_lock_restore = false;
      enable_anr_dialog = true;
      lockdead_screen_delay = 1000;
      session_lock_xray = false;

      # ─── Misc / Compatibility ────────────────────
      disable_hyprland_qtutils_check = false;
      disable_xdg_env_checks = false;
    };
  };
}

