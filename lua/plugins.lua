local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = require("packer.util").float,
    },
})

return packer.startup(function(use)
    -- Speed up loading Lua modules in Neovim to improve startup time.
    use("lewis6991/impatient.nvim")

    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Dependencies used multiple plugins
    use("nvim-lua/plenary.nvim")

    -- QoL
    use({
        "nvim-treesitter/nvim-treesitter",
        -- run = ":TSUpdate",
        -- :TSUpdate will cause Packer to fail upon the first installation
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        config = [[require("plugconfig.treesitter")]],
    })
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end,
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                check_ts = true,
            })
        end,
    })
    use("windwp/nvim-ts-autotag")
    use("ggandor/lightspeed.nvim") -- motion

    -- UI / UX
    use({
        "olimorris/onedarkpro.nvim",
        config = [[require("plugconfig.onedarkpro")]],
    })
    use({
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = [[require("plugconfig.nvim-tree")]],
    })
    use({
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = [[require("plugconfig.lualine")]],
    })
    use({
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        after = { "nvim-tree.lua" },
        config = [[require("plugconfig.barbar")]],
    })
    use({ "goolord/alpha-nvim", config = [[require("plugconfig.dashboard-cfg")]] })
    use({
        "Shatur/neovim-session-manager",
        config = function()
            require("session_manager").setup({
                autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
            })
        end,
    })
    use("stevearc/dressing.nvim")
    use({
        "anuvyklack/pretty-fold.nvim",
        requires = "anuvyklack/nvim-keymap-amend",
        config = function()
            require("pretty-fold").setup({})
        end,
    })
    use({
        "anuvyklack/fold-preview.nvim",
        requires = "anuvyklack/keymap-amend.nvim",
        config = function()
            require("fold-preview").setup()
        end,
    })
    use({
        "chentoast/marks.nvim",
        config = function()
            require("marks").setup({
                signs = true,
                mappings = {},
            })
        end,
    })
    use({
        "wfxr/minimap.vim",
        cmd = { "Minimap", "MinimapToggle" },
    })
    use({
        "ellisonleao/glow.nvim",
        config = function()
            require("glow").setup()
        end,
        cmd = { "Glow" },
    })
    use("mechatroner/rainbow_csv")

    -- Git / GitHub
    use("tpope/vim-fugitive")
    use({
        "tpope/vim-rhubarb",
        requires = { "tpope/vim-fugitive" },
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    })
    use("sindrets/diffview.nvim")
    -- use {"github/copilot.vim"}

    -- LSP / Lint / Format
    use({
        "neovim/nvim-lspconfig",
        after = {
            "mason-lspconfig.nvim",
            "lsp_signature.nvim",
            "cmp-nvim-lsp",
            "null-ls.nvim",
        },
        config = [[require("plugconfig.lsp")]],
    })
    use("williamboman/mason.nvim")
    use({ "williamboman/mason-lspconfig.nvim", after = "mason.nvim" })
    use("ray-x/lsp_signature.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use({
        "mfussenegger/nvim-lint",
        config = [[require("plugconfig.lint")]],
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = [[require("plugconfig.indent-blankline")]],
    })

    -- auto-completion engine
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-emoji",
            "petertriho/cmp-git",
            "ray-x/cmp-treesitter",

            -- snippets
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",

            "onsails/lspkind-nvim", -- adds vscode-like pictograms
        },
        after = {
            "nvim-autopairs",
        },
        config = [[require("plugconfig.nvim-cmp")]],
    })

    -- 💡 TODO: DAP

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        requires = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                run = "make",
            },
            { "nvim-telescope/telescope-github.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sqlite.lua" } },
        },
        config = [[require("plugconfig.telescope")]],
    })

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
        require("packer").sync()
    end
end)
