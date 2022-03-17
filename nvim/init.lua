--
-- options
--
local options = {
  -- backup
  backupext = ".bak",
  -- clipboard
  clipboard = "unnamedplus",
  -- editor
  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  tabstop = 2,
  showmatch = true,
  smartindent = true,
  -- file
  fileencoding = "utf-8",
  fileformat = "unix",
  swapfile = false,
  -- fold
  foldenable = false,
  foldmethod = "indent",
  foldnestmax = 5,
  -- search case handling
  ignorecase = true,
  smartcase = true,
  -- editor format
  linebreak = true,
  wrap = false,
  -- visual aid
  cursorline = true,
  showbreak = "↪",
  list = true,
  listchars = {
    tab = "▷⋅",
    trail = "⋅",
    extends = ">",
    precedes = "<",
    nbsp = "+",
    eol = "¬"
  },
  number = true,
  relativenumber = true,
  -- mouse
  mouse = "a",
  -- ui
  cmdheight = 2,
  colorcolumn = "+1",
  rulerformat = "%30(%=\\:b%n%y%m%r%w\\ %l,%c%V\\ %P%) ",
  showmode = false,
  showtabline = 0,
  synmaxcol = 240,
  termguicolors = true,
  whichwrap = "b,s,<,>,[,]",
  -- whichwrap = { "b", "s", "<", ">", "[" ,"]" },
  -- whichwrap = { 
    --  b = true,
    --  s = true,
    --  < = true,
    --  > = true,
    --  [ = true,
    --  ] = true
  -- },
  -- pum
  pumblend = 20,
  pumheight = 12,
  -- complete
  completeopt = { "menuone", "preview", "longest" },
  -- scroll
  scrolljump = 3,
  scrolloff = 8,
  sidescrolloff = 8,
  -- windows
  splitbelow = true,
  splitright = true,
  winblend = 20,
  -- input
  timeoutlen = 500,
  -- persistent undo
  undofile = true,
  undolevels = 25
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--
-- key mappings
--
