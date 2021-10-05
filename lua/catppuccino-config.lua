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
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    barbar = true,
    dashboard = true,
  }
}

catppuccino.load()
