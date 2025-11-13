{ colourPalette, hexHelper, fonts }: 
{
  eww = {
    windows = {
      # Dashboard Window
      dashboard = {
        geometry = { x = 50; y = 50; width = 600; height = 600; };
        layer = "above";
        workspace = "current";
        struts = { left = 0; right = 0; top = 0; bottom = 0; };
        decoration = false;
      };

      # Vertical Bar Window
      vbar = {
        geometry = { x = 650; y = 50; width = 60; height = 600; };
        layer = "above";
        workspace = "current";
        struts = { left = 0; right = 0; top = 0; bottom = 0; };
        decoration = false;
      };
    };

    # Dashboard Widgets
    widgets = {
      dashboardContainer = {
        type = "box";
        orientation = "vertical";
        spacing = 15;
        background = hexHelper colourPalette.base01 + "dd"; # 85% alpha
        borderRadius = 8;
        padding = 10;

        children = [
          # System Widget Placeholder
          { type = "box";
            height = 100;
            background = hexHelper colourPalette.base00 + "aa";
            borderRadius = 6;
            padding = 8;
            children = [
              { type = "label";
                text = "System: CPU / RAM / Disk / Net";
                font = fonts.monospace[0];
                color = hexHelper colourPalette.base05;
              }
            ];
          }

          # Date & Time Widget Placeholder
          { type = "box";
            height = 80;
            background = hexHelper colourPalette.base01 + "cc";
            borderRadius = 6;
            padding = 8;
            children = [
              { type = "label";
                text = "Date & Time: 00:00";
                font = fonts.monospace[0];
                color = hexHelper colourPalette.base05;
              }
            ];
          }

          # Media Widget Placeholder
          { type = "box";
            height = 80;
            background = hexHelper colourPalette.base01 + "cc";
            borderRadius = 6;
            padding = 8;
            children = [
              { type = "label";
                text = "Media: Song / Volume";
                font = fonts.monospace[0];
                color = hexHelper colourPalette.base05;
              }
            ];
          }

          # Notifications Widget Placeholder
          { type = "box";
            height = 80;
            background = hexHelper colourPalette.base01 + "cc";
            borderRadius = 6;
            padding = 8;
            children = [
              { type = "label";
                text = "Notifications: Alerts";
                font = fonts.monospace[0];
                color = hexHelper colourPalette.base05;
              }
            ];
          }

          # Cheatsheet Widget Placeholder
          { type = "box";
            height = 150;
            background = hexHelper colourPalette.base01 + "cc";
            borderRadius = 6;
            padding = 8;
            children = [
              { type = "label";
                text = "Cheatsheet: Keybinds";
                font = fonts.monospace[0];
                color = hexHelper colourPalette.base05;
              }
            ];
          }
        ];
      }

      # Vertical Bar Widgets
      verticalBar = {
        type = "box";
        orientation = "vertical";
        spacing = 10;
        background = hexHelper colourPalette.base01 + "dd";
        borderRadius = 8;
        padding = 10;

        children = [
          # App Icon Placeholder 1
          { type = "box";
            width = 40; height = 40;
            background = hexHelper colourPalette.base02;
            borderRadius = 6;
            hover = {
              expandWidth = 200;
              animation = "smooth";
            };
            children = [
              { type = "label";
                text = "App1";
                font = fonts.monospace[0];
                color = hexHelper colourPalette.base05;
              }
            ];
          }

          # App Icon Placeholder 2
          { type = "box";
            width = 40; height = 40;
            background = hexHelper colourPalette.base02;
            borderRadius = 6;
            hover = {
              expandWidth = 200;
              animation = "smooth";
            };
            children = [
              { type = "label";
                text = "App2";
                font = fonts.monospace[0];
                color = hexHelper colourPalette.base05;
              }
            ];
          }
        ];
      }
    };
  };
}

