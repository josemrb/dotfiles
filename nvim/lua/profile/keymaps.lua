-- modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- clear keymap for leader key
set_keymap {"", ",", ""}

-- normal mode
-- window navigation
set_keymap {"n", "<C-h>", "<C-w>h"}
set_keymap {"n", "<C-j>", "<C-w>j"}
set_keymap {"n", "<C-k>", "<C-w>k"}
set_keymap {"n", "<C-l>", "<C-w>l"}
-- window resize
set_keymap {"n", "<C-Up>", ":resize -2<CR>"}
set_keymap {"n", "<C-Down>", ":resize +2<CR>"}
set_keymap {"n", "<C-Left>", ":vertical resize -2<CR>"}
set_keymap {"n", "<C-Right>", ":vertical resize +2<CR>"}
-- buffer goto
set_keymap {"n", "<leader>1b", ":BufferLineGoToBuffer 1<CR>"}
set_keymap {"n", "<leader>2b", ":BufferLineGoToBuffer 2<CR>"}
set_keymap {"n", "<leader>3b", ":BufferLineGoToBuffer 3<CR>"}
set_keymap {"n", "<leader>4b", ":BufferLineGoToBuffer 4<CR>"}
set_keymap {"n", "<leader>5b", ":BufferLineGoToBuffer 5<CR>"}
set_keymap {"n", "<leader>6b", ":BufferLineGoToBuffer 6<CR>"}
set_keymap {"n", "<leader>7b", ":BufferLineGoToBuffer 7<CR>"}
set_keymap {"n", "<leader>8b", ":BufferLineGoToBuffer 8<CR>"}
-- buffer navigation
set_keymap {"n", "<leader>jb", ":BufferLineCycleNext<CR>"}
set_keymap {"n", "<leader>kb", ":BufferLineCyclePrev<CR>"}
-- buffer picker
set_keymap {"n", "gb", ":BufferLinePick<CR>"}
-- buffer order management
set_keymap {"n", "<leader>lb", ":BufferLineMoveNext<CR>"}
set_keymap {"n", "<leader>hb", ":BufferLineMovePrev<CR>"}
set_keymap {"n", "<leader>xb", ":BufferLineCloseRight<CR>"}
-- buffer close
set_keymap {"n", "<leader>tb", ":BDelete this<CR>"}
