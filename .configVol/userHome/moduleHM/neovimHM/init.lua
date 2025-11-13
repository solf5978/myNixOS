-- /coreLua/init.lua
local M = {}

M.setup = function()
  require("coreLua.nvimOptions")       -- load core settings first
  require("coreLua.keymapping")
  require("coreLua.autoCommand")
  require("coreLua.colorScheme").setup()
end

M.setup()

return M
