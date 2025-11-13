-- /coreLua/colorScheme.lua

local M = {}

M.setup = function()
    -- --- 1. Require all available color schemes (Ensures they are loaded) ---
    -- Requiring them explicitly makes sure they are available in the runtime path.
    -- The startupPlugins mechanism in nixCats-nvim should handle the loading,
    -- but this makes your Lua file self-sufficient.

    -- These are required to ensure they are available for the 'colorscheme' command.
    require("everforest")
    require("gruvbox")
    require("kanagawa")
    require("melange")
    require("ayu")

    -- --- 2. Configure Themes with Lua Setup Functions ---
    -- Some themes offer a setup() function for configuration before they are loaded.

    -- Example: Kanagawa setup (Highly recommended to configure for better experience)
    local ok, kanagawa = pcall(require, "kanagawa")
    if ok then
        kanagawa.setup({
            compile = false,        -- enable compiling to improve startup time
            undercurl = true,
            commentStyle = { italic = true },
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            transparent = false,    -- Disable background if true
            theme = "wave",         -- 'wave', 'dragon', or 'lotus'
            background = {
                dark = "wave",
                light = "lotus",
            },
            overrides = function(colors)
                return {} -- Use to override specific highlight groups
            end,
            terminalColors = true,  -- Setting terminal colors
        })
    end

    -- --- 3. Set the Active Colorscheme ---

    -- Choose your default theme
    local colorscheme = "melange"

    -- Attempt to set the colorscheme
    local status, msg = pcall(vim.cmd.colorscheme, colorscheme)

    if not status then
        -- Fallback to a safe scheme and print an error
        vim.notify("Could not load colorscheme " .. colorscheme .. ": " .. msg, vim.log.levels.ERROR)
        vim.cmd.colorscheme "default"
    end
end

return M
