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
                pickers = {
                    buffers = {
                        mappings = {
                            i = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
                            n = {
                                ["<c-d>"] = actions.delete_buffer,
                            },
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
            require("telescope").load_extension("dap")
            require("telescope").load_extension("harpoon")
        end,
        cmd = "Telescope",
        keys = {
            { "<leader>ff", ":Telescope find_files<cr>" },
            { "<leader>fe", ":Telescope file_browser<cr>" },
            { "<leader>fb", ":Telescope buffers<cr>" },
            { "<leader>fg", ":Telescope live_grep<cr>" },
            { "<leader>fh", ":Telescope help_tags<cr>" },
            { "<leader>fr", ":Telescope git_branches<cr>" },
        },
        dependencies = {
            "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope-frecency.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-github.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "ThePrimeagen/harpoon",
        },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
}
