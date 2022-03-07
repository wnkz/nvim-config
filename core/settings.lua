-- listchars
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:»⋅")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("nbsp:⋅")
-- vim.opt.listchars:append("eol:↴")

-- barbar
vim.g.bufferline = {
  insert_at_end = true
}
