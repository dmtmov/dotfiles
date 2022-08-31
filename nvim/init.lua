local opts = { noremap = true, silent = true }

-- Set Leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight same patterns in file on word under cursor
vim.g.cursorword_highlight = true
--vim.opt.timeoutlen = 1000
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = false

-- Identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.textwidth = 1200
vim.opt.wrap = false

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 10
vim.opt.numberwidth = 4
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.colorcolumn = "-40,-20,-0"
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.wildmenu = true
vim.opt.secure = true
vim.opt.clipboard = "unnamedplus"
vim.opt.laststatus = 3 -- Enable global statusline
vim.opt.termguicolors = true -- Enable native terminal colors and identation
-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

vim.api.nvim_command('filetype plugin indent on')


-- Netrw file explorer settings
vim.cmd 'let g:netrw_liststyle =3'
vim.cmd 'let g:netrw_banner =0'
vim.cmd 'let g:netrw_browse_split =3'


require 'plugins'
require 'configs.lsp'
require 'configs.completion'
require 'configs.git'
require 'configs.treesitter'

-- vim.cmd 'colorscheme base16-gruvbox-dark-hard'
vim.cmd 'colorscheme sobrio'
-- vim.cmd 'colorscheme ayu-dark'

-- vim.cmd 'highlight Normal guibg=none'
-- vim.cmd 'highlight Cursorlive guifg=bold guibg=black'
vim.cmd 'let g:transparent_enabled = v:true'

---------------------------------------
--
--          KEYMAPS
--
---------------------------------------

-- Filetree
vim.keymap.set('n', '<leader>e', ':Lexplore 30<CR>', opts)

-- Predictable navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<leader>n', ':bnext<CR>', opts)
vim.keymap.set('n', '<leader>p', ':bprev<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':bdelete | bNext<CR>', opts)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

vim.keymap.set('n', '<leader>q', ':x<CR>', opts) -- save buffer and exit

vim.keymap.set('i', 'jk', '<ESC>', opts)

vim.keymap.set('n', '<', '<<', opts)
vim.keymap.set('n', '>', '>>', opts)
vim.keymap.set('n', '<leader>c', ':CommentToggle<CR>', opts)

---------------------------------------
--
--           TELESCOPE
--
---------------------------------------
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "./.git/",
            "./__pycache__",
            "./colors/",
            "./.venv",
        },
        path_display = { "smart" },
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.9,
            preview_width = 0.7,
        },
    },
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
        live_grep = {
        }
    }
}

---------------------------------------
--
--          CURSORLINE
--
---------------------------------------
require('nvim-cursorline').setup {
    cursorline = { enable = true, timeout = 1000, number = false },
    cursorword = { enable = true, min_length = 3, hl = { underline = true } }
}

---------------------------------------
--
--          NOTIFICATIONS
--
---------------------------------------
vim.notify = require('notify')
vim.notify.setup {
    stages = 'fade_in_slide_out',
    render = 'minimal',
    minimum_width = 20,
    --timeout = 1,
    background_colour = 'Normal',
}

function invoke_and_notify(cmd, message)
    vim.cmd(cmd)
    vim.notify(message, 'info')
end

vim.keymap.set(
    'n',
    '<leader>w',
    ':lua invoke_and_notify(":w", " File saved")<CR>',
    opts
)
vim.keymap.set(
    'n',
    '<leader>l',
    ':lua invoke_and_notify("luafile %", " File sourced")<CR>',
    opts
)

---------------------------------------
--
--          COMMENTS
--
---------------------------------------
require('nvim_comment').setup()

---------------------------------------
--
--          DIFF
--
---------------------------------------
require('diffview').setup()

---------------------------------------
--
--          INDENTATION
--
---------------------------------------
require('indent_blankline').setup {}
--[[
    show_current_context = true,
    show_current_context_start = false,
    show_end_of_line = true,
    space_char_blankline = " ",
}
--]]

