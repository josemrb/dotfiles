--
-- local profile
--

require("profile/functions")

require("profile/options")

require("profile/keymaps")

--
-- global variables
--

vim.g.mapleader = ","
vim.g.maplocalleader = "-"

vim.g.python3_host_prog = "/usr/bin/python3"

vim.g.loaded_gzip = false
vim.g.loaded_matchit = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_man = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false

--
-- plugins
--

-- local import
local set_keymap = _G.set_keymap

--
-- system
--
-- plugin manager
require("plugins/packer")
-- cache
require("impatient")

--
-- editor behaviour
--
-- syntax parser
require("plugins/syntax")
-- snippet
require("plugins/snippet")
-- lsp
require("plugins/lsp")
-- dap
require("plugins/debugger")
-- completion
require("plugins/completion")

--
-- editor mappings
--
-- motion
local hop = require("hop")
hop.setup {}

set_keymap {"n", "<Leader><Leader>w", "<Cmd>HopWord<CR>", {}}
set_keymap {"o", "<Leader><Leader>w", "<Cmd>HopWord<CR>", {}}
set_keymap {"n", "<Leader><Leader>l", "<Cmd>HopLine<CR>", {}}
set_keymap {"o", "<Leader><Leader>l", "<Cmd>HopLine<CR>", {}}
-- match
vim.g.matchup_surround_enabled = 0
-- comments
local todo_comments = require("todo-comments")
todo_comments.setup {}
set_keymap {"n", "<Leader>td", "<Cmd>TodoTrouble<CR>"}
-- text alignment
set_keymap {"n", "<Leader>a&", "<Cmd>Tabularize /&<CR>", {}}
set_keymap {"v", "<Leader>a&", "<Cmd>Tabularize /&<CR>", {}}
set_keymap {"n", "<Leader>a=", "<Cmd>Tabularize /=<CR>", {}}
set_keymap {"v", "<Leader>a=", "<Cmd>Tabularize /=<CR>", {}}
set_keymap {"n", "<Leader>a==", "<Cmd>Tabularize /=/=<CR>", {}}
set_keymap {"v", "<Leader>a==", "<Cmd>Tabularize /=/=<CR>", {}}
set_keymap {"n", "<Leader>a=>", "<Cmd>Tabularize /=><CR>", {}}
set_keymap {"v", "<Leader>a=>", "<Cmd>Tabularize /=><CR>", {}}
set_keymap {"n", "<Leader>a:", "<Cmd>Tabularize /:<CR>", {}}
set_keymap {"v", "<Leader>a:", "<Cmd>Tabularize /:<CR>", {}}
set_keymap {"n", "<Leader>a::", "<Cmd>Tabularize /:\zs<CR>", {}}
set_keymap {"v", "<Leader>a::", "<Cmd>Tabularize /:\zs<CR>", {}}
set_keymap {"n", "<Leader>a,", "<Cmd>Tabularize /,<CR>", {}}
set_keymap {"v", "<Leader>a,", "<Cmd>Tabularize /,<CR>", {}}
set_keymap {"n", "<Leader>a,,", "<Cmd>Tabularize /,\zs<CR>", {}}
set_keymap {"v", "<Leader>a,,", "<Cmd>Tabularize /,\zs<CR>", {}}
set_keymap {"n", "<Leader>a<Bar>", "<Cmd>Tabularize /<Bar><CR>", {}}
set_keymap {"v", "<Leader>a<Bar>", "<Cmd>Tabularize /<Bar><CR>", {}}
-- substite
set_keymap {"n", "s", "<Plug>(SubversiveSubstitute)", noremap = false}
set_keymap {"n", "ss", "<Plug>(SubversiveSubstituteLine)", noremap = false}
set_keymap {"n", "S", "<Plug>(SubversiveSubstituteToEndOfLine)", noremap = false}
set_keymap {"x", "s", "<Plug>(SubversiveSubstitute)", noremap = false}
set_keymap {"x", "p", "<Plug>(SubversiveSubstitute)", noremap = false}
set_keymap {"x", "P", "<Plug>(SubversiveSubstitute)", noremap = false}
set_keymap {"n", "<Leader>s", "<Plug>(SubversiveSubvertRange)", noremap = false}
set_keymap {"x", "<Leader>s", "<Plug>(SubversiveSubvertRange)", noremap = false}
set_keymap {"n", "<Leader>ss", "<Plug>(SubversiveSubvertWordRange)", noremap = false}
set_keymap {"n", "<Leader>sc", "<Plug>(SubversiveSubvertRangeConfirm)", noremap = false}
set_keymap {"x", "<Leader>sc", "<Plug>(SubversiveSubvertRangeConfirm)", noremap = false}
set_keymap {"n", "<Leader>ssc", "<Plug>(SubversiveSubvertWordRangeConfirm)", noremap = false}
-- better paste
set_keymap {"n", "<C-n>", "<Plug>(YoinkPostPasteSwapBack)", noremap = false}
set_keymap {"n", "<C-p>", "<Plug>(YoinkPostPasteSwapForward)", noremap = false}
set_keymap {"n", "p", "<Plug>(YoinkPaste_p)", noremap = false}
set_keymap {"n", "P", "<Plug>(YoinkPaste_P)", noremap = false}
-- visual keymap
-- require("which-key").setup {}

--
-- editor ui
--
-- theme
require("plugins/theme")
-- buffer line
require("plugins/buffer")
-- status line
require("plugins/status")
-- colorizer
local colorizer = require("colorizer")
colorizer.setup {}

--
-- utilities
--
-- quickfix & loclist
set_keymap {"n", "<Leader>q", "<Plug>(qf_qf_toggle)", noremap = false}
set_keymap {"n", "<Leader>l", "<Plug>(qf_loc_toggle)", noremap = false}

vim.g.qf_mapping_ack_style = 1
vim.g.qf_auto_open_quickfix = 0
vim.g.qf_auto_open_loclist = 0

-- diagnostics
require("plugins/diagnostics")
-- file explorer
require("plugins/file_explorer")
-- fuzzy finder
require("plugins/fuzzy_finder")
-- undo
set_keymap {"n", "<F5>", "<Cmd>UndotreeToggle<CR>"}
-- git
require("plugins/git")
-- wiki engine
require("plugins/wiki")
-- code drawer
require("litee.lib").setup {}
require("litee.bookmarks").setup {}
require("litee.calltree").setup {}
require("litee.symboltree").setup {}

--
-- autocommands
--

require("profile/autocommands")
