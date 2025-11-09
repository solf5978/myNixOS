{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat";
      ls = "eza";
      la = "eza -a";
      ll = "eza -l --icons";
      lla = "eza -la --icons";
      tree = "eza --tree";
      du = "du-dust";
      find = "fd";
      grep = "rg";
    };
  };
}
