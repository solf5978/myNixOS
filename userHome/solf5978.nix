{ config, pkgs, ... }:

{
  imports = 
    [
      ./solf5978/gitAuth.nix
    ];

  home.username = "solf5978";
  home.homeDirectory = "/home/solf5978";
  home.packages = with pkgs; [
  ];
  
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.systemd.enable = false;
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "Unknown-1, disable"
      "HDMI-A-1, 2560x1440@60, 0x0, 1"
      "HDMI-A-2, 2560x1440@60, -2560x0, 1"
     # "HDMI-A-1, 2560x1440@60, 0x0, 1, bitdepth, 10, cm, auto"
     # "HDMI-A-2, 2560x1440@60, -2560x0, 1, bitdepth, 10, cm, auto"
      # FallBack Rule
      " , preferred, auto, 1"
    ];
    exec-once = [
      "waybar"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "systemctl --user start hyprpolkitagent"
      # "systemctl --user enable --now hypridle.service"
    ];
    
    "$mod" = "SUPER";
    bind = [
      "$mod, F, exec, firefox"
      "$mod, Q, exec, kitty"
      "$mod, W, exec, wezterm"
      "$mod, K, killactive"
    ];
    debug = {
      disable_logs = false;
    };
    
  };
  home.stateVersion = "25.05";
}
