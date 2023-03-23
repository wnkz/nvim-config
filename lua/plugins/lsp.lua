return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = {
            "mason-lspconfig.nvim",
            "neodev.nvim",
        },
    },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
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
        "jose-elias-alvarez/null-ls.nvim",
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
        config = true,
        lazy = true,
    },
}
