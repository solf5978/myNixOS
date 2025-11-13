-- /pluginLua/motion.lua

local M = {}

M.setup = function()
    local set = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- --- 1. flash-nvim Configuration ---
    -- Flash is a powerful replacement for f/t/F/T and easy-motion
    local flash_ok, flash = pcall(require, "flash")
    if flash_ok then
        flash.setup({
            modes = {
                char = {
                    enabled = true,
                    jump = true,
                    -- Add keymaps for quick jumps
                    keys = { "s", "S", "z" }, 
                },
                search = {
                    enabled = true,
                    jump = true,
                },
            }
            -- Further configuration options go here
        })

        -- Remap the standard f/t motions to use Flash
        set({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash Jump" })
        set({ "n", "x", "o" }, "S", function() flash.treesitter() end, { desc = "Flash Treesitter" })
        
        -- Optional: Remap search highlighting to Flash search
        set("n", "R", function() flash.remote() end, { desc = "Flash Remote" })
        set({ "n", "x", "o" }, "<leader>f", function() flash.jump() end, { desc = "Flash F/T Jump" })
    end


    -- --- 2. hop-nvim / leap-nvim / nap.nvim ---
    
    -- NOTE: flash.nvim covers the functionality of hop and leap.
    -- If you enable all of them, they might conflict or be redundant.
    -- If you prefer hop/leap for specific scenarios, you would remap them here.

    -- Option A: Configure leap/hop as a fallback/alternative (e.g., for visual selection)
    
    -- Leap/Hop (for more traditional EasyMotion-style jumps)
    -- local leap_ok, leap = pcall(require, "leap")
    -- if leap_ok then
    --     leap.add_default_mappings(true)
    --     -- NOTE: This will set "s" and "S" by default, which conflicts with Flash. 
    --     -- You should modify the keys or only use one major jumping plugin.
    --     -- Example if you want to use Leap's f/t motions:
    --     -- set({ "n", "x", "o" }, "f", function() leap.leap({ target_windows = { vim.api.nvim_get_current_win() } }) end, opts)
    -- end

    -- nap.nvim (Extra navigation motions)
    local nap_ok, nap = pcall(require, "nap")
    if nap_ok then
        nap.setup({
            -- Default keymaps are usually non-conflicting, e.g., using 'N' for next block
            -- If you need to remap, do it here:
            -- set("n", "N", "<cmd>lua require('nap').next_block()<cr>", opts)
        })
    end
end

return M
