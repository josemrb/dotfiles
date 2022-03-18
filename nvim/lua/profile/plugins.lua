-- load
vim.cmd [[packadd packer.nvim]]

-- protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- packer use popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)
  -- itself
  use "wbthomason/packer.nvim"

  -- libs
  use "nvim-lua/plenary.nvim"

  -- ui
  -- color scheme
  use "NLKNguyen/papercolor-theme"
  -- icons
  use "kyazdani42/nvim-web-devicons"
  -- buffer line
  use "akinsho/bufferline.nvim"
  -- buffer close
  use "kazhala/close-buffers.nvim"
  -- status line
  use "nvim-lualine/lualine.nvim"
  -- indent guides
  use "lukas-reineke/indent-blankline.nvim"
  -- git signs
  use "lewis6991/gitsigns.nvim"

  -- interactive
  -- quickfix & location list
  use "milkypostman/vim-togglelist"
  -- visual keymap
  use "folke/which-key.nvim"
  -- command line highlight
  use "osyo-manga/vim-over"

    -- use 'tpope/vim-commentary'
    -- use '/usr/local/opt/fzf'
    -- use 'junegunn/fzf.vim'
    -- use {
      -- 'nvim-telescope/telescope.nvim',
      -- requires = { {'nvim-lua/plenary.nvim'} }
    -- }
    -- use 'vimwiki/vimwiki'
    -- use 'mileszs/ack.vim'
    -- use 'jremmen/vim-ripgrep'
    -- use 'chriskempson/base16-vim'
    -- use {'nvim-treesitter/nvim-treesitter',  run = ':TSUpdate' }
    -- use 'tpope/vim-fugitive'
    -- use 'neovim/nvim-lspconfig'
    -- use 'nvim-lua/popup.nvim'
    -- use 'hrsh7th/nvim-compe'
    -- switch to nvim-cmp
    -- use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/nvim-cmp'
    -- use 'hrsh7th/cmp-vsnip'

    -- use 'nvim-lua/plenary.nvim'
    -- use {
      -- 'kyazdani42/nvim-tree.lua',
      -- requires = 'kyazdani42/nvim-web-devicons',
      -- config = function() require'nvim-tree'.setup {} end
    -- }
    -- Lua
    -- use {
      -- "folke/zen-mode.nvim",
      -- config = function()
        -- require("zen-mode").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        -- }
      -- end
    -- }
end)
