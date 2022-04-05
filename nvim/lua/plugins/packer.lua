-- load
vim.cmd [[packadd packer.nvim]]

-- protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("packer.nvim not found!")
  return
end

-- headless run
-- $ nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
return packer.startup({function(use)
  --
  -- system
  --
  -- plugin manager
  use "wbthomason/packer.nvim"
  -- cache
  use "lewis6991/impatient.nvim"
  -- filetype
  use "nathom/filetype.nvim"
  -- libs
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "tomtom/tlib_vim"
  use "tami5/sqlite.lua"

  --
  -- editor behaviour
  --
  -- syntax parser
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  -- use "romgrk/nvim-treesitter-context"
  -- use "mfussenegger/nvim-treehopper"
  use "RRethy/nvim-treesitter-textsubjects"
  -- snippet
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "saadparwaiz1/cmp_luasnip"
  -- lsp
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"
  use "onsails/lspkind-nvim"
  use "hrsh7th/cmp-nvim-lsp"
  -- dap
  use "mfussenegger/nvim-dap"
  -- completion
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-calc"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-path"
  -- use "hrsh7th/cmp-nvim-lua"
  -- use "hrsh7th/cmp-nvim-lsp-signature-help"
  use "hrsh7th/nvim-cmp"

  --
  -- commands
  --
  -- async build
  use "tpope/vim-dispatch"
  -- shell utils
  use "tpope/vim-eunuch"
  -- search & replace
  use "tpope/vim-abolish"
  -- preview command
  use "osyo-manga/vim-over"
  -- projections
  use "tpope/vim-projectionist"

  --
  -- editor mappings
  --
  -- motion
  use "phaazon/hop.nvim"
  -- visual cursors
  -- use "mg979/vim-visual-multi"
  -- match pairs
  use "andymass/vim-matchup"
  -- repeat
  use "tpope/vim-repeat"
  -- utility mappings
  use "tpope/vim-unimpaired"
  -- move delimited elements
  use "machakann/vim-swap"
  -- increment values
  use "tpope/vim-speeddating"
  -- surround
  use "tpope/vim-surround"
  -- comments
  use "tpope/vim-commentary"
  use "folke/todo-comments.nvim"
  -- close operators
  use "tpope/vim-endwise"
  -- close brackets
  -- use "rstacruz/vim-closer"
  -- text alignment
  use "godlygeek/tabular"
  -- substitute
  use "svermeulen/vim-subversive"
  -- better paste
  use "svermeulen/vim-yoink"
  -- format number
  use "glts/vim-magnum"
  use "glts/vim-radical"
  -- visual keymap
  -- use "folke/which-key.nvim"
  -- text objects
  use "kana/vim-textobj-user"
  use "kana/vim-textobj-entire"
  use "whatyouhide/vim-textobj-xmlattr"
  -- test
  use "vim-test/vim-test"

  --
  -- editor ui
  --
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
  -- color codes
  use "norcalli/nvim-colorizer.lua"

  --
  -- utilities
  --
  -- quickfix
  use "romainl/vim-qf"
  use "stefandtw/quickfix-reflector.vim"
  -- quickfix & location list
  -- use "milkypostman/vim-togglelist"
  -- dap ui
  use "rcarriga/nvim-dap-ui"
  -- diagnostics
  use "folke/trouble.nvim"
  -- diff viewer
  use "sindrets/diffview.nvim"
  -- file explorer
  use "kyazdani42/nvim-tree.lua"
  -- fuzzy finder
  use "nvim-telescope/telescope.nvim"
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }
  use "nvim-telescope/telescope-file-browser.nvim"
  -- use "LinArcX/telescope-command-palette.nvim"
  -- undo
  use "mbbill/undotree"
  -- git client
  use "TimUntersberger/neogit"
  -- wiki engine
  use "nvim-neorg/neorg"
  -- database client
  use "tpope/vim-dadbod"
  -- code drawer
  use "ldelossa/litee.nvim"
  use "ldelossa/litee-bookmarks.nvim"
  use "ldelossa/litee-calltree.nvim"
  use "ldelossa/litee-symboltree.nvim"
  -- tagbar
  use "majutsushi/tagbar"

  --
  -- integrations
  --
  -- editor config
  use "editorconfig/editorconfig-vim"
  -- environment vars
  use "tpope/vim-dotenv"

  --
  -- language support
  --
  -- csv
  use "chrisbra/csv.vim"

  -- elixir
  use "elixir-editors/vim-elixir"

  -- html & css
  use "othree/html5.vim"
  use "hail2u/vim-css3-syntax"
  use "cakebaker/scss-syntax.vim"

  -- json & javascript
  use "elzr/vim-json"
  use "tpope/vim-jdaddy"
  use "pangloss/vim-javascript"
  use "moll/vim-node"

  -- markdown
  use "plasticboy/vim-markdown"

  -- ruby
  use 'tpope/vim-rbenv'
  use 'vim-ruby/vim-ruby'
  use 'tpope/vim-rake'
  use 'tpope/vim-bundler'
  use 'tpope/vim-rails'
  use 'tpope/vim-haml'

  -- rust
  use "rust-lang/rust.vim"

  --
  -- tools
  --
  -- ansible
  use "pearofducks/ansible-vim"
  -- docker
  use "ekalinin/dockerfile.vim"
  -- tmux
  use "tmux-plugins/vim-tmux"

end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float {border = "rounded"}
      end,
    },
  },
})
