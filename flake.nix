{
  description = "Basic Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = { self, nixpkgs, home-manager, yazi, ... } @ inputs : {
    nixosConfigurations.Cormick = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./coreUtils
        ./dotFiles
        ({ pkgs, ... }: {
          environment.systemPackages = [
            (yazi.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
              _7zz = pkgs._7zz-rar;
            })
          ];
        })
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bk";
          home-manager.users.solf5978 = import ./userHome/solf5978.nix;
        }
      ];
    };
  };
}
