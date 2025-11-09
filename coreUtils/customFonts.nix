{ config, pkgs, ... }:

{
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      # Functional Fonts
      pkgs.noto-fonts-cjk-sans					# Chinese Japanese Korean Supported
      pkgs.source-han-serif					# Golden Rule
      # Fallback Rule
      pkgs.mplus-outline-fonts.githubRelease			# Japanese
      pkgs.nerd-fonts.noto					# Regular Font
      pkgs.sarasa-gothic					# Highly Supported All Languages
      # Optional Brush Style
      pkgs.arphic-ukai
      # Symbol Library
      pkgs.nerd-fonts.symbols-only
      # Preferredd Fonts
      pkgs.comic-mono
      pkgs.dina-font
      pkgs.hack-font
      pkgs.nerd-fonts.fira-code
      pkgs.nerd-fonts.inconsolata
      pkgs.proggyfonts
      pkgs.zpix-pixel-font
    ];
    fontconfig = {
      defaultFonts = {
        serif = [
	  "Source Han Serif"
	  "Noto Nerd Font"
	];

	sansSerif = [
	  "Noto Sans CJK TW"
	  "Noto Sans Mono Nerd Font"
	];

	monospace = [
	  "Sarasa Mono"
	  "Comic Mono"
	  "Noto Sans Mono Nerd Font"
	];
      };
    };
  };
}
