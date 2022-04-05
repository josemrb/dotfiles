-- local
local trouble = require("trouble")
trouble.setup {}

-- local import
local set_keymap = _G.set_keymap

set_keymap {"n", "<Leader>xx", "<Cmd>Trouble<CR>"}
set_keymap {"n", "<Leader>xw", "<Cmd>Trouble workspace_diagnostics<CR>"}
set_keymap {"n", "<Leader>xd", "<Cmd>Trouble document_diagnostics<CR>"}
set_keymap {"n", "<Leader>xl", "<Cmd>Trouble loclist<CR>"}
set_keymap {"n", "<Leader>xq", "<Cmd>Trouble quickfix<CR>"}
set_keymap {"n", "gR", "<Cmd>Trouble lsp_references<CR>"}
