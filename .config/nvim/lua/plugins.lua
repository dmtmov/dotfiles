--
return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'

        -- usefull functions for Lua development
        use 'nvim-lua/plenary.nvim'

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'nvim-treesitter/playground' }

        -- LSP
        use 'neovim/nvim-lspconfig'

        -- Telescope
        use 'nvim-telescope/telescope.nvim'

        -- Git integration
        use 'lewis6991/gitsigns.nvim'
        use 'sindrets/diffview.nvim'

        -- Auto-completion
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lua'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use { 'tzachar/cmp-tabnine', run = './install.sh' }
        use 'dcampos/nvim-snippy'
        use 'dcampos/cmp-snippy'

        -- GUI and Styles
        use 'Shatur/neovim-ayu'
        use 'norcalli/nvim-base16.lua'
        use 'elvessousa/sobrio'
        use 'yamatsum/nvim-cursorline'
        use 'terrortylor/nvim-comment'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'xiyaowong/nvim-transparent'

        use 'wakatime/vim-wakatime'
        -- Notifications
        use 'rcarriga/nvim-notify'

    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})

