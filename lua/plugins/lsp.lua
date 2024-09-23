return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-lspconfig.nvim",
            {
                "mrded/nvim-lsp-notify",
                opts = {
                    notify = require("notify"),
                },
                dependencies = { "rcarriga/nvim-notify" },
            },
        },
        config = function()
            require("config.lsp")
        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUninstall",
            "MasonUninstallAll",
            "MasonLog",
            "MasonUpdate",
        },
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
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    { "simrat39/rust-tools.nvim", lazy = true },
    {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        event = "LspAttach",
        config = function()
            require("tiny-code-action").setup()
        end,
    },
}
