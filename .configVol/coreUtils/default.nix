{ config, pkgs, inputs, ... }:

{
  imports = 
    [
      ./blueTooth.nix
      ./bootLoader.nix
      ./customFonts.nix
      ./enServices.nix
      ./fileSystems.nix
      ./nixConfigs.nix
      ./timeLocale.nix
    ];

  environment.systemPackages = with pkgs; [
    # Core Services & Drivers
    pkgs.dbus-broker
    pkgs.egl-wayland
    pkgs.libnotify
    #pkgs.lib32-vulkan-nouveau
    pkgs.linuxHeaders
    pkgs.ntfs3g
    #pkgs.nvidia-utils
    pkgs.openssh
    pkgs.uutils-coreutils-noprefix
    #pkgs.vulkan-nouveau
    # Hardware / System Utilities
    pkgs.ddcutil
    pkgs.pciutils
    pkgs.rsync
    pkgs.usbutils
    pkgs.zstd
    # Monitoring & Debuggin
    pkgs.btop
    pkgs.iotop
    pkgs.lsof
    pkgs.ltrace
    pkgs.strace
    pkgs.sysstat
    # Network Tools
    pkgs.iftop
    pkgs.iperf
    pkgs.nmap
    pkgs.socat

  ];   
}

