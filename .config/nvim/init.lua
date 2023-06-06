local opts = { noremap = true, silent = true }

-- Set Leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight same patterns in file on word under cursor
vim.g.cursorword_highlight = true
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.relativenumber = false

-- Identation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.textwidth = 120
vim.opt.wrap = false

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 5
vim.opt.numberwidth = 4
vim.opt.showmode = true
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.colorcolumn = "-40,-20,-0"
vim.opt.mousescroll = "ver:1,hor:5"
-- vim.opt.mousemodel = "extend"
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
-- vim.o.ls = 1
vim.o.ch = 0

-- Disable native Explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1



-- Disable Arrows in Normal Mode
vim.cmd 'nnoremap <Up> <Nop>'
vim.cmd 'nnoremap <Left> <Nop>'
vim.cmd 'nnoremap <Right> <Nop>'
vim.cmd 'nnoremap <Down> <Nop>'


vim.api.nvim_command('filetype plugin indent on')


-- Netrw file explorer settings
vim.g.netrw_liststyle = 4
vim.g.netrw_banner = 0
vim.g.netrw_banner_split = 4
vim.g.netrw_fastbrowse = 2




require 'plugins'
require 'cmp_config'
require 'lsp_config'

-- vim.cmd 'colorscheme sobrio'
-- vim.cmd 'colorscheme ayu-mirage'
require('rose-pine').setup {
    dark_variant = 'moon',
    dim_nc_background = true
}
vim.cmd 'colorscheme rose-pine'

-- vim.cmd 'highlight Normal guibg=none'
-- vim.cmd 'highlight Cursorlive guifg=bold guibg=black'

--------------------------------------------------------------------------------
-- Disable CMD history
vim.keymap.set('n', 'q:', '<nop>', opts)

-- Filetree
vim.keymap.set('n', '<leader>e', ':Lexplore 30<CR><CR>', opts)

-- Predictable/intuitive navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<leader>n', ':bnext<CR>', opts)
vim.keymap.set('n', '<leader>p', ':bprev<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':bdelete | bNext<CR>', opts)
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts)

vim.keymap.set('n', '<leader>q', ':x<CR>', opts)

vim.keymap.set('i', 'jk', '<ESC>', opts)

vim.keymap.set('n', '<', '<<', opts)
vim.keymap.set('n', '>', '>>', opts)
vim.keymap.set('n', '<leader>c', ':CommentToggle<CR>', opts)

--------------------------------------------------------------------------------
require('telescope').setup {
    defaults = {
        file_ignore_patterns = {
            "./.git/",
            "./__pycache__",
            "./colors/",
            "./.venv",
        },
        -- path_display = { "smart" },
        -- layout_strategy = "horizontal",
        -- layout_config = {
        --     width = 0.9,
        --     preview_width = 0.7,
        -- },
    },
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
        live_grep = {
        }
    }
}


--------------------------------------------------------------------------------
require('nvim-cursorline').setup {
    cursorline = { enable = false, timeout = 1000, number = false },
    cursorword = { enable = true, min_length = 3, hl = { underline = true } }
}


--------------------------------------------------------------------------------
vim.notify = require('notify')
vim.notify.setup {
    stages = 'fade_in_slide_out',
    render = 'minimal',
    minimum_width = 20,
    --timeout = 1,
    background_colour = 'Normal',
}

invoke_and_notify = function(cmd, message)
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

--------------------------------------------------------------------------------
require('nvim_comment').setup()


--------------------------------------------------------------------------------
-- require('diffview').setup()
require("nvim-autopairs").setup {}

--------------------------------------------------------------------------------
-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"

--[[
require('indent_blankline').setup {
    -- char = "",
    show_current_context = false,
    show_current_context_start = false,
    show_end_of_line = false,
    -- space_char_blankline = " ",
}
--]]


--------------------------------------------------------------------------------
require('gitsigns').setup()


--------------------------------------------------------------------------------
require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'python',
        'swift',
        'javascript',
        'typescript',
        'lua',
        'html',
        'css',
        'json',
        'yaml',
        'toml',
        'sql',
        'vim',
    },
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
    matchup = { enable = true },
    autopairs = { enable = true }
}


-- require('smartcolumn').setup({
--     colorcolumn = "80",
-- })

require "nvim-tree".setup()
require "nnn".setup()
require "neo-tree".setup()


local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- null_ls.builtins.completion.spell,
        -- null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.black,
        -- null_ls.builtins.formatting.isort,
        -- null_ls.builtins.diagnostics.pylint,
    },
})

--------------------------------------------------------------------------------
require("bufferline").setup {
    options = {
        offsets = {
            {
                text = "FileTree",
                text_align = "center",
                filetype = "NvimTree",
                separator = false,
            }
        },
        color_icons = false,
    }
}

