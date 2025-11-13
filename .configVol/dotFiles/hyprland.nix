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
      xwayland.enable = false;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      #extraConfig = ''
    };
    hyprlock.enable = true;
  };

  environment = {
    sessionVariables = {
      SDL_VIDEO_DRIVER = "wayland";
      NIXOS_OZONE_WL = "1";
    };

    etc."hypr/hyprland.conf".text = ''
      # Monitor Session
      # Enable when using Official Nvidia Driver as it has trouble detecting proper monitors
      #monitor = Unknown-1,disable
      monitor = desc:Microstep MSI MP273Q E2 PB6H485300387,2560x1440@60,2560x0,1
      monitor = desc:Microstep MSI MP273Q E2 PB6H485300388,2560x1440@60,0x0,1
      # FallBack Rule
      monitor= , preferredd, auto, 1
    ''; 
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
    pam.services = {
      hyprlock = {};
    };
  };
}
