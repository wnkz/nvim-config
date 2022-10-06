scriptencoding utf-8

luafile ~/.config/nvim/core/settings.lua

" Use English as main language
language en_US.utf-8

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

" length of an actual \t character:
set tabstop=2
" length to use when editing text (eg. TAB and BS keys)
" (0 for ‘tabstop’, -1 for ‘shiftwidth’):
set softtabstop=-1
" length to use when shifting text (eg. <<, >> and == commands)
" (0 for ‘tabstop’):
set shiftwidth=0
" round indentation to multiples of 'shiftwidth' when shifting text
" (so that it behaves like Ctrl-D / Ctrl-T):
set shiftround

" if set, only insert spaces; otherwise insert \t and complete with spaces:
set expandtab
set smartindent

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" Terminal
tnoremap <Esc> <C-\><C-n> 

set termguicolors

" Set up cursor color and shape in various mode, ref:
" https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
" see autocommands.vim

set signcolumn=auto:2

" Global statusline
set laststatus=3
