{ config, lib, inputs, ... }:
let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];
  config = {
    nixCats = {
      categoryDefinitions.replace = ({ pkgs, settings, categories, extra, name, mkPlugin, ... }@packageDef: {
        # not loaded automatically at startup.
        # use with packadd and an autocommand in config to achieve lazy loading
        optionalPlugins = {
          autoCompletions = with pkgs.vimPlugins; [
                blink-cmp                      # Fast and modern autocompletion plugin # https://github.com/blink-cmp/blink.cmp
                cmp-buffer                     # Source for buffer words               # https://github.com/hrsh7th/cmp-buffer
                cmp-cmdline                    # Command-line completion               # https://github.com/hrsh7th/cmp-cmdline
                cmp-cmdline-history            # Command-line history source           # https://github.com/dmitmel/cmp-cmdline-history
                cmp-nvim-lsp                   # LSP completion source                 # https://github.com/hrsh7th/cmp-nvim-lsp
                cmp-nvim-lsp-signature-help    # Function signature help               # https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
                cmp-path                       # Source for filesystem paths           # https://github.com/hrsh7th/cmp-path
                lspkind-nvim                   # VSCode-like pictograms in completion  # https://github.com/onsails/lspkind.nvim
                nvim-cmp                       # Completion framework for Neovim       # https://github.com/hrsh7th/nvim-cmp
          ];
  
          debugHelper = with pkgs.vimPlugins; [
                fidget-nvim                    # LSP progress UI                       # https://github.com/j-hui/fidget.nvim
                nvim-dap                       # Debug Adapter Protocol client         # https://github.com/mfussenegger/nvim-dap
                nvim-dap-ui                    # UI for nvim-dap                       # https://github.com/rcarriga/nvim-dap-ui
                nvim-dap-virtual-text          # Virtual text for variables            # https://github.com/theHamsta/nvim-dap-virtual-text
          ];
  
          editorNavigation = with pkgs.vimPlugins; [
                flash-nvim                     # Motion and jump navigation            # https://github.com/folke/flash.nvim
                hop-nvim                       # EasyMotion-style movement             # https://github.com/smoka7/hop.nvim
                leap-nvim                      # Modern motion plugin                  # https://github.com/ggandor/leap.nvim
                pkgs.neovimPlugins.nap         # Extra navigation motions              # https://github.com/rktjmp/nap.nvim
          ];
  
          generalSetup = with pkgs.vimPlugins; [
                vim-startuptime                # Measure Neovim startup time           # https://github.com/dstein64/vim-startuptime
          ];
  
          gitPlugin = with pkgs.vimPlugins; [
                diffview-nvim                  # Side-by-side diff viewer              # https://github.com/sindrets/diffview.nvim
                git-conflict-nvim              # Conflict resolution helper            # https://github.com/akinsho/git-conflict.nvim
                gitsigns-nvim                  # Git signs in the sign column          # https://github.com/lewis6991/gitsigns.nvim
                lazygit-nvim                   # Lazygit integration                   # https://github.com/kdheepak/lazygit.nvim
          ];
          goDebug = with pkgs.vimPlugins; [
             gopkgs # Lists Go packages # https://github.com/uudashr/gopkgs
             go-tools # Collection of Go development tools # https://github.com/go-tools
             gotestsum # Test summary formatter # https://github.com/gotestyourself/gotestsum
          ];
  
          lintFormatter = with pkgs.vimPlugins; [
                conform-nvim                   # Formatter engine                      # https://github.com/stevearc/conform.nvim
                lspsaga-nvim                   # LSP UI enhancements                   # https://github.com/nvimdev/lspsaga.nvim
                nvim-lint                      # Lightweight linter framework          # https://github.com/mfussenegger/nvim-lint
                nvim-lspconfig                 # Easy LSP configuration                # https://github.com/neovim/nvim-lspconfig
          ];
  
          teleScope = with pkgs.vimPlugins; [
                pkgs.neovimPlugins.telescope-egrepify  # Live grep enhancements          # https://github.com/nvim-telescope/telescope-egrepify
                telescope-fzf-native-nvim      # Native FZF sorter for Telescope        # https://github.com/nvim-telescope/telescope-fzf-native.nvim
                telescope-nvim                # Core fuzzy finder framework            # https://github.com/nvim-telescope/telescope.nvim
                telescope-ui-select-nvim      # UI selector integration (vim.ui.select)# https://github.com/nvim-telescope/telescope-ui-select.nvim
                telescope-undo-nvim           # Undo tree browser for Telescope        # https://github.com/debugloop/telescope-undo.nvim
          ];
  
          treeSitter = with pkgs.vimPlugins; [
                nvim-treesitter.withAllGrammars       # Core Treesitter plugin with all parsers          # https://github.com/nvim-treesitter/nvim-treesitter
                vim-illuminate                        # Highlight other occurrences of word under cursor  # https://github.com/RRethy/vim-illuminate
          ];
        };
      });
    };
  };
}
