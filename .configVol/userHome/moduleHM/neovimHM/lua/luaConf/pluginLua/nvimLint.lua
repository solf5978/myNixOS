require('lze').load {
    {
    "nvim-lint",
    enabled = nixCats('de') or false,
    event = "FileType",
    after = function (plugin)
      require('lint').linters_by_ft = {
        -- NOTE: download some linters in lspsAndRuntimeDeps
        -- and configure them here
        -- markdown = {'vale',},
        javascript = { 'eslint' },
        -- typescript = { 'eslint' },
        go = nixCats('go') and { 'golangcilint' } or nil,
        rust = nixCats('rs') and { 'clippy' } and { 'rustfmt'},
        typescript = nixCats('fe') and { 'eslint' },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
