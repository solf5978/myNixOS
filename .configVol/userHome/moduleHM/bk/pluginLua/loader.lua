local function nixCats(key)
  return require("nixCats").get(key)
end

-- 1. Setup for Snacks (should be first if you use its APIs)
require("lze").setup {
  -- ... (lze setup is fine as is) ...
}

-- 2. ALL Plugin Specs
require('lze').load {
  -- === CORE DEPENDENCIES / LIBRARIES (Must load early) ===
  { "BirdeeHub/lze",                 lazy = false },
  { "BirdeeHub/lzextras",            lazy = false },
  { "nvim-lua/plenary.nvim",         lazy = false, enabled = nixCats('generalUsage') or false },
  { "MunifTanjim/nui.nvim",          lazy = false, enabled = nixCats('generalUsage') or false },
  { "BirdeeHub/nvim-nio",            lazy = false, enabled = nixCats('generalUsage') or false },
  { "BirdeeHub/ddressing.nvim",      lazy = false, enabled = nixCats('generalUsage') or false },
  
  -- === COLOR SCHEMES (Startup) ===
  { "neanias/everforest-nvim",       lazy = false, enabled = nixCats('generalUsage') or false },
  { "ellisonleao/gruvbox.nvim",      lazy = false, enabled = nixCats('generalUsage') or false },
  { "rebelot/kanagawa.nvim",         lazy = false, enabled = nixCats('generalUsage') or false },
  { "savq/melange-nvim",             lazy = false, enabled = nixCats('generalUsage') or false },
  { "Shatur/neovim-ayu",             lazy = false, enabled = nixCats('generalUsage') or false },

  -- === GENERAL UTILITIES (Startup) ===
  { "nvim-tree/nvim-web-devicons",   lazy = false, enabled = nixCats('generalUsage') or false },
  { "echasnovski/mini.nvim",         lazy = false, enabled = nixCats('generalUsage') or false }, -- Already had this
  { "b0o/SchemaStore.nvim",          lazy = false, enabled = nixCats('generalUsage') or false },
  { "tpope/vim-sleuth",              lazy = false, enabled = nixCats('generalUsage') or false },
  { "tpope/vim-repeat",              lazy = false, enabled = nixCats('generalUsage') or false },

  -- === TREESITTER & SYNTAX (Startup/VeryLazy) ===
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = nixCats('generalUsage') or false,
    build = ":TSUpdate",
    event = "VeryLazy",
    opts = require("plugins.treesitter"), -- Need to create this file
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = nixCats('generalUsage') or false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    enabled = nixCats('generalUsage') or false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    enabled = nixCats('generalUsage') or false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
  },
  {
    "andymass/vim-matchup",
    enabled = nixCats('generalUsage') or false,
    event = "VeryLazy",
  },
  {
    "windwp/nvim-ts-autotag",
    enabled = nixCats('generalUsage') or false,
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },
  {
    "folke/ts-comments.nvim",
    enabled = nixCats('generalUsage') or false,
    ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },

  -- === OTHER CORE PLUGINS (Delayed/Event-based) ===
  {
    "folke/snacks.nvim",
    enabled = nixCats('generalUsage') or false,
    event = "VeryLazy",
    opts = {}, -- Empty table or your snacks config
  },
  {
    "nvim-lualine/lualine.nvim", -- Already had this
    enabled = nixCats('generalUsage') or false,
    event = "VeryLazy",
    opts = require("plugins.lualine"), -- Need to create this file
  },
  {
    "arkav/lualine-lsp-progress",
    enabled = nixCats('generalUsage') or false,
    dependencies = { "nvim-lualine/lualine.nvim" },
    event = "LspAttach",
  },
  {
    "RRethy/vim-illuminate",
    enabled = nixCats('generalUsage') or false,
    event = "VeryLazy",
  },
  {
    "windwp/nvim-autopairs",
    enabled = nixCats('generalUsage') or false,
    event = "InsertEnter",
    opts = {},
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = nixCats('generalUsage') or false,
    event = "VeryLazy", -- Loaded by cmp-nvim-luasnip later
  },
  {
    "folke/which-key.nvim", -- Already had this
    enabled = nixCats('generalUsage') or false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "willothy/wezterm-nvim",
    enabled = nixCats('generalUsage') or false,
    event = "VeryLazy",
    opts = {},
  },
  -- ... (Keep the rest of your original plugins here: blink.cmp, gitsigns, lint, conform, dap, lspconfig, etc.)
  -- ...
}
