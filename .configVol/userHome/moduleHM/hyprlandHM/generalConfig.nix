{ colourPalette, hexHelper, ... }:

{
  wayland.windowManager.hyprland.settings = {

    general = {
      border_size = 2;
      no_border_on_floating = false;
      gaps_in = 5;
      gaps_out = 10;
      float_gaps = 0;
      gaps_workspaces = 0;

      "col.inactive_border" = "${hexHelper colourPalette.base02}";
      "col.active_border" = "${hexHelper colourPalette.base0D}";
      "col.nogroup_border" = "${hexHelper colourPalette.base0D}";
      "col.nogroup_border_active" = "${hexHelper colourPalette.base0D}";

      layout = "dwindle";
      no_focus_fallback = false;
      resize_on_border = false;
      extend_border_grab_area = 15;
      hover_icon_on_border = true;
      allow_tearing = false;
      resize_corner = 0;

      snap = {
        enabled = false;
        window_gap = 10;
        monitor_gap = 10;
        border_overlap = false;
        respect_gaps = false;
      };
    };

    #  decoration = {
    #    rounding = 8;
    #    rounding_power = 4.0;
    #    active_opacity = 1.0;
    #    inactive_opacity = 0.3;
    #    fullscreen_opacity = 0.8;
    #    dim_modal = true;
    #    dim_inactive = false;
    #    dim_strength = 0.5;
    #    dim_special = 0.2;
    #    dim_around = 0.4;
    #    screen_shader = " ";
    #    border_part_of_window = true;
    #
    #    blur = {
    #      enabled = true;
    #      size = 5;
    #      passes = 2;
    #      ignore_opacity = true;
    #      new_optimizations = true;
    #      xray = false;
    #      noise = 0.0117;
    #      contrast = 0.8916;
    #      brightness = 0.8172;
    #      vibrancy = 0.1696;
    #      vibrancy_darkness = 0.0;
    #      special = false;
    #      popups = false;
    #      popups_ignorealpha = 0.2;
    #      input_methods = false;
    #      input_methods_ignorealpha = 0.2;
    #    };
    #
    #    shadow = {
    #      enabled = true;
    #      range = 4;
    #      render_power = 3;
    #      sharp = false;
    #      ignore_window = true;
    #      color = "rgba(1C231E66)";
    #      color_inactive = "${hexHelper colourPalette.base09}";
    #      offset = "0 0";
    #      scale = 1.0;
    #    };
    #  };

    group = {
      auto_group = true;
      insert_after_current = true;
      focus_removed_window = true;
      drag_into_group = 1;
      merge_groups_on_drag = true;
      merge_groups_on_groupbar = true;
      merge_floated_into_tiled_on_groupbar = false;
      group_on_movetoworkspace = false;

      "col.border_active" = "${hexHelper colourPalette.base0D}";
      "col.border_inactive" = "${hexHelper colourPalette.base02}";
      "col.border_locked_active" = "${hexHelper colourPalette.base09}";
      "col.border_locked_inactive" = "${hexHelper colourPalette.base08}";

      groupbar = {
        enabled = true;
        font_family = "Noto Nerd Font";
        font_size = 12;
        font_weight_active = "bold";
        font_weight_inactive = "normal";
        gradients = false;
        height = 14;
        indicator_gap = 0;
        indicator_height = 3;
        stacked = false;
        priority = 3;
        render_titles = true;
        text_offset = 0;
        scrolling = true;
        rounding = 1;
        rounding_power = 2.0;
        gradient_rounding = 2;
        gradient_rounding_power = 2.0;
        round_only_edges = true;
        gradient_round_only_edges = true;
        text_color = "${hexHelper colourPalette.base05}";
        text_color_inactive = "${hexHelper colourPalette.base03}";
        text_color_locked_active = "${hexHelper colourPalette.base00}";
        text_color_locked_inactive = "${hexHelper colourPalette.base05}";
        "col.active" = "${hexHelper colourPalette.base0D}";
        "col.inactive" = "${hexHelper colourPalette.base02}";
        "col.locked_active" = "${hexHelper colourPalette.base0B}";
        "col.locked_inactive" = "${hexHelper colourPalette.base09}";
        gaps_in = 2;
        gaps_out = 2;
        keep_upper_gap = true;
      };
    };
  };
}

