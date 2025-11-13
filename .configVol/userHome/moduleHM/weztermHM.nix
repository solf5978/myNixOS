{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    extraConfig = ''
      return {
        font = wezterm.font_with_fallback({ "FiraCode Nerd Font" }),
        color_scheme = "Catppuccin Mocha",
        enable_tab_bar = false,
	default_prog = { 'etc/profiles/per-user/solf5978/bin/fish' }
      }
    '';
  };
  programs.starship = {
    enable = true;
      settings = {
        add_newline = false;
        aws.disabled = true;
        gcloud.disabled = true;
        line_break.disabled = true;
        character.success_symbol = "[❯](bold green)";
        character.error_symbol = "[❯](bold red)";
        directory.truncate_to_repo = false;
    };
  };
}
