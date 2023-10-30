return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-lspconfig.nvim",
            "neodev.nvim",
            { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
        },
        config = function()
            require("config.lsp")
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        opts = {
            automatic_installation = true,
        },
        lazy = true,
        dependencies = { "mason.nvim" },
    },
    {
        "folke/neodev.nvim",
        opts = {
            library = { plugins = { "nvim-dap-ui" }, types = true },
        },
        lazy = true,
    },
    { "simrat39/rust-tools.nvim", lazy = true },
}
