{ pkgs, colourPalette, hexHelper, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "Hack";
	format = "<b>%s</b>\n%b";
	follow = "mouse";
      };

      urgency_low = {
        background = "#2E3440";
	foreground = "DD8DEE9";
	timeout = 10;
      };

      urgency_normal = {
        background = "#2E3440";
	foreground = "DD8DEE9";
	timeout = 10;
      };
    };
  };
}
