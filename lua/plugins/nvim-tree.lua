return {
    {
        "kyazdani42/nvim-tree.lua",
        opts = {
            disable_netrw = true,
            hijack_cursor = true,
            diagnostics = {
                enable = false,
            },
            view = {
                hide_root_folder = true,
            },
            renderer = {
                root_folder_modifier = ":p:~",
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
        cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    },
}
