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
vim.opt.relativenumber = true

-- Tabs & indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.laststatus = 3
vim.opt.wildmenu = true
vim.opt.signcolumn = "number"

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
vim.opt.colorcolumn = "-40,-20,-0"
vim.opt.cursorline = true

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
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')

-- Disable CMD history
vim.keymap.set({ 'n', 'v' }, 'q:', '<nop>', opts)

-- Open Filetree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Open Terminal in new window
vim.keymap.set('n', '<leader>T', ':terminal<CR>', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- leave insert mode in terminal

-- Disable highlight
vim.keymap.set('n', '<esc>', ':noh<cr>', opts)

vim.keymap.set('n', '<leader>t', ':tabnew<CR>', opts)
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
    { "ellisonleao/gruvbox.nvim",   opts = { contrast = "hard" } },

    { "rose-pine/neovim",           name = "rose-pine" },
    { "Shatur/neovim-ayu" },
    { "projekt0n/github-nvim-theme" },
    { "rebelot/kanagawa.nvim" },
    { "sainnhe/everforest" },
    { "xero/miasma.nvim" },
    { "maxmx03/solarized.nvim" },
    { "shaunsingh/nord.nvim" },
    -- Misc
    { "echasnovski/mini.nvim",      veresion = '*' },
    "wakatime/vim-wakatime",
}

-------------------------------------------------------------------------------
-- Mini

-- require('mini.statusline').setup {}
require('mini.tabline').setup {}
require('mini.cursorword').setup {}
require('mini.indentscope').setup {}
require('mini.pairs').setup {}

-------------------------------------------------------------------------------
-- File explorer

-- disable netrw at the very start
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    renderer = { icons = { show = { file = false, folder = false } } }
})

-------------------------------------------------------------------------------
-- Treesitter

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'python',
        'javascript',
        'typescript',
        'lua',
        'html',
        'go',
        'gomod',
        'gosum',
        'css',
        'json',
        'yaml',
        'toml',
        'markdown',
        'git_config',
        'gitignore',
        'sql',
        'vim',
    },
    highlight = {
        additional_vim_regex_highlighting = true,
        enable = true
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
    matchup = { enable = true },
    autopairs = { enable = true }
}

-------------------------------------------------------------------------------
-- LSP

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    -- lsp_zero.buffer_autoformat()
    vim.keymap.set('n', 'gf', vim.diagnostic.open_float, { buffer = bufnr })
    vim.keymap.set('n', 'gF', vim.lsp.buf.format, { buffer = bufnr })
    vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, { buffer = bufnr })
end)

require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "pyright", "tsserver", "html", "yamlls", "gopls", "bashls" },
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
        ['bashls'] = function()
            require('lspconfig').bashls.setup({
                filetypes = { "sh", "zsh", "bash" }
            })
        end,
        -- check `lsp-zero` docs before adding custom LSP configs
    }
}


-------------------------------------------------------------------------------
-- Completions

local cmp = require('cmp')
local cmp_format = lsp_zero.cmp_format()
local cmp_action = lsp_zero.cmp_action()

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
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
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
    },
    pickers = {
        buffers = {
            theme = "dropdown",
        },
        diagnostics = {
            theme = "ivy"
        }
    },
    defaults = {
        layout_config = {
            -- width = 0.8,
            -- height = 0.9,
            -- preview_cutoff = 120,
            -- prompt_position = "bottom"
        },
        layout_strategy = 'vertical'
    }
}
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>', ':Telescope<CR>', opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)

-------------------------------------------------------------------------------
-- Colorscheme

local function isDarkMode()
    local file = io.popen('defaults read -g AppleInterfaceStyle', 'r')
    local output = file:read('*all')
    file:close() -- no way to be nil

    if output:match("Dark") then
        return true
    else
        return false
    end
end

local function toggleAppearance(dark_scheme, light_scheme)
    -- The func doesn't observe for system appearance but gets it on call.
    if isDarkMode() then
        vim.api.nvim_set_option('background', 'dark')
        vim.cmd('colorscheme ' .. dark_scheme)
    else
        vim.api.nvim_set_option('background', 'light')
        vim.cmd('colorscheme ' .. light_scheme)
    end
end

-- Color scheme settings - Rose Pine
require("rose-pine").setup({
    dark_variant = "main",
    dim_inactive_windows = true,
    styles = {
        transparency = false
    },
    highlight_groups = {
        StatusLine = { fg = "love", bg = "love", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },
    },
})
vim.opt.statusline = " %f %m %= %l:%c ♥ "

-- Color scheme settings - Everforest
-- vim.g.everforest_background = 'medium'
-- vim.g.everforest_better_performance = 1
-- vim.cmd("set background=dark")

-- Color scheme settings - Nord
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = true
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = true
-- vim.g.nord_bold = true
-- require('nord').set()

-- toggleAppearance(
--     'github_dark_default',
--     'github_light_default'
-- )
-- require('ayu').colorscheme({ mirage = true })
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
