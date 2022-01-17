-- defaults
vim.g.mapleader = " "
vim.o.timeoutlen = 1000
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 3
vim.o.shiftwidth = 4
vim.o.numberwidth = 4
vim.o.showmode = false
vim.o.showtabline = 4
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.o.colorcolumn = "80"
vim.o.ruler = true
vim.o.softtabstop = 4
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.wildmenu = true
vim.o.wrap = true
vim.o.textwidth = 79
vim.o.autoindent = true
vim.o.secure = true

vim.api.nvim_command('filetype plugin indent on')


-- imports
require'keymaps'
require'plugins'
require'configs'
