{ config, inputs, lib, ... }:

{
  programs = {
    direnv.enable = true;
    firefox.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    iftop.enable = true;
    iotop.enable = true;
    regreet.enable = true;
  };

  security = {
    sudo.enable = true;
    polkit.enable = true;
    rtkit.enable = true;
  };

  services = {
    greetd.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;
    };
    pulseaudio.enable = false;
    timesyncd.enable = true;
    sysstat.enable = true;
    udisks2.enable = true;
  };
}
