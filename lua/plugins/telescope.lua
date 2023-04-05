return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = false,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("gh")
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("frecency")
            require("telescope").load_extension("dap")
        end,
        cmd = "Telescope",
        dependencies = {
            "telescope-fzf-native.nvim",
            "nvim-telescope/telescope-github.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "telescope-frecency.nvim",
            "nvim-telescope/telescope-dap.nvim",
        },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    { "nvim-telescope/telescope-frecency.nvim", dependencies = { "tami5/sqlite.lua" }, lazy = true },
}
