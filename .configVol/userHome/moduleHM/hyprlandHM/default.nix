{ pkgs, colourPalette, hexHelper, ... }:

{
  imports = [
    ./animationConfig.nix
    ./bindsConfig.nix
    ./cursorConfig.nix
    ./envVariableConfig.nix
    ./execOnceConfig.nix
    #(import ./generalConfig.nix { inherit colourPalette hexHelper; })
    ./generalConfig.nix
    ./inputConfig.nix
    ./miscConfig.nix
    ./winRuleConfig.nix
    ./wsRuleConfig.nix
  ];

  home.packages = with pkgs; [
    pkgs.eww
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

  services.swww.enable = true;
}     
  
