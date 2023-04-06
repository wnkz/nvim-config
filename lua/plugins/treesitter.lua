return {
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = "all",
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = { "vim" },
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    scope_incremental = "<CR>",
                    node_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                    },
                },
                -- inspired by https://docs.helix-editor.com/keymap.html#unimpaired
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]a"] = "@parameter.inner",
                        ["]c"] = "@comment.outer",
                        ["]s"] = "@statement.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]A"] = "@parameter.inner",
                        ["]C"] = "@comment.outer",
                        ["]S"] = "@statement.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[a"] = "@parameter.inner",
                        ["[c"] = "@comment.outer",
                        ["[s"] = "@statement.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[A"] = "@parameter.inner",
                        ["[C"] = "@comment.outer",
                        ["[S"] = "@statement.outer",
                    },
                },
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            playground = {
                enable = true,
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        dependencies = {
            "nvim-treesitter-textobjects",
            "playground",
            "windwp/nvim-ts-autotag",
        },
    },
    { "nvim-treesitter/nvim-treesitter-textobjects", lazy = true },
    { "nvim-treesitter/playground", lazy = true },
    { "nvim-treesitter/nvim-treesitter-context", config = true, dependencies = "nvim-treesitter", event = "VeryLazy" },
}
