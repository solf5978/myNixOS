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
        # This is for plugins that will load at startup without using packadd:
        startupPlugins = {
          nm = with pkgs.vimPlugins; {
            # Color themes
            colorScheme = [
              everforest-nvim    # “Everforest” soft green theme for Neovim       # https://github.com/neanias/everforest-nvim
              gruvbox.nvim       # “Gruvbox” retro contrast theme for Neovim     # https://github.com/ellisonleao/gruvbox.nvim
              kanagawa.nvim      # “Kanagawa” inspired theme for Neovim          # https://github.com/rebelot/kanagawa.nvim
              melange-nvim       # “Melange” warm pastel theme for Neovim        # https://github.com/savq/melange-nvim
              neovim-ayu         # “Ayu” colour‑theme for Neovim                 # https://github.com/Shatur/neovim-ayu
            ];
            # Base LSP / schemas / snippets
            baseSchema = [
              friendly-snippets  # Predefined snippets collection                  # https://github.com/rafamadriz/friendly-snippets
              SchemaStore-nvim   # JSON schemas for Neovim                         # https://github.com/b0o/SchemaStore.nvim
            ];
            # Base utilities & early plugins
            baseUtil = [
              ddressing-nvim     # utility library                                 # https://github.com/BirdeeHub/ddressing.nvim
              lualine-lsp-progress # LSP progress indicator for lualine            # https://github.com/arkav/lualine-lsp-progress
              lualine-nvim       # Fast, customizable statusline                    # https://github.com/nvim-lualine/lualine.nvim
              mini-nvim          # Modular Lua utilities collection                 # https://github.com/echasnovski/mini.nvim
              nvim-autopairs     # Automatically insert and manage matching pairs   # https://github.com/windwp/nvim-autopairs
              nvim-illuminate    # Highlight other occurrences of word under cursor # https://github.com/RRethy/vim-illuminate
              nvim-nio           # helper library                                   # https://github.com/BirdeeHub/nvim-nio
              nvim-ts-autotag    # Automatically close/rename HTML/JSX tags        # https://github.com/windwp/nvim-ts-autotag
              nvim-treesitter    # Core Treesitter plugin with parsers             # https://github.com/nvim-treesitter/nvim-treesitter
              nvim-treesitter-textobjects # Provides text objects via Treesitter   # https://github.com/nvim-treesitter/nvim-treesitter-textobjects
              nvim-ts-context-commentstring # Dynamic comment string based on context  # https://github.com/JoosepAlviste/nvim-ts-context-commentstring
              nvim-web-devicons  # File icons for Neovim                             # https://github.com/nvim-tree/nvim-web-devicons
              nui-nvim           # UI component library                             # https://github.com/MunifTanjim/nui.nvim
              plenary-nvim       # Lua utility library                               # https://github.com/nvim-lua/plenary.nvim
              rainbow-delimiters-nvim # Highlight nested parentheses/brackets      # https://github.com/HiPhish/rainbow-delimiters.nvim
              snacks-nvim        # Small QoL modules for Neovim                     # https://github.com/folke/snacks.nvim
              ts-comments-nvim   # Smarter comment handling for TypeScript/TSX    # https://github.com/folke/ts-comments.nvim
              vim-matchup        # Enhanced % motion and delimiter matching       # https://github.com/andymass/vim-matchup
              vim-sleuth         # Auto-detects and sets indent/tab settings       # https://github.com/tpope/vim-sleuth
              vim-repeat         # Repeat plugin for dot (.) support                # https://github.com/tpope/vim-repeat
              wezterm-nvim      # GPU-accelerated cross-platform terminal emulator  # https://github.com/willothy/wezterm.nvim/
              which-key-nvim     # Displays keybindings in popup                   # https://github.com/folke/which-key.nvim
            ];         
            # Lazy loader
            lazyLoader = [
              lze                # lazy-loading library for Neovim               # https://github.com/BirdeeHub/lze
              lzextras           # extra utilities for the “lze” loader          # https://github.com/BirdeeHub/lzextras
            ];
          };
        };
      });
    };
  };
}
