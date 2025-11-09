{ config, lib, inputs, pkgs, ... }:
let
  utils = inputs.nixCats.utils;
  #envVariables = import ./envVariables.nix { inherit pkgs; };
  lspRuntimeDep = import ./lspRuntimeDep.nix { inherit config lib inputs pkgs; };
  optionalPlugins = import ./optionalPlugins.nix { inherit config lib inputs pkgs; };
  #pkgsDef = import ./pkgsDef.nix { inherit config lib inputs pkgs; };
  startPlugins = import ./startPlugins.nix { inherit  config lib inputs pkgs; };
  #shareddLib = import ./sharedLib.nix { inherit pkgs; };
in {
  imports = [
    inputs.nixCats.homeModule
  ];
  config = {
    nixCats = {
      enable = true;
      nixpkgs_version = inputs.nixpkgs;
      addOverlays = /* (import ./overlays inputs) ++ */ [
        (utils.standardPluginOverlay inputs)
      ];
      packageNames = [ 
        "generalUsage"
        "goDev"
        "rsDev"
        "tsDev"
      ];
      luaPath = ./.;
      # defaultPackageName = "generalUsage";

      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
        lspAndRuntimeDeps = lspRuntimeDep;
        startupPlugins = startPlugins;
        optionalPlugins = optionalPlugins;
        sharedLibraries = {
          generalUsage = with pkgs; [ ];
        };
        environmentVariables = {
        };

        # categories of the function you would have passed to withPackages
        # python3.libraries = {
        #    test = [ (_:[]) ];
        # };

        extraWrapperArgs = {
          # test = [
          #   '' --set CATTESTVAR2 "It worked again!"''
          # ];
        };
      });
      packageDefinitions.replace = {
        generalUsage = { pkgs, name, ... } : {
          settings = {
            suffix-path = true;
            suffix-LD = true;
            wrapRc = false;
            aliases = [ "vim" "nvim" ];
            neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
          };
          categories = {
            autoCompletions = true;
            colorScheme = "neovim-ayu";
            editorNavigation = true;
            generalSetup = true;
            gitPlugin = true;
            jy = true;
            lintFormatter = true;
            md = true;
            nm = true;
            nx = true;
          };
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
      # see :help nixCats.flake.outputs.packageDefinitions
      packageDefinitions.merge = {
        goDev = { pkgs, name, ... } : {
          settings = { wrapRc = true; };
          categories = {
            colorScheme = "gruvbox.nvim";
            cs = true;
            he = true;
            go = true;
            debugHelper = true;
            goDebug = true;
            teleScope = true;
            treeSitter = true;
          };
          host.go.enable = true;
        };
      };
      packageDefinitions.merge = {
        rsDev = { pkgs, name, ... } : {
          settings = { wrapRc = true; };
          categories = {
            colorScheme = "everforest-nvim";
            cs = true;
            he = true;
            rs = true;
            debugHelper = true;
            teleScope = true;
            treeSitter = true;
          };
          host.rust.enable = true;
        };
      };
      packageDefinitions.merge = {
        tsDev = { pkgs, name, ... } : {
          settings = { wrapRc = true; };
          categories = {
            colorScheme = "melange-nvim";
            cs = true;
            he = true;
            ts = true;
            debugHelper = true;
            teleScope = true;
            treeSitter = true;
          };
          host.node.enable = true;
        };
      };
    };
  };
}
