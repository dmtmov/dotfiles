--

require('ayu').setup({ mirage=dark })
require('ayu').colorscheme()

-- Highlight same patterns in file on word under cursor
vim.g.cursorword_highlight = false

-- Enable native terminal colors and code identation
vim.opt.termguicolors = true

require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = false
})

