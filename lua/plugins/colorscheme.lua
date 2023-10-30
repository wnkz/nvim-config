return {
    "navarasu/onedark.nvim",
    priority = 1000,
    lazy = false,
    config = function(_, opts)
        require("onedark").setup(opts)
        vim.cmd.colorscheme("onedark")
    end,
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
