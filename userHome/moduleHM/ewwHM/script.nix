{ pkgs, ... }:

{
  # Place the script into ~/.config/eww/
  home.file.".config/eww/toggleEww.sh" = {
    text = ''
    #!/usr/bin/env bash
    if eww windows | grep -q "dashBoard"; then
      eww update dashOpacity=0
      sleep 0.1
      eww close dashBoard verticalBar
    else
      eww open dashBoard verticalBar
      sleep 0.2
      eww update dashOpacity=1
    fi
    '';
    executable = true;
  };
}

