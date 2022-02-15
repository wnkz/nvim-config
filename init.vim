call plug#begin()
" Common
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Git / GitHub
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'lewis6991/gitsigns.nvim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'romgrk/barbar.nvim'
Plug 'wfxr/minimap.vim'
Plug 'mhartington/formatter.nvim'
Plug 'lukas-reineke/indent-blankline.nvim' 
Plug 'tpope/vim-commentary'
Plug 'ellisonleao/glow.nvim'
Plug 'mechatroner/rainbow_csv'
Plug 'ggandor/lightspeed.nvim'
Plug 'anuvyklack/pretty-fold.nvim'

" Theme
Plug 'olimorris/onedarkpro.nvim'

" Dashboard
Plug 'glepnir/dashboard-nvim'

" statusline
Plug 'nvim-lualine/lualine.nvim'

" LSP / Completion
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'ray-x/cmp-treesitter'
Plug 'onsails/lspkind-nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-github.nvim'

call plug#end()

source ~/.config/nvim/config/settings.vim
source ~/.config/nvim/config/mappings.vim

" LSP: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" LSP setup is called in lsp-config
luafile ~/.config/nvim/config/lsp-config.lua

luafile ~/.config/nvim/config/settings.lua
luafile ~/.config/nvim/config/telescope-config.lua
luafile ~/.config/nvim/config/lualine-config.lua
luafile ~/.config/nvim/config/cmp-config.lua
luafile ~/.config/nvim/config/formatter-config.lua
