{ config, pkgs, ... }:

{
  programs.neovim = 
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraConfig = ''
	set number relativenumber      
	
      ''
      plugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        type = "lua";
        config = ''
	  require(\"Comment\").setup()
	'';
      };
     ];
     environment.variables.EDITOR = "nvim";
}

