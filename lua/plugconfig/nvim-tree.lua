require "nvim-tree".setup {
    hijack_cursor = true,
    view = {
        hide_root_folder = true
    },
    renderer = {
        root_folder_modifier = ":p:~",
        add_trailing = true,
        highlight_git = true,
        highlight_opened_files = "icon"
    }
}
