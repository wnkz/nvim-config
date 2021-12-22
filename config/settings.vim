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

" Theme
let g:onedark_style = 'darker'
colorscheme onedark
" colorscheme edge
" set background=dark
" let g:everforest_background = 'hard'
" colorscheme everforest

" Terminal
tnoremap <Esc> <C-\><C-n> 

" Dashboard
let g:dashboard_default_executive = 'telescope'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

" nvim-tree
" cf. ./settings.lua
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':p:~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
