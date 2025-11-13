{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      # Modern Replacement
      cat = "bat --paging=never";
      ls = "eza";
      la = "eza -a";
      ll = "eza -l --icons";
      lla = "eza -la --icons";
      tree = "eza --tree";
      du = "du-dust";
      find = "fd";
      grep = "rg";
    };
    interactiveShellInit = ''
      set -gx EDITOR nvim
      set -gx VISUAL nvim
      starship init fish | source
      status --is-interactive; and bass source ~/.nix-profile/etc/profile.d/nix.sh
    '';
  };
}
