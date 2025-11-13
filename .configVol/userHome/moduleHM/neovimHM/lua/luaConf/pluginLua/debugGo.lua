require('lze').load {
    {
    "nvim-dap-go",
    for_cat = { cat = 'debug.go', default = false },
    on_plugin = { "nvim-dap", },
    after = function(plugin)
      require("dap-go").setup()
    end,
  },
}
