call plug#begin()
" Common
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

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

" Theme
Plug 'Pocco81/Catppuccino.nvim'
" Plug 'joshdick/onedark.vim'

" Dashboard
Plug 'glepnir/dashboard-nvim'

" statusline
" Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lualine/lualine.nvim'

" LSP / Completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'ray-x/cmp-treesitter'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-github.nvim'

call plug#end()

source ~/.config/nvim/config/settings.vim
source ~/.config/nvim/config/mappings.vim
source ~/.config/nvim/config/theme.vim

" LSP: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" LSP setup is called in lsp-config
luafile ~/.config/nvim/config/lsp-config.lua

luafile ~/.config/nvim/config/settings.lua
luafile ~/.config/nvim/config/telescope-config.lua
luafile ~/.config/nvim/config/lualine-config.lua
luafile ~/.config/nvim/config/cmp-config.lua
luafile ~/.config/nvim/config/formatter-config.lua
luafile ~/.config/nvim/config/catppuccino-config.lua
