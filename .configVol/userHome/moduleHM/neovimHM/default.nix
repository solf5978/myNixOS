{ config, lib, inputs, ... }: 
            # your alias may not conflict with your other packages.
let
  utils = inputs.nixCats.utils;
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

      luaPath = ./luaConf;
      # defaultPackageName = "generalUsage";
      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
        # to define and use a new category, simply add a new list to a set here,
        # and later, you will include categoryname = true; in the set you
        # provide when you build the package using this builder function.
        # see :help nixCats.flake.outputs.packageDefinitions for info on that section.

        # lspsAndRuntimeDeps:
        # this section is for dependencies that should be available
        # at RUN TIME for plugins. Will be available to PATH within neovim terminal
        # this includes LSPs
        lspsAndRuntimeDeps = {
          de = with pkgs; [
            alejandra
            lazygit
            lua-language-server
            nixd
            nixpkgs-fmt
            stylua
            #vscode-json-languageserver
            yaml-language-server
            yamllint
          ];

          fe = with pkgs; [
            eslint
            tailwindcss-language-server
          ];
          
          go = with pkgs; [
            gopls
            delve
            golint
            golangci-lint
            gotools
            go-tools
            go
          ];

          rs = with pkgs; [
            clippy
            rust-analyzer
            rustfmt
          ];

          ts = with pkgs; [
            typescript-language-server
          ];
        };

        # This is for plugins that will load at startup without using packadd:
        startupPlugins = {
          de = with pkgs.vimPlugins; {
            colorSheme = [
              everforest
              gruvbox-nvim
              kanagawa-nvim
              melange-nvim
              neovim-ayu
            ];
            baseSchema = [
              friendly-snippets
              SchemaStore-nvim
            ];
            baseUtil = [
              lualine-lsp-progress
              lualine-nvim
              auto-pairs
              nvim-lspconfig
              nvim-treesitter
              nvim-web-devicons
              plenary-nvim
              snacks-nvim        # Small QoL modules for Neovim                     # https://github.com/folke/snacks.nvim
              ts-comments-nvim   # Smarter comment handling for TypeScript/TSX      # https://github.com/folke/ts-comments.nvim
              which-key-nvim     # Displays keybindings in popup                    # https://github.com/folke/which-key.nvim
            ];         
            lazyLoader = [
              lze                # lazy-loading library for Neovim               # https://github.com/BirdeeHub/lze
              lzextras           # extra utilities for the “lze” loader          # https://github.com/BirdeeHub/lzextras
            ];
          };
        };

        # not loaded automatically at startup.
        # use with packadd and an autocommand in config to achieve lazy loading
        optionalPlugins = {
          de = with pkgs.vimPlugins; [
            blink-cmp            
            conform-nvim
            diffview-nvim
            git-conflict-nvim
            gitsigns-nvim
            lazygit-nvim
            nvim-dap
            nvim-dap-ui
            nvim-dap-virtual-text
            nvim-lint
            nvim-treesitter.withAllGrammars
 #           nvim-treesitter.withPlugins ( p: [ 
 #             p.bash
 #             p.json
 #             p.lux
 #             p.markdown
 #             p.nix
 #             p.regex
 #             p.vim
 #             p.yaml
 #             ])
            telescope-nvim
          ];

          fe = with pkgs.vimPlugins; [
 #           nvim-treesitter.withPlugins ( p: [
 #             p.css
 #             p.html
 #           ])
          ];
          go = with pkgs.vimPlugins; [
            nvim-dap-go
#            nvim-treesitter.withPlugins ( p: [ p.go ] )
          ];

          rs = with pkgs.vimPlugins; [
            nvim-dap-lldb
 #           nvim-treesitter.withPlugins ( p: [ p.rust ] )
          ];

          ts = with pkgs.vimPlugins; [
 #           nvim-treesitter.withPlugins ( p: [
 #             p.javascript
 #             p.prisma
 #             p.tsx
 #             p.typescript
 #           ])
          ];
        };

        sharedLibraries = {};
        environmentVariables = {};
        python3.libraries = {};
        extraWrapperArgs = {};
      });

      packageDefinitions.replace = {
        generalUsage = {pkgs, name, ... }: {
          settings = {
            suffix-path = true;
            suffix-LD = true;
            wrapRc = true;
            # unwrappedCfgPath = "/path/to/here";
            aliases = [ "nv" "nvim" ];
            neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
            #hosts.python3.enable = true;
            #hosts.node.enable = true;
          };
          # and a set of categories that you want
          # (and other information to pass to lua)
          # and a set of categories that you want
          categories = {
            de = {
              colorSheme = true;
              baseSchema = true;
              baseUtil = true;
              lazyLoader = true;
            };
          };
          # anything else to pass and grab in lua with `nixCats.extra`
          extra = {
            nixdExtras.nixpkgs = ''import ${pkgs.path} {}'';
          };
        };
      };
      packageDefinitions.merge = {
        goDev = { pkgs, ... }: {
          settings = { aliases = [ "nvgo" ]; };
          categories = {
            fe = true;
            go = true;
          };
        };
      };
      packageDefinitions.merge = {
        rsDev = { pkgs, ... }: {
          settings = { aliases = [ "nvrs" ]; };
          categories = {
            fe = true;
            rs = true;
          };
        };
      };
      packageDefinitions.merge = {
        tsDev = { pkgs, ... }: {
          settings = { aliases = [ "nvts" ]; hosts.node.enable = true; };
          categories = {
            fe = true;
            ts = true;
          };
        };
      };
    };
  };
}
