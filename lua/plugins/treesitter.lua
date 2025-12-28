return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "MeanderingProgrammer/treesitter-modules.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ---@module 'treesitter-modules'
    ---@type ts.mod.UserConfig
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "css",
        "dockerfile",
        "gitignore",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          scope_incremental = "<TAB>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local move = require("nvim-treesitter-textobjects.move")
      local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

      -- SELECT keymaps
      local select_keymaps = {
        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

        ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
        ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

        ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
        ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
      }
      for key, mapping in pairs(select_keymaps) do
        vim.keymap.set({ "x", "o" }, key, function()
          select.select_textobject(mapping.query, "textobjects")
        end, { desc = mapping.desc })
      end

      -- MOVE keymaps (inspired by https://docs.helix-editor.com/keymap.html#unimpaired)
      local move_keymaps = {
        -- Function calls
        ["]f"] = { fn = move.goto_next_start, query = "@call.outer", group = "textobjects", desc = "Next function call start" },
        ["]F"] = { fn = move.goto_next_end, query = "@call.outer", group = "textobjects", desc = "Next function call end" },
        ["[f"] = { fn = move.goto_previous_start, query = "@call.outer", group = "textobjects", desc = "Prev function call start" },
        ["[F"] = { fn = move.goto_previous_end, query = "@call.outer", group = "textobjects", desc = "Prev function call end" },

        -- Method/function definitions
        ["]m"] = { fn = move.goto_next_start, query = "@function.outer", group = "textobjects", desc = "Next method/function def start" },
        ["]M"] = { fn = move.goto_next_end, query = "@function.outer", group = "textobjects", desc = "Next method/function def end" },
        ["[m"] = { fn = move.goto_previous_start, query = "@function.outer", group = "textobjects", desc = "Prev method/function def start" },
        ["[M"] = { fn = move.goto_previous_end, query = "@function.outer", group = "textobjects", desc = "Prev method/function def end" },

        -- Conditionals
        ["]i"] = { fn = move.goto_next_start, query = "@conditional.outer", group = "textobjects", desc = "Next conditional start" },
        ["]I"] = { fn = move.goto_next_end, query = "@conditional.outer", group = "textobjects", desc = "Next conditional end" },
        ["[i"] = { fn = move.goto_previous_start, query = "@conditional.outer", group = "textobjects", desc = "Prev conditional start" },
        ["[I"] = { fn = move.goto_previous_end, query = "@conditional.outer", group = "textobjects", desc = "Prev conditional end" },

        -- Scopes
        ["]s"] = { fn = move.goto_next_start, query = "@local.scope", group = "locals", desc = "Next scope" },
        ["[s"] = { fn = move.goto_previous_start, query = "@local.scope", group = "locals", desc = "Prev scope" },

        -- Folds
        ["]z"] = { fn = move.goto_next_start, query = "@fold", group = "folds", desc = "Next fold" },
        ["[z"] = { fn = move.goto_previous_start, query = "@fold", group = "folds", desc = "Prev fold" },
      }

      for key, mapping in pairs(move_keymaps) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          mapping.fn(mapping.query, mapping.group)
        end, { desc = mapping.desc })
      end

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

      -- vim way: ; goes to the direction you were moving.
      -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
  },
  { "windwp/nvim-ts-autotag", event = "InsertEnter", opts = {} },
  { "nvim-treesitter/nvim-treesitter-context", opts = {}, event = "VeryLazy" },
}
