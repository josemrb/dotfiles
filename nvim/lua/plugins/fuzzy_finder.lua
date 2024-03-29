-- local
local telescope = require("telescope")
local actions = require("telescope.actions")
-- setup
telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<ESC>"] = actions.close,
      },
    },
  },
  pickers = {
    buffers = {
      previewer = false,
      theme = "dropdown"
    },
    find_files = {
      -- find_command =  { "fd", "--type", "f" },
      -- find_command =  { "rg", "--files" },
      hidden = true,
      previewer = false,
      theme = "dropdown"
    },
  },
  extensions = {
    -- command_palette = {
      -- {"File",
      --   { "entire selection (C-a)", ":call feedkeys('GVgg')" },
      --   { "save current file (C-s)", ":w" },
      --   { "save all files (C-A-s)", ":wa" },
      --   { "quit (C-q)", ":qa" },
      --   { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
      --   { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
      --   { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
      --   { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
      -- },
      -- {"Help",
      --   { "tips", ":help tips" },
      --   { "cheatsheet", ":help index" },
      --   { "tutorial", ":help tutor" },
      --   { "summary", ":help summary" },
      --   { "quick reference", ":help quickref" },
      --   { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      -- },
      -- {"Vim",
      --   { "reload vimrc", ":source $MYVIMRC" },
      --   { 'check health', ":checkhealth" },
      --   { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
      --   { "commands", ":lua require('telescope.builtin').commands()" },
      --   { "command history", ":lua require('telescope.builtin').command_history()" },
      --   { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
      --   { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
      --   { "vim options", ":lua require('telescope.builtin').vim_options()" },
      --   { "keymaps", ":lua require('telescope.builtin').keymaps()" },
      --   { "buffers", ":Telescope buffers" },
      --   { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
      --   { "spell checker", ":set spell!" },
      --   { "search highlighting (F12)", ":set hlsearch!" },
      -- }
    -- },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true
    },
  },
}
-- telescope.load_extension("command_palette")
telescope.load_extension("file_browser")
telescope.load_extension("fzf")
-- local import
local set_keymap = _G.set_keymap
-- vim pickers
set_keymap {"n", "<Leader>fb", "<Cmd>Telescope buffers<CR>"}
-- file pickers
set_keymap {"n", "<Leader>ff", "<Cmd>Telescope find_files<CR>"}
set_keymap {"n", "<Leader>fg", "<Cmd>Telescope live_grep<CR>"}
-- set_keymap {"n", "<Leader>fr", "<Cmd>Telescope registers<CR>"}
-- lsp pickers
set_keymap {"n", "<Leader>fi", "<Cmd>Telescope lsp_implementations<CR>"}
set_keymap {"n", "<Leader>fd", "<Cmd>Telescope lsp_definitions<CR>"}
set_keymap {"n", "<Leader>fr", "<Cmd>Telescope lsp_references<CR>"}
set_keymap {"n", "<Leader>ft", "<Cmd>Telescope lsp_type_definitions<CR>"}
-- git pickers
-- set_keymap {"n", "<C-p>", "<Cmd>Telescope command_palette<CR>"}
