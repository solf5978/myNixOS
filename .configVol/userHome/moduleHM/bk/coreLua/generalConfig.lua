-- /coreLua/startupPlugins.lua

-- Define a simple utility function for checking if a plugin is available
-- NOTE: In a nixCats-nvim context, this check might be redundant if the package
-- is guaranteed to be loaded, but it's good practice.
local function pcall_require(name, config)
    local ok, setup_func = pcall(require, name)
    if ok and type(setup_func) == 'table' and setup_func.setup then
        setup_func.setup(config or {})
    elseif ok and type(setup_func) == 'function' then
        setup_func(config or {})
    elseif not ok then
        -- You can uncomment this line for debugging if a required plugin fails to load
        -- vim.notify("Plugin setup failed for: " .. name .. ". Error: " .. setup_func, vim.log.levels.WARN)
    end
end

-- --- Utility/Dependency Libraries ---
-- These typically don't need a direct setup call, but including them for completeness.
-- plenary-nvim, nui-nvim, nvim-nio, ddressing-nvim, snacks-nvim are libraries.
-- We require them here to ensure they are available for other plugins if needed.
-- require('plenary')
-- require('nui')
-- require('nvim-nio')
-- require('ddressing')
-- require('snacks')
-- require('lzextras') -- Extra utilities for the 'lze' loader

-- --- Core Functionality ---

-- 1. nvim-autopairs
pcall_require('nvim-autopairs', {
    disable_filetype = { "TelescopePrompt", "dirvish" },
})

-- 2. vim-illuminate: Highlight other occurrences of word under cursor
pcall_require('illuminate', {
    delay = 200, -- Delay in milliseconds
    timeout = 700, -- Timeout for search in milliseconds
    under_cursor = true, -- Highlight when cursor is on a word
})

-- 3. vim-sleuth: Auto-detects and sets indent/tab settings
-- This is a legacy vim plugin that usually just needs to be installed, no setup() call.

-- 4. vim-repeat: Repeat plugin for dot (.) support
-- Another legacy vim plugin, no setup() call needed.

-- 5. which-key.nvim: Displays keybindings in popup
pcall_require('which-key', {
    plugins = {
        marks = true, -- Shows a list of your marks on ' and `
        registers = true, -- Shows your registers on "
        lualine = true, -- Shows lualine indicator if lualine is installed
        presets = {
            operators = false, -- Disable default operator presets
            motions = false, -- Disable default motion presets
            text_objects = false, -- Disable default text object presets
        },
    },
    -- your desired config for which-key, e.g. delay
    delay = 100, -- delay before the popup appears
    -- NOTE: You will register your keymaps later, perhaps in keyMapping.lua or plugin-specific files
})

-- --- Treesitter & Related ---
-- These should be configured early for syntax highlighting/text objects.

-- 6. nvim-treesitter: Core parsing functionality
pcall_require('nvim-treesitter.configs', {
    ensure_installed = {
        'bash', 'css', 'html', 'javascript', 'json', 'jsx', 'lua', 'markdown',
        'markdown_inline', 'query', 'regex', 'toml', 'tsx', 'typescript',
        'vim', 'yaml', 'go', 'rust',
    },
    -- NOTE: You can manage language parsers based on your goDev, rsDev, tsDev packages
    -- The list above is a sensible default for 'generalUsage'.
    highlight = {
        enable = true,
        disable = function(lang)
            -- Optionally disable for very large files or slow languages
            return false
        end,
    },
    -- Other Treesitter modules
    autotag = { enable = true }, -- nvim-ts-autotag
    textobjects = { enable = true }, -- nvim-treesitter-textobjects
    context_commentstring = { enable = true }, -- nvim-ts-context-commentstring
    -- matchup = { enable = true }, -- Integrated via vim-matchup/TS integration
})

-- 7. ts-comments-nvim (Smarter comment handling for TS/TSX)
-- No explicit setup() is usually required if loaded via the Treesitter config above,
-- but it can be required if it exposes specific utility functions.

-- 8. vim-matchup
-- This plugin usually works without a setup() call, leveraging Treesitter integration.

-- 9. rainbow-delimiters-nvim
pcall_require('rainbow-delimiters', {})


-- --- Statusline & Icons ---

-- 10. nvim-web-devicons: File icons
pcall_require('nvim-web-devicons').setup {
    -- default: true. This will load all the icons.
    override = {},
    color_icons = true,
    default = true, -- true or false if you want show default icon when no icon was found
}

-- 11. lualine-nvim: Fast, customizable statusline
pcall_require('lualine', {
    options = {
        icons_enabled = true,
        theme = 'auto', -- or a specific theme
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'NvimTree', 'alpha', 'dashboard' },
        -- You might want to set up an autocommand to change the theme later.
    },
    sections = {
        -- Add components here, you can be as simple or complex as you like
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype', 'lualine_lsp_progress' }, -- Note lualine-lsp-progress here
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    extensions = { 'nvim-tree', 'lazy', 'man' }, -- Example extensions
})

-- --- Color Schemes ---
-- Set a default theme. You'll likely want to move this to /coreLua/colorScheme.lua
pcall_require('coreLua.colorScheme') -- Assume this file exists and handles setting the theme.

-- Since you asked to configure the plugins:
-- You can set a default theme here if you haven't created colorScheme.lua yet.
vim.cmd.colorscheme('melange')

-- NOTE: friendly-snippets, SchemaStore-nvim, wezterm-nvim
-- friendly-snippets and SchemaStore are extensions for completion/LSP and usually
-- don't require a setup() call, they are just available on the runtime path.
-- wezterm-nvim is a tool, its configuration depends on its usage, often through commands/keymaps.
