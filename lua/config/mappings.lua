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

-- barbar
local barbar_opts = { noremap = true, silent = true }
-- Move to previous/next
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", barbar_opts)
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", barbar_opts)
-- Re-order to previous/next
vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", barbar_opts)
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", barbar_opts)
-- Goto buffer in position...
for i = 1, 9 do
    vim.keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", barbar_opts)
end
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", barbar_opts)
-- Pin/unpin buffer
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", barbar_opts)
-- Close buffer
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", barbar_opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", barbar_opts)
-- Sort automatically by...
vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", barbar_opts)
vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", barbar_opts)
vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", barbar_opts)
vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", barbar_opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
