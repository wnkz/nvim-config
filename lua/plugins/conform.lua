return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<space>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            c = { "clang_format" },
            lua = { "stylua" },
            python = { "isort", "ruff_format" },
            rust = { "rustfmt" },
            sh = { "shfmt" },
            sql = { "sqlfmt" },
            terraform = { "terraform_fmt" },
            hcl = { "packer_fmt" },

            astro = { { "prettierd", "prettier" } },
            css = { { "prettierd", "prettier" } },
            javascript = { { "prettierd", "prettier" } },
            json = { { "prettierd", "prettier" } },
            jsonc = { { "prettierd", "prettier" } },
            markdown = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            typescriptreact = { { "prettierd", "prettier" } },
            vue = { { "prettierd", "prettier" } },
            yaml = { { "prettierd", "prettier" } },

            -- Use the "_" filetype to run formatters on filetypes that don't
            -- have other formatters configured.
            ["_"] = { "trim_whitespace", "trim_newlines" },
        },
        formatters = {
            isort = {
                prepend_args = { "--profile", "black" },
            },
            rustfmt = {
                args = { "--edition=2021" },
            },
            packer_fmt = {
                command = "packer",
                args = { "fmt", "-" },
            },
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
