-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup {
    options = {
        icons_enabled = false,
        --theme = 'ayu_dark',
        theme = 'gruvbox_dark',
        component_separators = { left = '|', right = '|'},
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

