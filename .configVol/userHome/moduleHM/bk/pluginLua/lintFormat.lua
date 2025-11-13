-- /pluginLua/format_lint.lua

local M = {}

-- Placeholder for the nixCats function to check if a package is enabled
local nixCats = {
    is_enabled = function(pkg_name)
        if pkg_name == 'generalUsage' or pkg_name == 'goDev' or pkg_name == 'rsDev' or pkg_name == 'tsDev' then
             return true
        end
        return false
    end
}

local function setup_conform()
    local conform_ok, conform = pcall(require, "conform")
    if not conform_ok or not nixCats.is_enabled('generalUsage') then return end

    local formatters = {
        -- --- General Formatters (ts, md, jy packages) ---
        prettier = { "prettier" },
        jsonlint = { "jsonlint" }, -- can be used as a formatter if it re-prints
        
        -- --- Language-Specific Formatters ---
        
        -- Nix (nx package)
        alejandra = { "alejandra" },
        nixpkgs_fmt = { "nixpkgs-fmt" },
        
        -- Go (go package)
        gofmt = { "gofmt" }, 
        
        -- Rust (rs package)
        rustfmt = { "rustfmt" },
        
        -- HTML/CSS/JS (he, cs packages)
        htmlbeautifier = { "htmlbeautifier" },
        rustywind = { "rustywind" }, -- Tailwind class sorting
    }

    conform.setup({
        formatters = formatters,
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true, -- Use LSP formatting if no conform formatter found
        },
        formatters_by_ft = {
            lua = { "stylua" }, -- assuming you have stylua
            javascript = { { "prettier" } },
            typescript = { { "prettier" } },
            javascriptreact = { { "prettier" } },
            typescriptreact = { { "prettier" } },
            json = { { "jsonlint" } },
            yaml = { { "prettier" } }, -- prettier supports yaml
            markdown = { { "prettier" } },
            html = { { "htmlbeautifier" } },
            css = { { "prettier", "rustywind" } },
            
            -- Conditional languages
            nix = { "alejandra", "nixpkgs_fmt" },
            go = { "gofmt" },
            rust = { "rustfmt" },
        },
    })
end

local function setup_lint()
    local lint_ok, lint = pcall(require, "lint")
    if not lint_ok or not nixCats.is_enabled('generalUsage') then return end

    local linters_by_ft = {
        -- --- General Linters (jy, md packages) ---
        json = { "jsonlint" },
        yaml = { "yamllint" },
        markdown = { "markdownlint" },
        
        -- --- Language-Specific Linters ---
        
        -- TypeScript/JavaScript (ts package)
        javascript = { "eslint" },
        typescript = { "eslint" },
        javascriptreact = { "eslint" },
        typescriptreact = { "eslint" },
        
        -- Go (go package)
        go = { "golangci-lint" }, -- Or use "golint" if preferred
        
        -- Rust (rs package)
        rust = { "clippy" },
        
        -- HTML/CSS/JS (he, cs packages)
        html = { "htmllint" },
        css = { "stylelint" },
    }

    lint.linters_by_ft = linters_by_ft
    
    -- Autocommand to run linting on save and cursor hold
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        callback = function()
            lint.try_lint()
        end,
    })
end

M.setup = function()
    setup_conform()
    setup_lint()
end

return M
