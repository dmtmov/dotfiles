require('plugins')
require('config.telescope')
-- require('config.lualine')
require('config.lsp')
require'config.completion'
require'config.whichkey'
require'config.tree'
require'config.bar'

local key_map = vim.api.nvim_set_keymap

vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 3
vim.o.shiftwidth = 2
vim.o.numberwidth = 4
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.mouse = 'a'
vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.colorcolumn = "80"
vim.cmd [[colorscheme ayu]]


key_map('n', 'vs', ':vs<CR>', { noremap = true })
key_map('n', 'sp', ':sp<CR>', { noremap = true })


key_map('n', 'ff', ':lua require("telescope.builtin").find_files{}<CR>', { noremap = true})
key_map('n', 'fb', ':Telescope buffers<CR>', { noremap = true})
key_map('n', 'fh', ':Telescope help_tags<CR>', { noremap = true})


key_map('n', 'tt', ':lua require"config.tree".toggle{}<CR>', { noremap = true, silent = true})


-- highlight same patterns in file on word under cursor
-- vim.cmd [[ :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')) ]]
vim.g.cursorword_highlight = true

-- " Find files using Telescope command-line sugar.
-- nnoremap <leader>ff <cmd>Telescope find_files<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>

-- " Using Lua functions
-- nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
-- nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
-- nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
