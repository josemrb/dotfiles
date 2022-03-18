--
-- functions
--

require("profile.functions")

--
-- options
--

require("profile.options")

--
-- global variables 
--

vim.g.mapleader = ","
vim.g.maplocalleader = "_"

vim.g.python3_host_prog = "/usr/bin/python3"

--
-- plugins
--

require("profile.plugins")

--
-- setup
--

-- ui
-- colorscheme
vim.cmd("colorscheme PaperColor")
-- icons
require("nvim-web-devicons").setup {}
-- buffer line = bufferline.nvim
require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and "" or ""
      return " " .. icon .. count
    end,
    numbers = function(opts)
      return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
    end,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "thick",
    always_show_bufferline = true
  }
}
-- buffer close = close-buffers.nvim
require("close_buffers").setup {
  preserve_window_layout = { "this" },
  next_buffer_cmd = function(windows)
    require("bufferline").cycle(1)
    local bufnr = vim.api.nvim_get_current_buf()

    for _, window in ipairs(windows) do
      vim.api.nvim_win_set_buf(window, bufnr)
    end
  end
}
-- status line = lualine.nvim
require("lualine").setup {
  options = {theme = "ayu_mirage"},
  extensions = {"aerial", "fugitive", "fzf", "nvim-tree", "quickfix"}
}
-- indent guides = indent-blankline.nvim
require("indent_blankline").setup {
  space_char_blankline = " ",
  -- show_current_context = true,
  -- show_current_context_start = true
}
-- quickfix & location list
-- visual keymap
require("which-key").setup {}

-- utilities
-- git signs = gitsigns.nvim
require("gitsigns").setup {}
--
-- keymaps
--

require("profile.keymaps")

