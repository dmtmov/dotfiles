--
-- inspired by:
--      https://github.com/ThePrimeagen/neovimrc
--      https://github.com/nvim-lua/kickstart.nvim
--
-------------------------------------------------------------------------------
-- Setup pckr
local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()
-------------------------------------------------------------------------------
vim.g.mapleader = " "

-- Netrw file explorer (replaced with NvimTree)
vim.g.netrw_liststyle = 4
vim.g.netrw_banner_split = 4
vim.g.netrw_fastbrowse = 2
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt.number = true
-- vim.opt.relativenumber = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.wildmenu = true

vim.opt.clipboard = "unnamedplus"

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8

-- Rullers
vim.opt.textwidth = 120
vim.opt.colorcolumn = "80"

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

vim.opt.mouse = "nv"

-- vim.api.nvim_command('filetype plugin indent on')
-------------------------------------------------------------------------------
local opts = { noremap = true, silent = true }

-- Disable arrows
vim.keymap.set({ 'n', 'v', 'i' }, '<Up>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Down>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Left>', '<Nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Right>', '<Nop>')

-- Navigate over splits
vim.keymap.set('n', '<C-w>', '<C-w><C-w>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')

-- Disable CMD history
vim.keymap.set({ 'n', 'v' }, 'q:', '<nop>', opts)

-- Open Filetree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Disable highlight
vim.keymap.set('n', '<esc>', ':noh<cr>', opts)

vim.keymap.set('n', '<leader>T', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>n', ':bnext<CR>', opts)
vim.keymap.set('n', '<leader>p', ':bprev<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':bdelete | bNext<CR>', opts)
vim.keymap.set('n', '<leader>q', ':x<CR>', opts)
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>s', ':luafile %<CR>', opts)

-------------------------------------------------------------------------------
-- Plugins

require('pckr').add {
    "nvim-lua/plenary.nvim",

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",          run = ":TSUpdate" },

    -- Telescope
    { "nvim-telescope/telescope.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },

    -- LSP
    { "VonHeikemen/lsp-zero.nvim", branch = 'v3.x',
        requires = {
            "neovim/nvim-lspconfig",

            -- Mason
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Autocompletion
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            -- "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "saadparwaiz1/cmp_luasnip",

            -- Snippets
            "L3MON4D3/LuaSnip",
        }
    },

    -- File explorer
    { "nvim-tree/nvim-tree.lua" },

    -- Git
    { "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup {} end
    },

    -- Colorschemes
    { "ellisonleao/gruvbox.nvim" },
    { "rose-pine/neovim",            name = "rose-pine" },
    { "f-person/auto-dark-mode.nvim" },

    -- Misc
    "echasnovski/mini.nvim",
}
-------------------------------------------------------------------------------
-- Mini

-- require 'mini.statusline'.setup {}
require('mini.tabline').setup {}
require('mini.comment').setup {}
require('mini.cursorword').setup {}
require('mini.indentscope').setup {}
require('mini.pairs').setup {}

-------------------------------------------------------------------------------
-- File explorer

-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({ renderer = { icons = { show = { file = false, folder = false } } } })

-------------------------------------------------------------------------------
-- Treesitter

-- require('nvim-treesitter.configs').setup {
--     ensure_installed = {
--         'python',
--         'swift',
--         'javascript',
--         'typescript',
--         'lua',
--         'html',
--         'css',
--         'json',
--         'yaml',
--         'toml',
--         'sql',
--         'vim',
--         'go'
--     },
--     highlight = {
--         additional_vim_regex_highlighting = true,
--     },
--     incremental_selection = { enable = true },
--     indent = { enable = true },
--     matchup = { enable = true },
--     autopairs = { enable = true }
-- }

-------------------------------------------------------------------------------
-- LSP

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    -- lsp_zero.buffer_autoformat()
    vim.keymap.set('n', '<leader>f', vim.diagnostic.open_float, { buffer = bufnr })
    vim.keymap.set('n', 'gf', vim.lsp.buf.format, { buffer = bufnr })
    vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { buffer = bufnr })
end)

require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "ruff_lsp", "tsserver", "html", "yamlls" },
    handlers = {
        lsp_zero.default_setup,
        ['lua_ls'] = function()
            -- This function overwrites the default LSP initialization
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            })
        end,
        -- check `lsp-zero` docs before adding custom LSP configs
    }
}


-------------------------------------------------------------------------------
-- Completions

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
    },
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-u>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp_action.tab_complete(),
        ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    preselect = 'item',
    formatting = cmp_format,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

-------------------------------------------------------------------------------
-- Telescope

require("telescope").setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    }
}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>fr', builtin.lsp_workspace_symbols, opts)

-- these shortcuts are taken from kickstart.nvim
vim.keymap.set('n', '<leader>sk', builtin.keymaps)
vim.keymap.set('n', '<leader>ss', builtin.builtin)
vim.keymap.set('n', '<leader>sw', builtin.grep_string)
vim.keymap.set('n', '<leader>sd', builtin.diagnostics)
vim.keymap.set('n', '<leader>sr', builtin.resume)
vim.keymap.set('n', '<leader>s.', builtin.oldfiles)

-------------------------------------------------------------------------------
-- Colorscheme

local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
    update_interval = 1000,
    set_dark_mode = function()
        vim.api.nvim_set_option('background', 'dark')
        vim.cmd('colorscheme gruvbox')
    end,
    set_light_mode = function()
        vim.api.nvim_set_option('background', 'light')
        vim.cmd('colorscheme rose-pine-dawn')
    end,
})

-- vim.cmd("colorscheme rose-pine-dawn")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme quite")
-- vim.cmd("colorscheme habamax")
-- vim.cmd("colorscheme randomhue")
-- vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme minischeme")

-------------------------------------------------------------------------------
-- Notify

local notify = require('mini.notify')
notify.setup()
vim.notify = notify.make_notify {
    INFO = { duration = 3000 },
    WARN = { duration = 3000 },
    ERROR = { duration = 5000 },
}

-------------------------------------------------------------------------------
--
