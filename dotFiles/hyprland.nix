{ config, lib, pkgs, inputs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  programs = {
    uwsm.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      #extraConfig = ''
    };
    hyprlock.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      pkgs.eww
      pkgs.kitty
      pkgs.grimblast
      pkgs.hyprcursor
      pkgs.hypridle
      pkgs.hyprland-qt-support
      pkgs.hyprlock
      pkgs.hyprpolkitagent
      pkgs.swww
      pkgs.waybar
      pkgs.wl-clipboard
    ];

    sessionVariables = {
      SDL_VIDEO_DRIVER = "wayland";
      WLR_DRM_DEVICES = "/dev/dri/card0";
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };

  services = {
    displayManager = {
      enable = true;
      defaultSession = "regreet";
    };
    gnome.gnome-keyring.enable = true;
  };
  security = {
    polkit.enable = true;
#    pam.services = {
#      hyprlock = {};
#    };
  };
}
