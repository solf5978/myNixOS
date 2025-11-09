{ config, inputs, pkgs, ... }:

{
  programs.neovim = {
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    
    # Languages
    withNodeJs = true;
  };

  home.packages = with pkgs ; [
    pkgs.rust-analyzer							# Rust Analyzer
    pkgs.gopls								# Golang
    pkgs.nil								# Nix
    pkgs.nodePackages.typescript-language-server			# TypeScript
    #pkgs.nodePackages.vscodde-css-lsp					# CSS
    #pkgs.nodePackages.vscode-html-lsp					# HTML
    #pkgs.bash-language-server						# Bash
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    # Core
    catppuccin-nvim							# Theme
    # AI Partner
    (windsurf-vim.overrideAttrs ( oldAttrs: {				# Codeium/Windsurf
      buildPhase = "true";
    }))
    # UI/UX
    lualine-nvim							# Status Line
    telescope-nvim							# Fuzzy Finder
    plenary-nvim							# Fuzzy Finder Dep.
    nvim-tree-lua							# File Tree
    which-key-nvim							# Typed Keystroke
    nvim-treesitter.withAllGrammars					# Syntax Highlighting
    # LSP & Auto-Completion
    nvim-lspconfig							# Main Engine Helper
    nvim-cmp								# Main Auto-Completion
    cmp-nvim-lsp							# Completion Source
    cmp-buffer								# Completion Source
    cmp-path								# Completion Source
  ];

  programs.neovim.extraLuaConfig = ''
    -- Leader
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
    -- Options
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.mouse = "a"
    vim.opt.clipboard = "unnamedplus" 
    vim.opt.breakindent = true
    vim.opt.undofile = true
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true

    -- Global Keymap
    -- i -> INSERT Mode | n -> NORMAL Mode | Leader -> SPACE | Press SPACE Then e
    local mapKey = vim.keymap.set
    local opts = { noremap = true, silent = true }

    mapKey("n", "<leader>e", ":NvimTreeToggle<CR>", opts)		-- File Tree
    mapKey("n", "<leader>f", ":Telescope find_files<CR>", opts)		-- Fuzzy Finder
    mapKey("n", "<leader>s", ":Telescope live_grep<CR>", opts)		-- Text Search

    -- Navigation
    mapKey("n", "<C-h>", "<C-w>h", opts)
    mapKey("n", "<C-j>", "<C-w>j", opts)
    mapKey("n", "<C-k>", "<C-w>k", opts)
    mapKey("n", "<C-l>", "<C-w>l", opts)

    -- Plugin Setup
    vim.cmd.colorscheme "catppuccin-macchiato"				-- Theme
    require('lualine').setup {						-- Status Line
      options = {
        theme = 'catppuccin'						
      }
    }
    require('nvim-tree').setup {					-- File Tree
      view = {
        width = 40,							
      }
    }
    require('nvim-treesitter.configs').setup {				-- Tree Sitter
      ensure_installed = "all",
      highlight = { enable = true },
      indent = { enable = true },
    }
    require('which-key').setup { }					-- Which Key
    require('codeium').setup({
      enable_cmp = true,
    })
    local lspconfig = require('lspconfig')				-- LSP
    local cmp = require('cmp')						-- Completion
    cmp.setup({								-- CMP
      mappingg = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
	{ name = 'codeium' },
        { name = 'buffer' },
        { name = 'path' },
      }),
    })

    -- Function Runs Afer LSP Attaches To Buffer
    local on_attach = function(client, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- LSP Keymaps ( Buffer-Local )
      local bufKey = vim.keymap.set
      local bufOpts = { noremap=true, silent=true, buffer=bufnr }
      bufKey('n', 'gd', vim.lsp.buf.definition, bufOpts)		-- Leader + g + d = Go To Def.
      bufKey('n', 'gr', vim.lsp.buf.reference, bufOpts)			-- Leader + g + r = Go To Ref.
      bufKey('n', 'K', vim.lsp.buf.hover, bufOpts)			-- Leader + K = Show Doc.
      bufKey('n', '<leader>rn', vim.lsp.buf.rename, bufOpts)		-- Leader + r + n = Rename Symbol
      bufKey('n', '<leader>ca', vim.lsp.buf.code_action, bufOpts)	-- Leader + c + a = Code Action
    end

    -- Enable LSPs
    lspconfig.bashls.setup{ on_attach = on_attach }
    lspconfig.cssls.setup{ on_attach = on_attach }
    lspconfig.gopls.setup{ on_attach = on_attach }
    lspconfig.html.setup{ on_attach = on_attach }
    lspconfig.nil_ls.setup{ on_attach = on_attach }
    lspconfig.rust_analyzer.setup{ on_attach = on_attach }
    lspconfig.tsserver.setup{ on_attach = on_attach }
  '';
}

