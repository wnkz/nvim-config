vim.g.mapleader = "\\"

vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "cp", "yap<S-}>p")

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>yy", "\"+yy")
