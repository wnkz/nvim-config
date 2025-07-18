vim.o.mouse = "a"
vim.o.showmode = false
vim.o.undofile = true

vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.completeopt = "menuone,noselect"

-- Set up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
-- see autocommands.vim
vim.o.termguicolors = true

vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.scrolloff = 10 -- minimum lines to keep above and below cursor when scrolling
vim.o.laststatus = 3 -- global status line
vim.o.signcolumn = "yes"
vim.o.inccommand = "split"
vim.o.background = "dark"

-- indentation
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.softtabstop = -1
vim.o.smarttab = true
vim.o.shiftround = true
vim.o.breakindent = true

-- folding
-- vim.o.foldenable = false
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- folding:ufo
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- listchars
vim.o.list = true
vim.opt.listchars = {
  tab = "▸ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
  eol = "↴",
}
