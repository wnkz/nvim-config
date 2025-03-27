return {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",

      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      ["<C-CR>"] = { "cancel" },
    },

    completion = {
      list = { selection = { preselect = false, auto_insert = false } },
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      ghost_text = { enabled = false },

      menu = {
        -- auto_show = function(ctx)
        --   return ctx.mode ~= "cmdline"
        -- end,
        draw = {
          treesitter = { "lsp" },
        },
      },
    },

    sources = {
      default = { "lazydev", "lsp", "buffer", "snippets", "path" },

      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    cmdline = {
      enabled = true,
      sources = function()
        local type = vim.fn.getcmdtype()
        -- Search forward and backward
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        -- Commands
        if type == ":" or type == "@" then
          return { "cmdline", "path" }
        end
        return {}
      end,
    },

    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },

  -- init = function()
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "BlinkCmpMenuOpen",
  --     callback = function()
  --       require("copilot.suggestion").dismiss()
  --       vim.b.copilot_suggestion_hidden = true
  --     end,
  --   })
  --
  --   vim.api.nvim_create_autocmd("User", {
  --     pattern = "BlinkCmpMenuClose",
  --     callback = function()
  --       vim.b.copilot_suggestion_hidden = false
  --     end,
  --   })
  -- end,
}
