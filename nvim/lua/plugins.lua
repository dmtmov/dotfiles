--
return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'

        -- usefull functions for Lua development
        use 'nvim-lua/plenary.nvim'

        -- Treesitter
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

        -- LSP
        use 'neovim/nvim-lspconfig'

        -- Auto-completion
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use {'tzachar/cmp-tabnine', run='./install.sh'}
        use 'dcampos/nvim-snippy'
        use 'dcampos/cmp-snippy'

        -- Sidebar
        use 'kyazdani42/nvim-tree.lua'

        -- Top & Bottom bar
        use 'nvim-lualine/lualine.nvim'

        -- Colorscheme
        -- Highlights
        -- Indent line
        use 'Shatur/neovim-ayu'
        use 'yamatsum/nvim-cursorline'
        use 'lukas-reineke/indent-blankline.nvim'

        -- Git integration
        use 'lewis6991/gitsigns.nvim'

        -- Telescope
        use 'nvim-telescope/telescope.nvim'

    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})

