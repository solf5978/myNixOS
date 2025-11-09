local M = {}

-- Helper function for setting keymaps
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

M.setup = function()
    -- --- 1. gitsigns.nvim (Core Git Status) ---
    local gs_ok, gitsigns = pcall(require, "gitsigns")
    if gs_ok then
        gitsigns.setup({
            signs = {
                add          = { text = '▎' },
                change       = { text = '▎' },
                delete       = { text = '契' },
                topdelete    = { text = '契' },
                changedelete = { text = '▎' },
            },
            current_line_blame = false, -- Display blame info in a virtual text
            on_attach = function(bufnr)
                -- Mappings only apply to buffers with gitsigns loaded
                local function buf_set(mode, lhs, rhs, desc)
                    set(mode, lhs, rhs, { buffer = bufnr, desc = desc, noremap = true, silent = true })
                end

                -- Navigation
                buf_set('n', ']h', function() gitsigns.next_hunk() end, 'Next Hunk')
                buf_set('n', '[h', function() gitsigns.prev_hunk() end, 'Previous Hunk')

                -- Actions
                buf_set('n', '<leader>hs', gitsigns.stage_hunk, 'Stage Hunk')
                buf_set('n', '<leader>hr', gitsigns.reset_hunk, 'Reset Hunk')
                buf_set('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, 'Stage Hunk')
                buf_set('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end, 'Reset Hunk')
                buf_set('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, 'Blame Line')
                buf_set('n', '<leader>hp', gitsigns.preview_hunk, 'Preview Hunk')
                buf_set('n', '<leader>hd', gitsigns.diffthis, 'Diff This')
                buf_set('n', '<leader>td', function() gitsigns.toggle_deleted() end, 'Toggle Deleted')

                -- Text object
                buf_set({ 'o', 'x' }, 'ih', ':<C-U>GitsignsSelectHunk<CR>', 'Select Hunk')
            end
        })
    end

    -- --- 2. diffview.nvim (Side-by-side Diff Viewer) ---
    local dv_ok, diffview = pcall(require, "diffview")
    if dv_ok then
        diffview.setup({})

        -- Global keymaps for diffview
        set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', opts)
        set('n', '<leader>gD', '<cmd>DiffviewClose<CR>', opts)
        set('n', '<leader>gh', '<cmd>DiffviewToggleFiles<CR>', opts)
    end

    -- --- 3. git-conflict.nvim (Conflict Resolution Helper) ---
    local gc_ok, git_conflict = pcall(require, "git-conflict")
    if gc_ok then
        git_conflict.setup({
            disable_signs = false,
            keymaps = {
                next = 'gn', -- Next conflict
                prev = 'gp', -- Previous conflict
                our = 'go',  -- Select "Our" version
                theirs = 'gt', -- Select "Theirs" version
                none = 'g0', -- Select "None" (i.e., keep all markers)
                all = 'ga',  -- Select "All"
            },
        })
    end

    -- --- 4. lazygit.nvim (Lazygit Integration) ---
    -- Since lazygit is a separate TUI application, its configuration is minimal:
    local lg_ok, lazygit = pcall(require, "lazygit")
    if lg_ok then
        lazygit.setup({})

        -- Keymap to open Lazygit
        set('n', '<leader>gg', '<cmd>LazyGit<CR>', opts)
    end
end

return M
