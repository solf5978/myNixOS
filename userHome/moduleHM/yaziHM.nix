{ pkgs, ... }:

#let
 # # Fetch Yazi plugins from GitHub. Adjust 'rev' and 'hash' as needed.
 # yazi-plugins = pkgs.fetchFromGitHub {
 #   owner = "yazi-rs";
 #   repo = "plugins";
 #   rev = "a_specific_commit_hash"; # Replace with a recent commit hash
 #   hash = "b65a88075a824e4304dca5428ba05de1404fa635"; # Replace with the correct SHA256 hash
 # };
 #
 # # Example of fetching a specific external plugin
 # starship-yazi = pkgs.fetchFromGitHub {
 #   owner = "Rolv-Apneseth";
 #   repo = "starship.yazi";
 #   rev = "another_specific_commit_hash"; # Replace with a recent commit hash
 #   sha256 = "sha256-another_valid_sha256_hash"; # Replace with the correct SHA256 hash
 # };
#in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true; # Set to true if you use Zsh
    shellWrapperName = "y"; # The command to launch Yazi

    # Yazi settings, mirroring the structure of yazi.toml
    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "natural";
        sort_sensitive = true;
        sort_reverse = false;
        sort_dir_first = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
        image_filter = "lanczos3";
      };
    };

 #   # Yazi plugins
 #   plugins = {
 #     chmod = "${yazi-plugins}/chmod.yazi";
 #     "full-border" = "${yazi-plugins}/full-border.yazi";
 #     "toggle-pane" = "${yazi-plugins}/toggle-pane.yazi";
 #     starship = starship-yazi; # Integrating the fetched starship plugin
 #   };
 #
 #   # Lua initialization script for plugins
 #   initLua = ''
 #     require("full-border"):setup()
 #     require("starship"):setup()
 #   '';

    # Keymap configuration
    keymap = {
      mgr.prepend_keymap = [
        { on = "T"; run = "plugin toggle-pane max-preview"; desc = "Maximize or restore the preview pane"; }
        { on = [ "c" "m" ]; run = "plugin chmod"; desc = "Chmod on selected files"; }
        { on = [ "<C-q>" ]; run = "close"; desc = "Close Yazi"; }
        { on = "d"; run = "yank --cut"; desc = "Cut selected files"; }
        { on = "D"; run = "remove --force"; desc = "Remove selected files (force)"; }
      ];
    };
  };
}
