require("nixCats").use({
  { "neovim/nvim-lspconfig" },
  { "jose-elias-alvarez/typescript.nvim" },
  { "nvim-treesitter/nvim-treesitter" },
})

-- Setup TypeScript LSP
local lspconfig = require("lspconfig")
lspconfig.ts_ls.setup({
  on_attach = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

