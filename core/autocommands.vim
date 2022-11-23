luafile ~/.config/nvim/core/autocommands.lua

augroup cursor_settings
  autocmd!
  autocmd VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait100-blinkoff500-blinkon500
    \,sm:block-blinkwait175-blinkoff150-blinkon175
  autocmd VimLeave,VimSuspend * set guicursor=a:block-blinkwait100-blinkoff500-blinkon500
augroup END

augroup term_settings
  autocmd!
  " Go to insert mode by default to start typing command
  autocmd TermOpen * startinsert
augroup END

" Auto-generate packer_compiled.lua file
augroup packer_user_config 
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup END
