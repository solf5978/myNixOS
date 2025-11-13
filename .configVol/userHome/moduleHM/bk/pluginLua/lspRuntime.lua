-- /pluginLua/lsp.lua

local M = {}

-- Placeholder for the nixCats function to check if a package is enabled
-- You will replace this with the actual nixCats function available in your environment.
local nixCats = {
    is_enabled = function(pkg_name)
        -- Placeholder logic: assumes generalUsage is always enabled, 
        -- and specific packs like goDev/rsDev/tsDev are enabled if named.
        if pkg_name == 'generalUsage' or pkg_name == 'goDev' or pkg_name == 'rsDev' or pkg_name == 'tsDev' then
             return true
        end
        return false
    end
}

local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Use lspkind capabilities for icons in the hover/signature help
local lspkind_ok, lspkind = pcall(require, 'lspkind')
if lspkind_ok then
    capabilities = lspkind.extend_lsp_capabilities(capabilities)
end

-- Use cmp capabilities for inline/ghost text support
local cmp_ok, cmp = pcall(require, 'cmp')
if cmp_ok then
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- Add further capabilities from cmp if needed
end

-- --- 1. LSP Saga Setup (UI Enhancements) ---
local lspsaga_ok, lspsaga = pcall(require, 'lspsaga')
if lspsaga_ok and nixCats.is_enabled('generalUsage') then
    lspsaga.setup({
        ui = {
            border = 'rounded',
            -- Add further UI configurations here
        },
        lightbulb = {
            enable = false, -- Disable if using native code actions, enable otherwise
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        beacon = {
            enable = true,
            frequency = 7, -- seconds
        },
        -- Define keymaps for saga features here, or in coreLua/keyMapping.lua
    })
end

-- --- 2. Shared LSP Configuration (e.g., set up keymaps) ---
local on_attach = function(client, bufnr)
    -- Enable format on save via conform if not using LSP's formatting
    -- client.server_capabilities.documentFormattingProvider = false

    -- Set keymaps for LSP
    local buf_set = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    buf_set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)

    -- LSPSaga Mappings (if enabled)
    if lspsaga_ok and nixCats.is_enabled('generalUsage') then
        -- Example of overriding native with LSPSaga features
        buf_set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
        buf_set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
        buf_set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)
        buf_set('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opts)
    end
end

-- --- 3. Conditional Language Server Setup ---
M.setup_servers = function()

    -- JSON and YAML (jy package)
    if nixCats.is_enabled('generalUsage') or nixCats.is_enabled('jyDev') then
        lspconfig.jsonls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require('schemastore').get_schemas(), -- Uses SchemaStore.nvim
                    validate = { enable = true },
                },
            },
        })
        lspconfig.yamlls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                yaml = {
                    -- Add conditional settings if needed
                },
            },
        })
    end

    -- TypeScript/JavaScript (ts package)
    if nixCats.is_enabled('tsDev') then
        lspconfig.tsserver.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
            settings = {
                -- Example of using the built-in language server for simple JS/TS
            },
        })
        -- tailwindcss-language-server (cs and ts packages)
        lspconfig.tailwindcss.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { 'typescriptreact', 'javascriptreact', 'html', 'css', 'lua', 'markdown' },
            -- Enable JIT mode for better performance
            settings = {
                tailwindcss = {
                    experimental = { classRegex = { 'clsx\\(([^)]*)\\)' } }
                }
            }
        })
        -- NestJS Language Server (ts package)
        lspconfig.denols.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", ".git"),
        })
    end

    -- Go (go package)
    if nixCats.is_enabled('goDev') then
        lspconfig.gopls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                },
            },
        })
    end

    -- Rust (rs package)
    if nixCats.is_enabled('rsDev') then
        lspconfig.rust_analyzer.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    checkOnSave = {
                        command = "clippy", -- Use clippy for check on save (as it's in your rs package)
                    },
                }
            },
        })
    end

    -- Nix (nx package)
    if nixCats.is_enabled('nxDev') then
        lspconfig.nil_ls.setup({ -- Using nil_ls (modern) instead of nixd (older/daemon)
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end
    
    -- HTML/CSS/JS LSPs (he package)
    if nixCats.is_enabled('heDev') then
         lspconfig.html.setup({ on_attach = on_attach, capabilities = capabilities })
         lspconfig.cssls.setup({ on_attach = on_attach, capabilities = capabilities })
         lspconfig.emmet_ls.setup({ on_attach = on_attach, capabilities = capabilities })
    end

    -- Fallback for basic functionality
    lspconfig.solargraph.setup({}) -- Placeholder for a common fallback, remove if not needed

end

M.setup = function()
    M.setup_servers()
end

return M
