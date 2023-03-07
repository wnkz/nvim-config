return {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        caching = true,
        highlights = {
            AlphaHeader = { fg = "${green}" },
            AlphaFooter = { fg = "${green}" },
            TermCursor = { bg = "${white}" },
        },
        options = {
            cursorline = true,
            highlight_inactive_windows = true,
        },
    },
}
