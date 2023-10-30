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
            javascript = { { "prettierd", "prettier" } },
            lua = { "stylua" },
            python = { "isort", "ruff_format" },
            rust = { "rustfmt" },
            sh = { "shfmt" },
            terraform = { "terraform_fmt" },
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
        },
    },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
