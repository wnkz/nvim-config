local catppuccino = require("catppuccino")

catppuccino.setup {
  colorscheme = "dark_catppuccino",
  styles = {
    comments = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    barbar = true,
    dashboard = true,
    gitsigns = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    nvimtree = {
      enabled = true,
      show_root = false,
    },
    telescope = true,
  }
}

catppuccino.load()
