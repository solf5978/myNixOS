{ config, lib, ... }:

{
  networking = {
    hostName = "Cormick";
    hosts = {
      "127.0.0.1" = [ "Cormick" ];
      "::1" = [ "Cormick" ];
      "127.0.1.1" = [ "Cormick" ];
    };
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    wireless.enable = false;
    enableIPv6 = true;
    firewall.enable = true;
  };
}
