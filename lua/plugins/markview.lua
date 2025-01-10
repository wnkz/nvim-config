return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = function()
    local presets = require("markview.presets")
    return {
      hybrid_modes = { "n" },
      checkboxes = presets.checkboxes.nerd,
    }
  end,
}
