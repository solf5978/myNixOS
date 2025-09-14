{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e83ad04a-1065-4f49-96a2-1b061c0857b4";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=zstd" "discard=async" "commit=180" "space_cache=v2" "ssd" "autodefrag" "subvol=@" ];
    };

  fileSystems."/.swapVol" =
    { device = "/dev/disk/by-uuid/e83ad04a-1065-4f49-96a2-1b061c0857b4";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=none" "discard=async" "ssd" "subvol=@.swapVol" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/e83ad04a-1065-4f49-96a2-1b061c0857b4";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=zstd" "discard=async" "commit=180" "space_cache=v2" "ssd" "autodefrag" "subvol=@.recordVol" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/e83ad04a-1065-4f49-96a2-1b061c0857b4";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=zstd" "discard=async" "commit=180" "space_cache=v2" "ssd" "autodefrag" "subvol=@nix" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/6cb640e0-254e-4ee4-be84-65a85c9c00f2";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=zstd" "discard=async" "commit=180" "space_cache=v2" "ssd" "autodefrag" "subvol=@home" ];
    };

  fileSystems."/home/solf5978/.configVol" =
    { device = "/dev/disk/by-uuid/6cb640e0-254e-4ee4-be84-65a85c9c00f2";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=zstd" "discard=async" "commit=180" "space_cache=v2" "ssd" "autodefrag" "subvol=@.configVol" ];
    };

  fileSystems."/home/solf5978/Pictures" =
    { device = "/dev/disk/by-uuid/adc73f80-81e2-4c77-a074-5246a81419f3";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=zstd" "discard=async" "commit=180" "space_cache=v2" "ssd" "autodefrag" "subvol=@mediaVol" ];
    };

  fileSystems."/home/solf5978/Videos" =
    { device = "/dev/disk/by-uuid/adc73f80-81e2-4c77-a074-5246a81419f3";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=zstd" "discard=async" "commit=180" "space_cache=v2" "ssd" "autodefrag" "subvol=@mediaVol" ];
    };

  fileSystems."/home/solf5978/Courses" =
    { device = "/dev/disk/by-uuid/adc73f80-81e2-4c77-a074-5246a81419f3";
      fsType = "btrfs";
      options = [ "defaults" "noatime" "compress=zstd" "discard=async" "commit=180" "space_cache=v2" "ssd" "autodefrag" "subvol=@courseVol" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3510-6F50";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ { device = "/.swapVol/swapfile"; size = 8 * 1024; } ];

}
