local catppuccin = require("catppuccin")

catppuccin.setup {
  styles = {
    comments = "NONE",
    functions = "NONE",
    keywords = "NONE",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true
    },
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
    markdown = true,
  }
}

vim.cmd[[colorscheme catppuccin]]
