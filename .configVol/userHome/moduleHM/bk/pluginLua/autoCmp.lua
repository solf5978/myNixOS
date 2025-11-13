-- /pluginLua/completion.lua

local M = {}

M.setup = function()
    -- Check if nvim-cmp is available before trying to configure
    local cmp_ok, cmp = pcall(require, 'cmp')
    if not cmp_ok then
        return
    end

    local lspkind_ok, lspkind = pcall(require, 'lspkind')

    -- Setup for lspkind (VSCode-like pictograms)
    if lspkind_ok then
        lspkind.init({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- when popup is too wide, hide source and label until it fits
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lsp_signature_help = "[Sig]",
                path = "[Path]",
                cmdline = "[Cmd]",
                -- Add more source names as needed
            },
        })
    end

    -- --- Basic Keymaps for Completion ---
    local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    
    local has_words_before = function()
        -- Checks if there are non-whitespace characters before the cursor.
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%S") ~= nil
    end

    -- --- nvim-cmp Configuration ---
    cmp.setup({
        -- --- Snippets ---
        snippet = {
            -- WARNING: friendly-snippets relies on a snippet engine (like luasnip).
            -- Since you didn't list a snippet engine (e.g., luasnip), we'll assume
            -- a default like 'nvim_lsp' or an external tool is handling it for now.
            -- If you add a snippet engine later (like luasnip), you must set it here:
            -- expand = function(args)
            --     require('luasnip').lsp_expand(args.body)
            -- end,
        },
        
        -- --- Formatting/Appearance ---
        formatting = {
            -- Use lspkind for icons
            format = lspkind_ok and lspkind.cmp_format({
                with_text = true,
                maxwidth = 50,
            }) or nil,
        },

        -- --- Key Mappings ---
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            
            -- Accept the completion item
            ['<CR>'] = cmp.mapping.confirm({ select = true }), 

            -- Tab for navigation/expansion
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete() -- Trigger completion if there's text
                else
                    fallback() -- The original <Tab> behavior
                end
            end, { 'i', 's' }),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),

        -- --- Sources ---
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'buffer',  option = { keyword_length = 3 } },
            { name = 'path' },
            -- Note: 'blink-cmp' may replace or integrate into the 'nvim_cmp' framework.
            -- If it fully replaces it, the config would be different. Assuming
            -- 'blink-cmp' is a source or a fork that maintains compatibility:
            -- { name = 'blink' }, 
        }),
        
        -- --- Command Line Completion (cmp-cmdline, cmp-cmdline-history) ---
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline' },
                { name = 'cmdline_history' },
                { name = 'path' }
            })
        }),
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'buffer' }
            })
        }),
        
        -- --- Other Settings ---
        view = {
            entries = 'custom', -- Use the default entries view
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        
        experimental = {
            ghost_text = true, -- Enable inline completion ghost text (requires a source)
        },
    })
end

return M
