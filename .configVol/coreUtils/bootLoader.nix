{ config, pkgs, ... }:

{
  boot = {
    kernelModules = [ "kvm-intel" "nouveau" "i2c-dev" ];
    # Nvidia # Failed Detect Monitors
    #kernelModules = [ "kvm-intel" "nvidia" "nvidia_drm" "nvidia_modeset" "nvidia_uvm" "i2c-dev" ];
    #kernelModules = [ "kvm-intel" "nvidia" "i2c-dev" ];
    kernelParams = [ 
      "module_blacklist=i915" 		# Block Intel Integrated Graphic Cards
      "nouveau.config=NvMSI=0"		# Suggested from GPT to solve ttm_validate, disable message signaled interrupts 
      "nouveau.config=NvGspRM=1"
      "nouveau.debug=info"		# 
      "nouveau.pstate=1"		# Allow manual reclocking
      "drm_kms_helper.poll=0"		# Quiet down HDMI error spam
      # Proprietary Nvidia Drivers Pramas
      # "nvidia-drm.modeset=1"
      # "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
    blacklistedKernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" "nvidia_modeset" ];
    #blacklistedKernelModules = [ "nouveau" ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ ];
    initrd = {
      kernelModules = [ ];
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" "btrfs" ];
    };

    loader = {
      timeout = 15;
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
    # Official Nvidia
    #nvidia = {
    #  modesetting.enable = true;
    #  powerManagement.enable = true;
    #  open = true;
    #  nvidiaSettings = true;
    #  package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    #};
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

