require("indent_blankline").setup {
  space_char_blankline = " ",
  show_end_of_line = false,
  show_current_context = true,
  use_treesitter = true,
  buftype_exclude = {"terminal"},
  filetype_exclude = {"dashboard", "alpha", "lsp-installer", "mason.nvim"}
}
