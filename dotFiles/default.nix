{ pkgs, ... }:

{
  imports = 
    [
      ./hyprland.nix
      ./netWorking.nix
      ./regreet.nix
      ./yazi.nix
    ];
}
