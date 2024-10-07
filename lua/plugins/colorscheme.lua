return {
  {
    "wnkz/monoglow.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
    dev = true,
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      transparent = false,
      lualine = {
        transparent = false, -- lualine center bar transparency
      },
      highlights = {
        DashboardHeader = { fg = "$green" },
        DashboardFooter = { fg = "$blue" },
        DapBreakpoint = { fg = "$red" },
        DapStopped = { fg = "$yellow" },
      },
    },
  },
  { "slugbyte/lackluster.nvim" },
  { "folke/tokyonight.nvim" },
  { "RRethy/nvim-base16" },
  -- {
  --     "fcancelinha/nordern.nvim",
  --     branch = "master",
  -- },
  -- {
  --     "shaunsingh/nord.nvim",
  --     config = function()
  --         vim.g.nord_contrast = true
  --     end,
  -- },
  -- {
  --     "EdenEast/nightfox.nvim",
  --     opts = {},
  -- },
  -- {
  --     "projekt0n/github-nvim-theme",
  --     config = function()
  --         require("github-theme").setup({
  --             -- ...
  --         })
  --     end,
  -- },
  -- {
  --     "rmehri01/onenord.nvim",
  --     opts = {},
  -- },
  -- {
  --     "rose-pine/neovim",
  --     name = "rose-pine",
  --     opts = {},
  -- },
  -- {
  --     "olivercederborg/poimandres.nvim",
  --     opts = {},
  -- },
}
