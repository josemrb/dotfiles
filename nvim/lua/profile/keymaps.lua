-- local
local set_keymap = _G.set_keymap

-- modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- clear keymap for leader key
set_keymap {"", ",", ""}

-- horizontal scrolling
set_keymap {"", "zl", "zL"}
set_keymap {"", "zh", "zH"}

-- line motion
set_keymap {"", "j", "gj"}
set_keymap {"", "k", "gk"}
--set_keymap {"n", "k", "v:count == 0 ? 'gk' : 'k'", {noremap = true, expr = true, silent = true}}
--set_keymap {"n", "j", "v:count == 0 ? 'gj' : 'j'", {noremap = true, expr = true, silent = true}}

--
-- visual mode
--
-- indent
set_keymap {"v", "<", "<gv"}
set_keymap {"v", ">", ">gv"}

-- repeat
set_keymap {"v", ".", ":normal .<CR>"}

--
-- visual block mode
--
-- text move
set_keymap {"x", "J", ":move '>+1<CR>gv-gv"}
set_keymap {"x", "K", ":move '<-2<CR>gv-gv"}

--
-- normal mode
--
-- nop unused commands
set_keymap {"n", "q", ""}
set_keymap {"n", "Q", ""}

-- search highlight
set_keymap {"n", "<Leader><Space>", ":nohlsearch<CR>"}

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

-- panel
set_keymap {"n", "<C-v>", ":vsplit<CR>"}
set_keymap {"n", "<C-x>", ":split<CR>"}
