return require("packer").startup(
  function(use)
    use {"lewis6991/impatient.nvim", config = [[require('impatient')]]}

    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Theme
    use {"olimorris/onedarkpro.nvim", config = [[require('plugconfig.theme')]]}

    -- Misc.
    use "tpope/vim-commentary"
    use "ellisonleao/glow.nvim"
    use "mechatroner/rainbow_csv"
    use "ggandor/lightspeed.nvim" -- motion
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = [[require('plugconfig.treesitter')]]
    }

    -- UX
    use "glepnir/dashboard-nvim"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true},
      config = [[require('plugconfig.lualine')]]
    }
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = [[require('plugconfig.nvim-tree')]]
    }
    use {
      "romgrk/barbar.nvim",
      requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {"mhartington/formatter.nvim", config = [[require('plugconfig.formatter')]]}
    use {"lukas-reineke/indent-blankline.nvim", config = [[require('plugconfig.indent-blankline')]]}
    use {
      "anuvyklack/pretty-fold.nvim",
      config = function()
        require("pretty-fold").setup {}
        require("pretty-fold.preview").setup()
      end
    }
    use {
      "chentau/marks.nvim",
      config = function()
        require("marks").setup {
          signs = true,
          mappings = {}
        }
      end
    }
    use "wfxr/minimap.vim"

    -- Git / GitHub
    use "tpope/vim-fugitive"
    use {
      "tpope/vim-rhubarb",
      requires = {"tpope/vim-fugitive"}
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("gitsigns").setup()
      end
    }
    -- use {"github/copilot.vim"}

    -- LSP
    use "williamboman/nvim-lsp-installer"
    use "ray-x/lsp_signature.nvim"
    use {
      "neovim/nvim-lspconfig",
      after = {"nvim-lsp-installer", "lsp_signature.nvim", "cmp-nvim-lsp"},
      config = [[require('plugconfig.lsp')]]
    }

    -- auto-completion engine
    use {
      "hrsh7th/nvim-cmp",
      after = {"LuaSnip"},
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-calc",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "onsails/lspkind-nvim",
        {"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"},
        "ray-x/cmp-treesitter",
        "saadparwaiz1/cmp_luasnip",
        {
          "windwp/nvim-autopairs",
          config = function()
            require("nvim-autopairs").setup {
              check_ts = true
            }
          end
        },
        "windwp/nvim-ts-autotag"
      },
      config = [[require('plugconfig.nvim-cmp')]]
    }

    -- snippets
    use "L3MON4D3/LuaSnip"
    use {"rafamadriz/friendly-snippets", after = "LuaSnip"}

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
        {"nvim-telescope/telescope-github.nvim"}
      },
      config = [[require('plugconfig.telescope')]]
    }
  end
)
