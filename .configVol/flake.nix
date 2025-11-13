{
  description = "Basic Flake";
  inputs = {
    # --- Nix ---
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixCats = {
      url = "github:BirdeeHub/nixCats-nvim";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    # --- Home Manager ---
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-unstable = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    # --- Editor ---
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    helix.url = "github:helix-editor/helix";
    # --- Window Manager ---
    hyprland.url = "github:hyprwm/Hyprland";
    # --- Filer Manger ---
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = { 
  self, 
  nixpkgs, 
  nixpkgs-unstable, 
  nixCats, 
  home-manager,
  home-manager-unstable,
  ... } @ inputs : 
  {
    nixosConfigurations.Cormick = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./coreUtils
        ./dotFiles
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bk";
          home-manager.users.solf5978 = import ./userHome/solf5978.nix;
	  home-manager.users.defaultUserShell = fish;
          home-manager.extraSpecialArgs = let
              colourTheme = import ./colourTheme/verdantCloak.nix;
            in { 
              inherit inputs;
              # colourTheme = import ./colourTheme/verdantCloak.nix;
              colourPalette = colourTheme.colourPalette;
              hexHelper = hexCode: "rgb(${hexCode})";
            };
        }
      ];
    };
  };
}
