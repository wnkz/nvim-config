vim.opt.termguicolors = true

-- theme
require("onedarkpro").setup(
  {
    options = {
      cursorline = true,
      window_unfocussed_color = true
    }
  }
)
require("onedarkpro").load()

-- treesitter
require "nvim-treesitter.configs".setup {
  ensure_installed = "maintained",
  sync_install = false,
  -- ignore_install = { "r" },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {"vim"},
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  },
  indent = {
    enable = true
    -- disable = {"python", "yaml"}
  },
  autotag = {
    enable = true
  }
}

-- listchars
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:»⋅")
vim.opt.listchars:append("trail:⋅")
vim.opt.listchars:append("nbsp:⋅")
-- vim.opt.listchars:append("eol:↴")

-- indent_blankline
require("indent_blankline").setup {
  -- char = '|', -- ['|', '¦', '┆', '┊']
  space_char_blankline = " ",
  show_end_of_line = false,
  show_current_context = true,
  use_treesitter = true,
  buftype_exclude = {"terminal"},
  filetype_exclude = {"dashboard"}
}

-- gitsigns
require("gitsigns").setup()

-- barbar
vim.g.bufferline = {
  insert_at_end = true
}

-- nvim-tree
require "nvim-tree".setup {
  ignore_ft_on_setup = {"dashboard"},
  auto_close = true,
  hijack_cursor = true,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {}
  },
  filters = {
    dotfiles = false,
    custom = {".git", "node_modules"}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = "left",
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}

-- pretty-fold
require("pretty-fold").setup {}
require("pretty-fold.preview").setup()

-- autopairs
require("nvim-autopairs").setup {
  check_ts = true
}
