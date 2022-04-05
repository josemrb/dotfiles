-- nvim-tree.lua
vim.g.nvim_tree_respect_buf_cwd = 1
-- local
local nvim_tree = require("nvim-tree")
nvim_tree.setup {
  disable_netrw = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
-- local import
local set_keymap = _G.set_keymap
set_keymap {"n", "<Leader>n", ":NvimTreeToggle<CR>"}
