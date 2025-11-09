{ config, inputs, lib, pkgs, ... }:
let
  utils = inputs.nixCats.utils;
  #  generalUsageDef = { pkgs, name, ... } : {
  #    settings = {
  #      suffix-path = true;
  #      suffix-LD = true;
  #      wrapRc = false;
  #      aliases = [ "vim" "nvim" ];
  #      neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  #    };
  #    categories = {
  #      autoCompletions = true;
  #      colorScheme = "neovim-ayu";
  #      editorNavigation = true;
  #      generalSetup = true;
  #      gitPlugin = true;
  #      jy = true;
  #      lintFormatter = true;
  #      md = true;
  #      nm = true;
  #      nx = true;
  #    };
  #    extra = {
  #      nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
  #    };
  #  };
in {
  imports = [
    inputs.nixCats.homeModule
  ];
  config = {
    nixCats = {
      # see :help nixCats.flake.outputs.packageDefinitions
      # packageDefinitions.replace = {
      #  generalUsage = generalUsageDef;
      # };
      packageDefinitions.merge = {
        goDev = {
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

        rsDev = {
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
        tsDev = {
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
