{ config, inputs, lib, pkgs, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    extra-substituters = [ "https://yazi.cachix.org" ];
    extra-trusted-public-keys = [ "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k=" ];
  };


  nixpkgs.config = {
    allowUnfree = true;
    nvidia.acceptLicense= true;
  };

  services = {
    dbus.enable = true;
    dbus.implementation = "broker";
    openssh = {
      enable = true;
      settings = {
        X11Forwarding = true;
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      openFirewall = true;
    };
    resolved.enable = true;
    #xserver.videoDrivers = [ "nouveau" ];
    #xserver.enable = true;
    #xserver.videoDrivers = [ "nvidiaLegacy_470" ];
  };

  users = {
    defaultUserShell = "/run/current-system/sw/bin/fish";
    users.solf5978 = {
      isNormalUser = true;
      extraGroups = [ "audio" "i2c" "networkmanager" "plugdev" "video" "wheel" ];
      uid = 1000;
    };
  };

  environment.systemPackages = with pkgs; [
    pkgs.git
    pkgs.vim
    pkgs.wget
#    inputs.neovim-nightly.packages.${pkgs.system}.default
  ];


  system.stateVersion = "25.05";
  system.autoUpgrade.enable = false;
#  system.nixos.label = "build-${toString builtins.currentTime}";
}
