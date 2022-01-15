--

local key_map = vim.api.nvim_set_keymap

key_map('n', '<leader>l', ':bnext<CR>', {noremap = true, silent = true })
key_map('n', '<leader>bd', ':bdelete<CR>', {noremap = true, silent = true })

key_map('n', 'vs', ':vs<CR>', { noremap = true, silent = true })
key_map('n', 'sp', ':sp<CR>', { noremap = true, silent = true })
key_map('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
key_map('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

key_map('n', 'ff', ':Telescope find_files<CR>', { noremap = true, silent = true})
key_map('n', 'fb', ':Telescope buffers<CR>', { noremap = true, silent = true})

key_map('n', 'tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true})

