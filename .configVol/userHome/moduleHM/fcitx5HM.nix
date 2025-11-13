{ config, pkgs, ... }:

{
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          pkgs.fcitx5-gtk
          pkgs.kdePackages.fcitx5-qt
          pkgs.fcitx5-mozc-ut
          pkgs.kdePackages.fcitx5-chinese-addons
          pkgs.kdePackages.fcitx5-configtool
          pkgs.fcitx5-table-extra
        ];
        settings = {
          inputMethod = {
            # [Group/0] Section
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "boshiamy";
            };
            # [Groups/0/Items/0] section
            "Groups/0/Items/0" = {
              Name = "keyboard-us";
              Layout = "";
            };
            
            # [Groups/0/Items/1] section
            "Groups/0/Items/1" = {
              Name = "boshiamy";
              Layout = "";
            };
            
            # [GroupOrder] section
            GroupOrder."0" = "Default";
          };
        };
      };
    };
  };
}
