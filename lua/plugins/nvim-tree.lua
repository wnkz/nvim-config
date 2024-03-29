return {
    {
        "nvim-tree/nvim-tree.lua",
        opts = {
            disable_netrw = true,
            hijack_cursor = true,
            diagnostics = {
                enable = false,
            },
            renderer = {
                root_folder_label = false,
                add_trailing = true,
                group_empty = true,
                highlight_opened_files = "name",
                icons = {
                    git_placement = "after",
                    glyphs = {
                        git = {
                            unstaged = "M",
                            staged = "A",
                            unmerged = "U",
                            renamed = "R",
                            untracked = "?",
                            deleted = "D",
                            ignored = "!",
                        },
                    },
                },
            },
        },
        cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFindFileToggle" },
        keys = {
            { "<C-n>", vim.cmd.NvimTreeToggle },
            { "<leader>n", vim.cmd.NvimTreeFindFileToggle },
            { "<leader>r", vim.cmd.NvimTreeRefresh },
        },
    },
}
