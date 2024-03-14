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

            pcall(require("telescope").load_extension, "fzf")
            require("telescope").load_extension("gh")
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("dap")
            require("telescope").load_extension("harpoon")

            vim.keymap.set("n", "<leader>/", function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "[/] Fuzzily search in current buffer" })
        end,
        cmd = "Telescope",
        keys = {
            { "<leader>?", ":Telescope oldfiles<cr>", desc = "[?] Find recently opened files" },
            { "<leader>\\", ":Telescope buffers<cr>", desc = "[\\] Find existing buffers" },
            { "<leader>/", nil, desc = "[/] Fuzzily search in current buffer" },
            { "<leader>ff", ":Telescope find_files<cr>", desc = "[F]ind [F]iles" },
            { "<leader>fe", ":Telescope file_browser<cr>", desc = "[F]ile [E]xplorer" },
            { "<leader>fg", ":Telescope live_grep<cr>", desc = "[F]ind by [G]rep" },
            { "<leader>fc", ":Telescope grep_string<cr>", desc = "[F]ind [C]urrent word" },
            { "<leader>fh", ":Telescope help_tags<cr>", desc = "[F]ind [H]elp" },
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
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
            return vim.fn.executable("make") == 1
        end,
        lazy = true,
    },
}
