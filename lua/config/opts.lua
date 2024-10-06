vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.undofile = true

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.o.completeopt = "menuone,noselect"

-- Set up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
-- see autocommands.vim
vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10 -- minimum lines to keep above and below cursor when scrolling
vim.opt.laststatus = 3 -- global status line
vim.opt.signcolumn = "yes"
vim.opt.inccommand = "split"
vim.opt.background = "dark"

-- indentation
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1
vim.opt.smarttab = true
vim.opt.shiftround = true
vim.opt.breakindent = true

-- folding
-- vim.opt.foldenable = false
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- folding:ufo
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- listchars
vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
  eol = "↴",
}
