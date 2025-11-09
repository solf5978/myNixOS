{ pkgs, ... }:

{
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableBashIntegration = true;
      #      enableFishIntegration = true;
    };
    yazi = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
