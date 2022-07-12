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
vim.opt.relativenumber = true

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
vim.opt.mouse = ''
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


require'plugins'
require'configs.lsp'
require'configs.completion'
require'configs.git'
require'configs.treesitter'

--vim.cmd 'colorscheme base16-gruvbox-dark-hard'

require('ayu').setup({ mirage=true })
require('ayu').colorscheme()
-- Enable indent plugin
--[[
require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = false
})
--]]

--vim.cmd 'highlight Normal guibg=none'
--vim.cmd 'highlight Cursorlive guifg=bold guibg=black'


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


function save_buffer_and_notify()
    vim.cmd ':w'
    require"notify".notify(
        ' File saved',
        'info',
        {
            title = 'Buffer',
            stages = 'slide',
            icon = '::',
            border = "rounded",
            timeout = 10,
        }
    )
end
vim.keymap.set('n', '<leader>w', ':lua save_buffer_and_notify()<CR>', opts)

function source_lua_file_and_notify()
    vim.cmd 'luafile %'
    require"notify".notify(
        ' File sourced',
        'info',
        {
            title = 'Lua',
            stages = 'slide',
            icon = '::',
            border = "rounded",
            timeout = 10,
        }
    )
end

vim.keymap.set('n', '<leader>l', ':lua source_lua_file_and_notify()<CR>', {noremap=true, silent=false})


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
        path_display={"smart"},
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
--           STATUSLINE
--
---------------------------------------
--[[
require('lualine').setup {
    options = {
        icons_enabled = false,
        theme = 'ayu_mirage',
        --theme = 'gruvbox_dark',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff',
                    {'diagnostics', sources={'nvim_diagnostic',}}},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'location'},
        lualine_z = {'progress'}
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    },
    extensions = {}
}
--]]

---------------------------------------
--
--          CURSORLINE
--
---------------------------------------
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}

---------------------------------------
--
--          NOTIFICATIONS
--
---------------------------------------
--vim.notify = require("notify").setup(
--    {
--        minimum_width = 10,
--        render = "minimal",
--        stages = "static",
--        message = {
--            height = 20,
--            width = 10,
--        },
--        timeout = 3000,
--    }
--)

