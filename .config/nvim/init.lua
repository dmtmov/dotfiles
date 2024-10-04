-- inspired by:
--      https://github.com/ThePrimeagen/neovimrc
--      https://github.com/nvim-lua/kickstart.nvim
--
-------------------------------------------------------------------------------
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none",
        "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

vim.opt.laststatus = 2
vim.opt.wildmenu = true
vim.opt.signcolumn = "auto"
vim.opt.cmdheight = 0

vim.opt.clipboard = "unnamedplus"

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 10

-- Rullers
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+0,+0"
vim.opt.cursorline = true

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

vim.opt.mouse = "nv"
vim.opt.mousescroll = "ver:1,hor:1"

-- vim.opt.statusline = " %f %m %= %l:%c ♥  "

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
-- vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Open Terminal in new window
vim.keymap.set('n', '<leader>T', ':terminal<CR>', opts)
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>') -- leave insert mode in terminal

-- Disable highlight
vim.keymap.set('n', '<esc>', ':noh<cr>', opts)

-- Intuitive work with the clipboard
-- lead the deleted/changed text to the blackhole
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', opts)
vim.keymap.set({ 'n', 'v' }, '<leader>c', '"_c', opts)


vim.keymap.set('n', '<leader>n', ':bnext<CR>', opts)
vim.keymap.set('n', '<leader>p', ':bprev<CR>', opts)
vim.keymap.set('n', '<leader>bd', ':bdelete | bNext<CR>', opts)
vim.keymap.set('n', '<leader>q', ':x<CR>', opts)
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)
vim.keymap.set('n', '<leader>s', ':luafile %<CR>', opts)

-------------------------------------------------------------------------------
-- Plugins
require("lazy").setup({
    spec = {
        "nvim-lua/plenary.nvim",

        -- Treesitter
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

        -- Telescope
        { "nvim-telescope/telescope.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim", build = "make"
        },

        -- LSP
        {
            "VonHeikemen/lsp-zero.nvim",
            branch = 'v3.x',
            dependencies = {
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
        { "lewis6991/gitsigns.nvim",      config = true },

        -- Colorschemes
        { "ellisonleao/gruvbox.nvim" },
        { "rose-pine/neovim",             name = "rose-pine" },
        { "Shatur/neovim-ayu" },
        { "projekt0n/github-nvim-theme" },
        { "rebelot/kanagawa.nvim" },
        { "sainnhe/everforest" },
        { "xero/miasma.nvim" },
        { "maxmx03/solarized.nvim" },
        { "shaunsingh/nord.nvim" },
        { 'kepano/flexoki-neovim',        name = 'flexoki' },
        { 'RRethy/base16-nvim' },

        -- Misc
        { "echasnovski/mini.statusline",  veresion = '*' },
        { "echasnovski/mini.indentscope", veresion = '*' },
        { "echasnovski/mini.tabline",     veresion = '*' },
        { "echasnovski/mini.cursorword",  veresion = '*' },
        { "echasnovski/mini.pairs",       veresion = '*' },
        { "echasnovski/mini.notify",      veresion = '*' },
        { "echasnovski/mini.icons",       veresion = '*' },
        { "echasnovski/mini.hues",        veresion = '*' },
        { "echasnovski/mini.base16",      veresion = '*' },

        "wakatime/vim-wakatime",

        "supermaven-inc/supermaven-nvim",
        -- "Exafunction/codeium.nvim",

        {
            "rcarriga/nvim-dap-ui",
            dependencies = {
                "mfussenegger/nvim-dap",
                "nvim-neotest/nvim-nio",
                "mfussenegger/nvim-dap-python",
                "nvim-telescope/telescope-dap.nvim"
            }
        },


        -- https://github.com/smoka7/multicursors.nvim
        {
            "smoka7/multicursors.nvim",
            event = "VeryLazy",
            dependencies = {
                'nvimtools/hydra.nvim',
            },
            opts = {},
            cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
            keys = {
                {
                    mode = { 'v', 'n' }, '<Leader>m', '<cmd>MCstart<cr>'
                },
            },
        },

        -- AI section:
        -- {
        --     "yetone/avante.nvim",
        --     event = "VeryLazy",
        --     lazy = false,
        --     opts = {
        --         provider = "openai",
        --     },
        --     keys = {
        --         { "<leader>aa", function() require("avante.api").ask() end,    mode = { "n", "v" } },
        --         { "<leader>ae", function() require("avante.api").edit() end,   mode = "v" },
        --     },
        --     dependencies = {
        --         "stevearc/dressing.nvim",
        --         "nvim-lua/plenary.nvim",
        --         "MunifTanjim/nui.nvim",
        --     },
        -- }
    },
    -- colorscheme that will be used when installing plugins.
    -- automatically check for plugin updates
    checker = { enabled = true },
})

-------------------------------------------------------------------------------
-- Mini

require('mini.statusline').setup()
require('mini.tabline').setup {}
require('mini.cursorword').setup {}
require('mini.indentscope').setup {}
require('mini.pairs').setup {}

-------------------------------------------------------------------------------
-- File explorer

-- disable netrw at the very start
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- require("nvim-tree").setup({
--     renderer = { icons = { show = { file = false, folder = false } } }
-- })

-------------------------------------------------------------------------------
-- Treesitter

require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        additional_vim_regex_highlighting = true,
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<M-space>",
            node_incremental = "<M-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
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
    vim.keymap.set('n', 'gds', ':vsplit | lua vim.lsp.buf.definition()<CR>', { buffer = bufnr })
end)

require("mason").setup {}
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", },
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
        ['gopls'] = function()
            require('lspconfig').gopls.setup({
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
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
local cmp_format = lsp_zero.cmp_format()
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = "supermaven" },
        -- { name = "codeium" },
    },
    mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        -- ["<Tab>"] = cmp_action.tab_complete(),
        -- ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
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
            previewer = false,
            layout_config = {
                prompt_position = "top"
            },
        },
        diagnostics = {
            theme = "ivy",
            previewer = false,
        },
        find_files = {
            theme = "dropdown",
            previewer = false,
            layout_config = {
                prompt_position = "top"
            },
        },
        live_grep = {
            layout_strategy = 'vertical',
        },
        colorscheme = {
            theme = "dropdown",
            enable_preview = true,
        }
    },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('dap')


