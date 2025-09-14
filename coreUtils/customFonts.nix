{ config, pkgs, ... }:

{
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      pkgs.noto-fonts
      pkgs.nerd-fonts.noto
      pkgs.comic-mono
      pkgs.dina-font
      pkgs.fira-code
      pkgs.nerd-fonts.fira-code
      pkgs.fira-code-symbols
      pkgs.hack-font
      pkgs.inconsolata
      pkgs.nerd-fonts.inconsolata
      pkgs.mplus-outline-fonts.githubRelease
      pkgs.proggyfonts
      pkgs.nerd-fonts.symbols-only
      pkgs.source-han-sans
      pkgs.source-han-serif
      pkgs.noto-fonts-cjk-sans
      pkgs.ipaexfont
      pkgs.wqy_zenhei
      pkgs.wqy_microhei
      pkgs.arphic-ukai
      pkgs.arphic-uming
      pkgs.sarasa-gothic
      pkgs.zpix-pixel-font
    ];
  };
}
