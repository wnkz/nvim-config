return {
    -- Dependencies used multiple plugins
    { "nvim-lua/plenary.nvim", lazy = true },
    { "kyazdani42/nvim-web-devicons", lazy = true },

    -- QoL
    {
        "numToStr/Comment.nvim",
        config = true,
        keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = { check_ts = true },
        dependencies = { "nvim-treesitter", "nvim-cmp" },
    },
    { "kylechui/nvim-surround", version = "*", config = true, event = "VeryLazy" },
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
    { "Wansmer/treesj", dependencies = "nvim-treesitter", config = true },

    -- UI / UX
    {
        "goolord/alpha-nvim",
        config = function()
            require("config.dashboard")
        end,
        event = "VimEnter",
    },
    { "chentoast/marks.nvim", opts = { signs = true, mappings = {} }, event = "BufEnter" },
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
                "help",
                "lazy",
                "lsp-installer",
                "mason",
                "packer",
            },
        },
        event = "VimEnter",
    },
    {
        "Shatur/neovim-session-manager",
        config = function()
            require("session_manager").setup({
                autoload_mode = require("session_manager.config").AutoloadMode.CurrentDir,
            })
        end,
        event = "VimEnter",
    },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    { "mechatroner/rainbow_csv", event = "BufEnter *.csv" },
    { "anuvyklack/pretty-fold.nvim", config = true, event = "BufEnter" },
    {
        "anuvyklack/fold-preview.nvim",
        dependencies = { "anuvyklack/keymap-amend.nvim" },
        config = true,
        event = "BufEnter",
    },
    { "ellisonleao/glow.nvim", cmd = { "Glow" }, config = true },
    { "wfxr/minimap.vim", cmd = { "Minimap", "MinimapToggle" } },
    { "norcalli/nvim-colorizer.lua", config = true, event = "VeryLazy" },

    -- Git / GitHub
    { "tpope/vim-fugitive", cmd = { "G", "Git" } },
    { "tpope/vim-rhubarb", cmd = { "GBrowse" } },
    { "lewis6991/gitsigns.nvim", config = true },
    { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },
    -- "github/copilot.vim"
}
