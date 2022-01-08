-- 
return require('packer').startup({function()
  use {
    'wbthomason/packer.nvim'
  }

  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
  }

  use {
    'neovim/nvim-lspconfig'
  }

  -- Auto-completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  -- For vsnip users.
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  ----------------------------------------------------------------------------
  --          Statusline
  ----------------------------------------------------------------------------

  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      -- require'nvim-web-devicons'.setup {
      --   default = true
      -- }
      require('lualine').setup {
        options = {
          theme = 'ayu_dark',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        }
      }
    end,

    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- use({
  --   "NTBBloodbath/galaxyline.nvim",

  --   config = function()
  --     require("galaxyline.themes.doom-one")
  --   end,

  --   requires = { "kyazdani42/nvim-web-devicons", opt = true }
  -- })


  ----------------------------------------------------------------------------
  --          Indent line
  ----------------------------------------------------------------------------
  use "lukas-reineke/indent-blankline.nvim"


  ----------------------------------------------------------------------------
  --          Colorscheme
  ----------------------------------------------------------------------------
  use {
    'Shatur/neovim-ayu',
    config = function()
      require('ayu').setup{mirage = true}
    end
  }
  

  ----------------------------------------------------------------------------
  --          Git integration
  ----------------------------------------------------------------------------
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('gitsigns').setup()
    end
  }



  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim', opt = true}
  }

  use {
    "folke/which-key.nvim"
  }

  use {
    'yamatsum/nvim-cursorline'
  }

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})
