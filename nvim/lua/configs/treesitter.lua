--

require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    sync_install = false,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = true,
    },
    indent = { enable = true },
    matchup = { enable = true },
    autopairs = { enable = true }
}

