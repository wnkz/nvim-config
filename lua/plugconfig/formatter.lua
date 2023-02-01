local util = require "formatter.util"

require("formatter").setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        python = {
            require("formatter.filetypes.python").black,
            function()
                return {
                    exe = "isort",
                    args = {
                        "-q",
                        "-",
                        "--profile",
                        "black"
                    },
                    stdin = true
                }
            end
        },
        yaml = {
            require("formatter.filetypes.yaml").prettier
        },
        json = {
            require("formatter.filetypes.json").prettier
        },
        javascript = {
            require("formatter.filetypes.javascript").prettier
        },
        typescript = {
            require("formatter.filetypes.typescript").prettier
        },
        html = {
            require("formatter.filetypes.html").prettier
        },
        c = {
            require("formatter.filetypes.c").clangformat
        },
        rust = {
            require("formatter.filetypes.rust").rustfmt
        },
        lua = {
            require("formatter.filetypes.lua").luafmt
        },
        markdown = {
            require("formatter.filetypes.markdown").prettier
        },
        sh = {
            require("formatter.filetypes.sh").shfmt
        },
        sql = {
            function()
                return {
                    exe = "sql-formatter",
                    stdin = true
                }
            end
        },
        ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
}
