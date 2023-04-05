return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "dark",
        highlights = {
            AlphaHeader = { fg = "$green" },
            AlphaFooter = { fg = "$green" },
            DapBreakpoint = { fg = "$red" },
            DapStopped = { fg = "$yellow" },
        },
    },
}
