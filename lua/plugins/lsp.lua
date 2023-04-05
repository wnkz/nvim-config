return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-lspconfig.nvim",
            "neodev.nvim",
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
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "null-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {},
                automatic_installation = true,
                automatic_setup = false,
            })
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local null_ls = require("null-ls")
            local diagnostics = null_ls.builtins.diagnostics
            local formatting = null_ls.builtins.formatting

            null_ls.setup({
                sources = {
                    diagnostics.cfn_lint,
                    formatting.prettierd,
                    formatting.black,
                    formatting.isort.with({ extra_args = { "--profile", "black" } }),
                    formatting.stylua,
                    formatting.rustfmt.with({ extra_args = { "--edition=2021" } }),
                    formatting.clang_format.with({ filetypes = { "c" } }),
                    formatting.shfmt,
                    formatting.sql_formatter,
                    formatting.terraform_fmt,
                    formatting.trim_newlines,
                    formatting.trim_whitespace,
                },
            })
        end,
        lazy = true,
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
