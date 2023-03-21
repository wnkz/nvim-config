vim.g.mapleader = "\\"

vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<leader>s", ":update<CR>")
vim.keymap.set("n", "cp", "yap<S-}>p")

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>yy", "\"+yy")

-- Telescope
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>fa", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>fr", ":Telescope git_branches<CR>")

-- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { silent = true })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { silent = true })

-- Sessions
vim.keymap.set("n", "<leader>ss", ":SessionManager save_current_session<CR>")
vim.keymap.set("n", "<leader>sl", ":SessionManager load_current_dir_session<CR>")

-- bufferline
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<A-c>", ":BDelete this<CR>", opts)
vim.keymap.set("n", "<C-p>", ":BufferLinePick<CR>", opts)
vim.keymap.set("n", "<A-p>", ":BufferLineTogglePin<CR>", opts)
vim.keymap.set("n", "<A-,>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set("n", "<A-.>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set("n", "<A-<>", ":BufferLineMovePrev<CR>", opts)
vim.keymap.set("n", "<A->>", ":BufferLineMoveNext<CR>", opts)

vim.keymap.set("n", "<A-0>", ":BufferLineGoToBuffer -1", opts)
for i = 1, 9 do
    vim.keymap.set("n", "<A-" .. i .. ">", ":BufferLineGoToBuffer" .. i .. "<CR>", opts)
end