local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>', ':Telescope<CR>', opts)
vim.keymap.set('n', '<leader>D', builtin.diagnostics, opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)

-------------------------------------------------------------------------------
-- DAP

-- dap.configurations.python = {
--     {
--         type = 'debugpy',
--         request = 'launch',
--         name = "Launch file",
--         module = "uvicorn",
--         -- program = "${file}",
--         args = { "main:app", "--reload" },
--         jinja = true,
--         pythonPath = function()
--             return '/Users/d/projects/sqlx-admin/.venv/bin/debugpy'
--         end,
--     },
-- }

-- local dap = require('dap')
-- dap.adapters.python = {
--     type = 'executable',
--     command = 'python',
--     args = { '-m', 'debugpy.adapter' }
-- }
-- dap.configurations.python = {
--     {
--         -- module = "uvicorn",
--         type = 'python',
--         require = 'launch',
--         name = "Launch file",
--         program = "${file}",
--         pythonPath = function() return '/Users/d/projects/sqlx-admin/.venv/bin/debugpy' end,
--     },
-- }

require("dap-python").setup("python")

require("dapui").setup({
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.5
        }, {
            id = "breakpoints",
            size = 0.5
        -- }, {
        --     id = "stacks",
        --     size = 0.25
        -- }, {
        --     id = "watches",
        --     size = 0.25
        } },
        position = "left",
        size = 40
    }, {
        elements = {
            {
                id = "repl",
                -- size = 1
            },
            -- {
            --     id = "console",
            --     size = 0
            -- }
        },
        position = "bottom",
        size = 10
    } },

})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end


-------------------------------------------------------------------------------
-- AI section

require('supermaven-nvim').setup({
    log_level = "off",
})

-------------------------------------------------------------------------------
-- Colorscheme

local function isDarkMode()
    local file = io.popen('defaults read -g AppleInterfaceStyle', 'r')
    local output = file:read('*all')
    file:close() -- no way to be nil

    if output:match("Dark") then
        return true
    end
    return false
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
    highlight_groups = {
        StatusLine = { fg = "love", bg = "love", blend = 10 },
        StatusLineNC = { fg = "subtle", bg = "surface" },
    },
})

-- Color scheme settings - Everforest
vim.g.everforest_background = 'medium'
vim.g.everforest_better_performance = 1

-- Color scheme settings - Nord
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_italic = true
vim.g.nord_bold = true
require('nord').set()

-- Color scheme settings - Kanagawa
vim.g.kanagawa_italic = true
vim.g.kanagawa_underline = true
require('kanagawa').setup({
    transparent = false,
    dimInactive = true,
    theme = 'wave',
    background = {
        dark = 'wave',
        light = 'lotus',
    }

})

-- Color scheme settings - Gruvbox
require('gruvbox').setup { contrast = "hard" }
require('solarized').setup({ theme = "default", transparent = { enabled = true } })
require('ayu').setup({
    mirage = false,
    terminal = true,
})

-- Color scheme settings - Github
require('github-theme').setup({
    options = {
        dim_inactive = true
    },
    -- groups = {
    --     github_light = {
    --         Normal = { bg = '#FFFCEB' },
    --         -- ColorColumn = { bg = '#000000' },
    --         -- CursorLine = { bg = '#000000', fg = '#ffffff' },
    --         -- StatusLine = { bg = '#FFFCEB', fg = '#000000' },
    --     },
    -- }
})


toggleAppearance(
    -- Dark:
    -- 'ayu',
    -- 'gruvbox',
    'kanagawa',
    -- 'solarized',
    -- 'flexoki-dark',
    -- 'rose-pine',
    -- Light:
    -- 'giuthub-light',
    -- 'flexoki-light'
    'rose-pine-dawn'
)

-- Enable transparency
vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight SignColumn guibg=none
  highlight LineNr guibg=none
  highlight CursorLineNr guibg=none
  highlight GitSignsAdd guibg=none
  highlight GitSignsChange guibg=none
  highlight GitSignsDelete guibg=none
  highlight DiagnosticSignError guibg=none
  highlight DiagnosticSignWarn guibg=none
  highlight DiagnosticSignHint guibg=none
  highlight DiagnosticSignInfo guibg=none
]]

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
