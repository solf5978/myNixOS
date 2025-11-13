{ config, pkgs, colourPalette, hexHelper, ... }:

{
  imports = [
    ./dashBoard.nix
		./script.nix
		./style.nix
		./verticalBar.nix
  ];
  # Eww package (use the one from nixpkgs, or replace with custom build)
  
  # Eww config files
  home.file = {
    # Dashboard main layout
    #"${config.xdg.configHome}/eww/dashBoard.yuck".text =
    #  import ./dashBoard.nix { inherit colourPalette hexHelper; };

    # Vertical bar (application launcher)
    #"${config.xdg.configHome}/eww/verticalBar.yuck".text =
    #  import ./verticalBar.nix { inherit colourPalette hexHelper; };

    # Styling for both windows
    #"${config.xdg.configHome}/eww/style.scss".text =
    #  import ./style.nix { inherit colourPalette hexHelper; };

    # Eww configuration file (entry point)
    "${config.xdg.configHome}/eww/eww.yuck".text = ''
      (include "./dashBoard.yuck")
      (include "./verticalBar.yuck")
      (include "./style.scss")

      ;; Define dashboard window
      (defwindow dashboard
        :monitor 0
        :class "dashboard"
        :geometry (geometry
          :x "center"
          :y "center"
          :width "70%"
          :height "80%")
        :exclusive true
        (dashboard-main))

      ;; Define vertical bar window
      (defwindow verticalBar
        :monitor 0
        :class "verticalBar"
        :geometry (geometry
          :x "100%-80px"
          :y "center"
          :width "60px"
          :height "80%")
        :exclusive true
        (verticalBar-main))
    '';
  };

  # Autostart Eww daemon (optional, can also add to Hyprland exec-once)
  systemd.user.services.eww = {
    Unit = {
      Description = "Eww Widgets";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.eww}/bin/eww daemon --config ${config.xdg.configHome}/eww";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}

