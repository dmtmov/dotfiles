--
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}



local tree ={}

tree.toggle = function ()
  -- This func overwrites native behavior of M.toggle func from here:
  -- github.com/kyazdani42/nvim-tree.lua/blob/master/lua/nvim-tree.lua:28
  
  local view = require'nvim-tree.view'
  local lib = require'nvim-tree.lib'

  if view.win_open() then
    require'bufferline.state'.set_offset(0)
    require'nvim-tree'.close()
  else
    -- open Tree with NO focus
    require'bufferline.state'.set_offset(31, 'FileTree')
    require'nvim-tree'.find_file(false)
 
  if not view.win_open() then
    lib.open()
  end
 end
end

return tree

