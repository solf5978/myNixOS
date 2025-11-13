{ config, colourPalette, hexHelper, ... }:

{
  home.file."${config.xdg.configHome}/eww/dashBoard.yuck".text = ''
  ;; ─── Dashboard Window ─────────────────────────────────────────────
  (defwidget dashboard-main []
    (box
      :orientation "vertical"
      :space-evenly false
      :halign "center"
      :valign "center"
      :class "dashboard-container"
   
      ;; Header
      (box
        :class "dashboard-header"
        :halign "center"
        :valign "center"
        (label :text "  Dashboard" :class "dashboard-title"))
   
      ;; System block
      (box
        :class "dashboard-system"
        :orientation "horizontal"
        :space-evenly true
        (label :text " CPU" :class "icon")
        (progress :value "${"$(awk '/cpu / {print ($2+$4)*100/($2+$4+$5)}' /proc/stat)"}" :class "progress-bar")
        (label :text " RAM" :class "icon")
        (progress :value "${"$(free | awk '/Mem/ {print $3/$2 * 100.0}')"}" :class "progress-bar"))
   
      ;; Date / Time
      (box
        :class "dashboard-time"
        :orientation "vertical"
        :halign "center"
        (label :text "${"$(date '+%A, %B %d')"}" :class "date-label")
        (label :text "${"$(date '+%H:%M')"}" :class "time-label"))
   
      ;; Media controls
      (box
        :class "dashboard-media"
        :orientation "horizontal"
        :halign "center"
        :space-evenly true
        (button :onclick "playerctl previous" :class "media-button" "")
        (button :onclick "playerctl play-pause" :class "media-button" "")
        (button :onclick "playerctl next" :class "media-button" ""))
   
      ;; Notifications (simplified placeholder)
      (box
        :class "dashboard-notif"
        (label :text " Notifications" :class "notif-label"))
   
      ;; Cheat sheet
      (box
        :class "dashboard-cheatsheet"
        :orientation "vertical"
        (label :text "  Keybinds" :class "cheatsheet-title")
        (label :text "Alt + Enter → Terminal" :class "cheatsheet-line")
        (label :text "Alt + F → File Manager" :class "cheatsheet-line")
        (label :text "Alt + B → Browser" :class "cheatsheet-line")
        (label :text "Alt + Q → Close Window" :class "cheatsheet-line"))
    )
  )
  '';
}

