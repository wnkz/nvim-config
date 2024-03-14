vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "cp", "yap<S-}>p")

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>yy", "\"+yy")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
