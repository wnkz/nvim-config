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

" Theme
Plug 'Pocco81/Catppuccino.nvim'
" Plug 'joshdick/onedark.vim'

" Dashboard
Plug 'glepnir/dashboard-nvim'

" statusline
Plug 'hoob3rt/lualine.nvim'

" LSP / Completion
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-github.nvim'

" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
call plug#end()

source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/mappings.vim
source ~/.config/nvim/general/theme.vim
" source ~/.config/nvim/general/plug-config/nerdtree.vim

" LSP: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
" LSP setup is called in lsp-config
luafile ~/.config/nvim/lua/lsp/lsp-config.lua

luafile ~/.config/nvim/lua/settings.lua
luafile ~/.config/nvim/lua/telescope-config.lua
luafile ~/.config/nvim/lua/lualine-config.lua
luafile ~/.config/nvim/lua/compe-config.lua
luafile ~/.config/nvim/lua/formatter-config.lua
luafile ~/.config/nvim/lua/catppuccino-config.lua
