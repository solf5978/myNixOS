{ pkgs, ...}:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
	position = "top";
	height = 30;

	modules-left = [
	  "hyprland/workspaces"
	  "hyprland/mode"
	];

	modules-center = [
	  "clock"
	];

	modules-right = [
	  "tray"
	  "pulseaudio#sink"
	  "pulseaudio#source"
	  "network"
	  "temperature"
	  "memory"
	  "cpu"
	];

	"hyprland/workspaces" = {
	  format = "{icon}";
	  format-icons = {
	    "1" = "󰎤";
	    "2" = "󰎧";
	    "3" = "󰎪";
	    "4" = "󰎭";
	    "5" = "󰎱";
	    "6" = "󰎳";
	    "7" = "󰎶";
	    "8" = "󰎹";
	    "9" = "󰎼";
	    "urgent" = "󰅗";
	    "default" = "󰎡";
	  };
	  "on-click" = "activate";
        };
        
	"clock" = {
	  format = "󰔚 {:%I:%M %p}";
	  format-alt = "󰔛 {:%A, %B %d}";
	  tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendddar}</small></tt>";
	};

	"tray" = {
	  icon-size = 18;
	  spacing = 10;
	};

	"pulseaudio#sink" = {
	  format = "{} {volume}%";
	  format-muted = " Muted";
	  format-icons.default = [ "" "" "" ];
	  "on-click" = "pavucontrol -t 4";
	};

	"pulseaudido#source" = {
	  format = "{format_source}";
	  format-source = "󰍮 {volume}%";
	  format-source-muted = "󰍭 Muted";
	  "on-click" = "pavucontrol -t 4";
        };
	"network" = {
	  format-ethernet = "󰲐 {ifname}";
	  format-disconnected = "󰲜 Disconnected";
	};

	"temperature" = {
	  "hwmon-path" = "/sys/class/hwmon/hwmon2/temp1_input";
	  format = " {temperatureC} °C";
	  format-critical = " {temperatureC} °C";
	  cssClass = "cpu-temp";
	  critical-thresholdd = 65;
	};

	"cpu" = {
	  format = " {usage}%";
	};

	"memory" = {
	  format = "󰍛 {}%";
	};
      };
    };

    style = ''
      * {
        font-family: " Symbols Nerdd Font";
	font-size: 14px;
	border: none;
	border-radius: 0;
      }

      window#waybar {
        background: rgba(46, 52, 64, 0.8);
	color: #D8DEE9;
      }

      #workspaces button {
        padding: 0 10px;
	color: #81A1C1;
      }

      #workspaces button.active {
        color: #EBCB8B;
	background-color: rgba(255, 255, 255, 0.1);
      }

      #clock, #temperature, #cpu, #memory, #network, #pulseaudio#sink, #pulseaudio#source, #tray {
        padding: 0 10px;
	margin: 0 4px;
      }

      #temperature {
        color: #A3BE8C;
      }

      #temperature.critical {
        color: #BF616A;
      }
    '';
  };
}
