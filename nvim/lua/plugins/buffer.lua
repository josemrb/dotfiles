-- local
local set_keymap = _G.set_keymap
-- bufferline.nvim
local bufferline = require("bufferline")
bufferline.setup {
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and "" or ""
      return " " .. icon .. count
    end,
    numbers = function(opts)
      return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"
      }
    },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "thick",
    always_show_bufferline = true
  }
}
-- local
-- close-buffers.nvim
local close_buffers = require("close_buffers")
close_buffers.setup {
  preserve_window_layout = { "this" },
  next_buffer_cmd = function(windows)
    bufferline.cycle(1)
    local bufnr = vim.api.nvim_get_current_buf()

    for _, window in ipairs(windows) do
      vim.api.nvim_win_set_buf(window, bufnr)
    end
  end
}

-- buffer goto
set_keymap {"n", "<Leader>1b", ":BufferLineGoToBuffer 1<CR>"}
set_keymap {"n", "<Leader>2b", ":BufferLineGoToBuffer 2<CR>"}
set_keymap {"n", "<Leader>3b", ":BufferLineGoToBuffer 3<CR>"}
set_keymap {"n", "<Leader>4b", ":BufferLineGoToBuffer 4<CR>"}
set_keymap {"n", "<Leader>5b", ":BufferLineGoToBuffer 5<CR>"}
set_keymap {"n", "<Leader>6b", ":BufferLineGoToBuffer 6<CR>"}
set_keymap {"n", "<Leader>7b", ":BufferLineGoToBuffer 7<CR>"}
set_keymap {"n", "<Leader>8b", ":BufferLineGoToBuffer 8<CR>"}

-- buffer navigation
set_keymap {"n", "<Leader>jb", ":BufferLineCycleNext<CR>"}
set_keymap {"n", "<Leader>kb", ":BufferLineCyclePrev<CR>"}

-- buffer picker
set_keymap {"n", "gb", ":BufferLinePick<CR>"}

-- buffer order management
set_keymap {"n", "<Leader>lb", ":BufferLineMoveNext<CR>"}
set_keymap {"n", "<Leader>hb", ":BufferLineMovePrev<CR>"}
set_keymap {"n", "<Leader>xb", ":BufferLineCloseRight<CR>"}

-- buffer close
set_keymap {"n", "<Leader>cb", ":BDelete this<CR>"}
