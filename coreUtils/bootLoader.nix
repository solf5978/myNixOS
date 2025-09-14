{ config, pkgs, ... }:

{
  boot = {
    kernelModules = [ "kvm-intel" "nouveau" ];
    kernelParams = [ "module_blacklist=i915" ]; #Block Intel Integrated Graphic Cards
    blacklistedKernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" "nvidia_modeset" ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ ];
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" "btrfs" ];
    };

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      systemd-boot = {
        enable = true;
        editor = false;
      };
    };
    supportedFilesystems = [ "btrfs" "ntfs" ];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        pkgs.mesa
      ];
    };
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
}
