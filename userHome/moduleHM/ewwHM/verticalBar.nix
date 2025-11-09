{ config, colourPalette, hexHelper, ... }:

{
  home.file."${config.xdg.configHome}/eww/verticalBar.yuck".text = ''
  ;; ─── Vertical Bar ─────────────────────────────────────────────
  (defwidget verticalBar-main []
    (box
      :orientation "vertical"
      :space-evenly true
      :halign "center"
      :valign "center"
      :class "vbar-container"
  
      ;; 🧭 System Tools
      (button :onclick "wezterm" :tooltip "Terminal" :class "vbar-icon" "")
      (button :onclick "thunar" :tooltip "File Manager" :class "vbar-icon" "")
      (button :onclick "firefox" :tooltip "Web Browser" :class "vbar-icon" "")
      (button :onclick "obs" :tooltip "OBS Studio" :class "vbar-icon" "")
      (button :onclick "vlc" :tooltip "Media Player" :class "vbar-icon" "")
  
      ;; 🗄️ Development & Editing
      (button :onclick "helix" :tooltip "Helix Editor" :class "vbar-icon" "")
      (button :onclick "nvim" :tooltip "Neovim" :class "vbar-icon" "")
      (button :onclick "zed" :tooltip "Zed Editor" :class "vbar-icon" "󰷢")
  
      ;; 🧰 Utilities
      (button :onclick "pavucontrol" :tooltip "Audio Control" :class "vbar-icon" "")
      (button :onclick "blueman-manager" :tooltip "Bluetooth Manager" :class "vbar-icon" "")
      (button :onclick "qalculate-gtk" :tooltip "Calculator" :class "vbar-icon" "")
      (button :onclick "yad --calendar" :tooltip "Calendar" :class "vbar-icon" "")
  
      ;; 🏁 System Actions
      (button :onclick "hyprctl dispatch exit" :tooltip "Logout" :class "vbar-icon power" "")
    )
  )
  '';
}
