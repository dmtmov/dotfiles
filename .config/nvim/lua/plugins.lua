--
return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'

        -- usefull functions for Lua development
        use 'nvim-lua/plenary.nvim'

        -- Treesitter
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

        -- LSP
        --use 'williamboman/mason.nvim'
        --use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
        use 'jose-elias-alvarez/null-ls.nvim'

        -- Telescope
        use 'nvim-telescope/telescope.nvim'

        -- Git integration
        use 'lewis6991/gitsigns.nvim'
        use 'sindrets/diffview.nvim'

        -- Auto-completion
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        --use 'hrsh7th/cmp-nvim-lsp-signature-help'
        use 'hrsh7th/cmp-nvim-lua'

        -- use 'dcampos/nvim-snippy'
        -- use 'dcampos/cmp-snippy'

        use 'L3MON4D3/LuaSnip'
        use 'saadparwaiz1/cmp_luasnip'

        -- use { 'glepnir/lspsaga.nvim', branch = 'main' }

        -- GUI and Styles
        -- use 'folke/noice.nvim'
        -- use 'MunifTanjim/nui.nvim'
        use "windwp/nvim-autopairs"

        -- use 'antonk52/lake.nvim'
        use 'EdenEast/nightfox.nvim'
        use 'frenzyexists/aquarium-vim'
        use 'catppuccin/nvim'
        use 'rebelot/kanagawa.nvim'
        use 'kyazdani42/blue-moon'
        use 'ellisonleao/gruvbox.nvim'
        use 'Shatur/neovim-ayu'
        use 'rose-pine/neovim'
        use 'RRethy/nvim-base16'
        use 'yamatsum/nvim-cursorline'
        use 'terrortylor/nvim-comment'
        -- use 'lukas-reineke/indent-blankline.nvim'
        use 'wakatime/vim-wakatime'

        -- Notifications
        use 'rcarriga/nvim-notify'

        use 'nvim-tree/nvim-tree.lua'

        use { 'akinsho/bufferline.nvim' }

    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end
        }
    }
})
