return {
    -- Dependencies used multiple plugins
    { "nvim-lua/plenary.nvim", lazy = true },
    { "kyazdani42/nvim-web-devicons", lazy = true },

    -- QoL
    {
        "numToStr/Comment.nvim",
        config = true,
        keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
        event = "User FileOpened",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = { check_ts = true },
        dependencies = { "nvim-treesitter", "nvim-cmp" },
    },
    { "kylechui/nvim-surround", version = "*", config = true },
    { "ggandor/lightspeed.nvim", lazy = true },
    {
        "folke/which-key.nvim",
        config = true,
        cmd = "WhichKey",
        event = "VeryLazy",
    },
    {
        "akinsho/toggleterm.nvim",
        branch = "main",
        opts = {
            open_mapping = [[<c-\>]],
            terminal_mappings = true,
            direction = "float",
        },
        keys = { [[<c-\>]] },
        cmd = {
            "ToggleTerm",
            "TermExec",
            "ToggleTermToggleAll",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
        },
    },

    -- UI / UX
    {
        "goolord/alpha-nvim",
        config = function()
            require("config.dashboard")
        end,
        event = "VimEnter",
    },
    { "chentoast/marks.nvim", opts = { signs = true, mappings = {} } },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = {
            space_char_blankline = " ",
            show_end_of_line = false,
            show_current_context = true,
            use_treesitter = true,
            buftype_exclude = { "terminal" },
            filetype_exclude = {
                "alpha",
                "dashboard",
                "lazy",
                "lsp-installer",
                "mason",
                "packer",
            },
        },
    },
    {
        "Shatur/neovim-session-manager",
        config = function()
            require("session_manager").setup({
                autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
            })
        end,
    },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    { "mechatroner/rainbow_csv", lazy = true },
    { "anuvyklack/pretty-fold.nvim", config = true },
    { "anuvyklack/fold-preview.nvim", dependencies = { "anuvyklack/keymap-amend.nvim" }, config = true },
    { "ellisonleao/glow.nvim", cmd = { "Glow" }, config = true },
    { "wfxr/minimap.vim", cmd = { "Minimap", "MinimapToggle" } },

    -- Git / GitHub
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    { "lewis6991/gitsigns.nvim", config = true, event = "User FileOpened" },
    "sindrets/diffview.nvim",
    -- "github/copilot.vim"
}
