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
        version = "*",
        opts = {
            open_mapping = [[<c-\>]],
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
    {
        "Wansmer/treesj",
        dependencies = "nvim-treesitter",
        keys = {
            { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },

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
        main = "ibl",
        opts = {
            indent = {
                char = "│",
            },
        },
        event = "VimEnter",
    },
    {
        "Shatur/neovim-session-manager",
        config = function()
            require("session_manager").setup({
                autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
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
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    -- Git / GitHub
    { "tpope/vim-fugitive", cmd = { "G", "Git" } },
    { "tpope/vim-rhubarb", cmd = { "GBrowse" } },
    { "lewis6991/gitsigns.nvim", config = true },
    { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },
    -- { "github/copilot.vim" },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept = "<M-Tab>",
                    accept_word = "<M-w>",
                    accept_line = "<M-l>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
            panel = {
                enabled = true,
                auto_refresh = false,
            },
        },
    },
    { "wintermute-cell/gitignore.nvim", cmd = { "Gitignore" } },
}
