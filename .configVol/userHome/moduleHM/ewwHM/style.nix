{ config, colourPalette, hexHelper, ... }:

{
  home.file."${config.xdg.configHome}/eww/style.scss".text = ''
  /* ─── Eww Stylesheet ───────────────────────────── */

  $bg: ${hexHelper colourPalette.base00};
  $bg-alt: ${hexHelper colourPalette.base01};
  $fg: ${hexHelper colourPalette.base05};
  $accent: ${hexHelper colourPalette.base0D};
  $shadow: rgba(0, 0, 0, 0.4);
  $radius: 12px;
  $blur: 20px;
  
  .dashboard-container {
    background-color: $bg;
    color: $fg;
    border-radius: $radius;
    padding: 20px;
    box-shadow: 0 4px 10px $shadow;
    backdrop-filter: blur($blur);
    min-width: 800px;
    min-height: 500px;
  }
  
  .dashboard-title {
    font-size: 24px;
    font-weight: bold;
    color: $accent;
  }
  
  .dashboard-time .date-label {
    font-size: 18px;
    color: $fg;
    opacity: 0.8;
  }
  
  .dashboard-time .time-label {
    font-size: 48px;
    font-weight: bold;
    color: $accent;
  }
  
  .progress-bar {
    background-color: $bg-alt;
    color: $accent;
    border-radius: 6px;
    min-width: 100px;
  }
  
  .media-button {
    background-color: transparent;
    border: 1px solid $accent;
    color: $accent;
    border-radius: 50%;
    padding: 6px;
    transition: all 0.2s ease;
    &:hover {
      background-color: $accent;
      color: $bg;
    }
  }
  
  .vbar-container {
    background-color: rgba($bg, 0.6);
    border-radius: 16px;
    box-shadow: 0 0 10px $shadow;
    padding: 12px;
    width: 60px;
    align-items: center;
  }
  
  .vbar-icon {
    font-size: 22px;
    color: $fg;
    margin: 10px 0;
    transition: all 0.2s ease;
    &:hover {
      color: $accent;
      transform: scale(1.1);
    }
  }
  
  .cheatsheet-line {
    font-size: 14px;
    opacity: 0.7;
    margin-top: 3px;
  }
  
  .cheatsheet-title {
    font-weight: bold;
    color: $accent;
  }
  '';
}

