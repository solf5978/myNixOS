{ inputs, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.imagemagick
    pkgs.poppler
    pkgs.resvg
  ];
}
