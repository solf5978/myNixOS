{ config, colourPalette, hexHelper, pkgs, ... }:

#let
#  colourTheme = import ../colourTheme/verdantCloak.nix;
#  colourPalette = colourTheme.colourPalette;
#  hexHelper = hexCode: "rgb(${hexCode})";
#in
{
  imports = 
    [
      ./configDev/gitAuth.nix
      ./moduleHM/bashHM.nix
      (import ./moduleHM/dunstHM.nix { inherit colourPalette hexHelper pkgs; })
      #./moduleHM/dunstHM.nix
      #      ./moduleHM/ewwHM
      ./moduleHM/fcitx5HM.nix
      ./moduleHM/fishHM.nix
      ./moduleHM/generalHM.nix
      ./moduleHM/hyprlandHM
#      (./moduleHM/hyprlandHM { inherit colourPalette hexHelper; })
      ./moduleHM/neovimHM
      ./moduleHM/weztermHM.nix
      ./moduleHM/wlrootsHM.nix
      ./moduleHM/yaziHM.nix
    ];

  home.username = "solf5978";
  home.homeDirectory = "/home/solf5978";
  home.packages = with pkgs; [
    # Android / Mobile Devices
    pkgs.android-file-transfer
    pkgs.android-tools
    # Home Utils
    pkgs.bat
    pkgs.bluez
    pkgs.dateutils
    pkgs.duf
    pkgs.du-dust
    pkgs.eza
    pkgs.fastfetch
    pkgs.fd
    pkgs.fzf
    pkgs.hyperfine
    pkgs.ripgrep
    pkgs.rofi
    pkgs.rr
    pkgs.trash-cli
    pkgs.tokei
    pkgs.walker
    pkgs.zoxide
    # Browser
    pkgs.arkenfox-userjs
    pkgs.firefox
    pkgs.librewolf
    pkgs.qutebrowser
    pkgs.vivaldi
    pkgs.vivaldi-ffmpeg-codecs
    # Develop
    pkgs.jq
    pkgs.dbeaver-bin
#   pkgs.neovim
    pkgs.wezterm
    pkgs.yq
    # Input Method
    pkgs.bibata-cursors
    pkgs.comixcursors.Orange
    # MultiMedia
    pkgs.ffmpeg
    pkgs.mpv
    pkgs.obs-studio

  ];

  home.sessionVariables = { 
    SHELL = "${pkgs.fish}/bin/fish";
  };
  
  home.stateVersion = "25.05";
}
