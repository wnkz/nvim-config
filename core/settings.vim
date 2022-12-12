scriptencoding utf-8

luafile ~/.config/nvim/core/settings.lua

" Use English as main language
language en_US.utf-8

colorscheme onedark

set mouse=a
set nu
set cursorline
set hidden
set undofile
set noshowmode
set showcmd
set inccommand=nosplit
set ignorecase
set smartcase
set updatetime=250
set signcolumn=yes
set nowrap

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

set smartindent
set expandtab
set tabstop=2
set shiftwidth=0
set softtabstop=-1
set smarttab
" round indentation to multiples of 'shiftwidth' when shifting text
" (so that it behaves like Ctrl-D / Ctrl-T):
set shiftround

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" Terminal
tnoremap <Esc> <C-\><C-n> 

" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
" see autocommands.vim
set termguicolors

set signcolumn=auto:2

" Global statusline
set laststatus=3
