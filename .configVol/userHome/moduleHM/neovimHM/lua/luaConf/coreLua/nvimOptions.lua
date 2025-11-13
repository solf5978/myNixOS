-- Global Config
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0

vim.o.breakindent = true
vim.o.completeopt = 'menu,preview,noselect'
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.updatetime = 250
vim.schedule(function ()
  vim.o.clipboard = 'unnamedplus'
end)

vim.opt.hlsearch = true
vim.opt.inccommand = 'split'
vim.opt.cpoptions:append('I')

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
