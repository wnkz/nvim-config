return {
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp")
        end,
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", lazy = true },
            { "hrsh7th/cmp-nvim-lua", lazy = true },
            { "hrsh7th/cmp-buffer", lazy = true },
            { "hrsh7th/cmp-path", lazy = true },
            { "hrsh7th/cmp-cmdline", lazy = true },
            { "hrsh7th/cmp-calc", lazy = true },
            { "hrsh7th/cmp-emoji", lazy = true },
            { "petertriho/cmp-git", lazy = true },
            { "ray-x/cmp-treesitter", lazy = true },
            { "onsails/lspkind-nvim", lazy = true }, -- adds vscode-like pictograms
            { "saadparwaiz1/cmp_luasnip", lazy = true },
        },
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
        event = "InsertEnter",
        dependencies = {
            "friendly-snippets",
        },
    },
    { "rafamadriz/friendly-snippets", lazy = true },
    { "folke/neodev.nvim", lazy = true },
}
