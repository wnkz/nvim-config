require "nvim-treesitter.configs".setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = {"phpdoc"},
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"vim"},
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    },
    indent = {
        enable = true
        -- disable = {"python", "yaml"}
    },
    autotag = {
        enable = true
    }
}
