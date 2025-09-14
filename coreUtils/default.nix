{ config, pkgs, inputs, ... }:

{
  imports = 
    [
      ./bootLoader.nix
      ./customFonts.nix
      ./enServices.nix
      ./fileSystems.nix
      ./nixConfigs.nix
      ./timeLocale.nix
    ];

  environment.systemPackages = with pkgs; [
    # System Wide
    # Core
    pkgs.android-file-transfer
    pkgs.android-tools
    pkgs.bat
    pkgs.dateutils
    pkgs.dbus-broker
    pkgs.duf
    pkgs.du-dust
    pkgs.eza
    pkgs.fd
    pkgs.fzf
    pkgs.hyperfine
    pkgs.ntfs3g
    pkgs.ripgrep-all
    pkgs.openssh
    pkgs.pciutils
    pkgs.skim
    pkgs.tokei
    pkgs.usbutils
    pkgs.uutils-coreutils
    pkgs.zstd
    pkgs.zoxide
    # System MGMT
    # Configure@HM
    pkgs.btop
    pkgs.dunst
    # Package Only
    pkgs.direnv
    pkgs.fastfetch
    pkgs.iotop
    pkgs.jq
    pkgs.libnotify
    pkgs.lsof
    pkgs.ltrace
    pkgs.rr
    pkgs.rsync
    pkgs.strace
    pkgs.sysstat
    pkgs.timeshift
    pkgs.trash-cli
    pkgs.yq
    # Database
    pkgs.dbeaver-bin
    # MultiMedia
    pkgs.ffmpeg
    pkgs.mpv
    pkgs.obs-studio
    # Networking
    pkgs.iftop
    pkgs.iperf
    pkgs.nmap
    pkgs.socat
    # Utilities
    # COnfigure@HM
    pkgs.arkenfox-userjs
    pkgs.fish
    pkgs.firefox
    pkgs.librewolf
    pkgs.neovim
    pkgs.qutebrowser
    pkgs.vivaldi
    pkgs.vivaldi-ffmpeg-codecs
    pkgs.wezterm
  ];   
}

