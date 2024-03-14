vim.cmd("language en_US.utf-8")
vim.cmd("colorscheme onedark")

-- NvimTree
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 3 -- minimum lines to keep above and below cursor when scrolling
vim.opt.laststatus = 3 -- global status line
vim.opt.signcolumn = "auto:2"
vim.opt.hlsearch = false

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.o.completeopt = "menuone,noselect"

-- Set up cursor color and shape in various mode, ref:
-- https://github.com/neovim/neovim/wiki/FAQ#how-to-change-cursor-color-in-the-terminal
-- see autocommands.vim
vim.opt.termguicolors = true

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
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- listchars
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:»⋅")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("nbsp:⋅")

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
