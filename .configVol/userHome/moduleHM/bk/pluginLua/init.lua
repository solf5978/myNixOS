-- /lua/plugins/init.lua

local M = {}

local function setup_core_plugins()
    -- These MUST load on startup for the config to work
    require('plugins.startup') -- Loads lhe, treesitter, lualine, etc.
    require('plugins.completion').setup() -- Loads CMP and its keymaps
end

local function setup_lazy_plugins()
    local lze_ok, lze = pcall(require, "lze")
    if not lze_ok then
        vim.notify("lze is not available. Plugins will not be lazy loaded.", vim.log.levels.WARN)
        return
    end

    -- --- 1. Git Tools (gitsigns, diffview) ---
    lze.add({
        name = "Git Tools",
        keys = "<leader>g", -- Load when user presses <leader>g
        ft = "gitcommit,gitrebase,git",
        exec = function()
            require('plugins.git').setup()
        end
    })

    -- --- 2. Format & Lint (conform, nvim-lint) ---
    lze.add({
        name = "Format/Lint",
        ft = "bufread,filetype",
        exec = function()
            require('plugins.format_lint').setup()
        end
    })

    -- --- 3. LSP Servers/MAPPINGS (The heavy part) ---
    -- We load the main LSP module which, in turn, can use autocmds/filetypes
    -- to trigger server-specific logic or use its own lazy config.
    lze.add({
        name = "LSP/Filetype-Specific",
        ft = "*", -- Trigger on any filetype, or use more specific events like 'BufRead'
        exec = function()
            -- LSP config can be delayed, but keymaps should be registered.
            -- NOTE: If lspconfig is loaded immediately (in startup.lua), this only
            -- runs the final setup (e.g., language-specific keymaps).
            require('plugins.lsp').setup()
        end
    })
    
    -- --- 4. Motion/Utility Plugins (flash, nap) ---
    lze.add({
        name = "Motion",
        keys = { "s", "S", "R", "z" }, -- Keys that trigger these motion plugins
        cmd = { "Flash", "Nap" },
        exec = function()
            require('plugins.motion').setup()
        end
    })
end

M.setup = function()
    setup_core_plugins()
    setup_lazy_plugins()
end

return M
