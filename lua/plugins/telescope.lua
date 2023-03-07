return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        cmd = "Telescope",
        dependencies = {
            "telescope-fzf-native.nvim",
            "nvim-telescope/telescope-github.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "telescope-frecency.nvim",
        },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    { "nvim-telescope/telescope-frecency.nvim", dependencies = { "tami5/sqlite.lua" }, lazy = true },
}
