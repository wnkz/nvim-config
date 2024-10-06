return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local signs = require("config").defaults.icons.diagnostics
      return {
        options = {
          theme = "auto",
          component_separators = "|",
          section_separators = "",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
        },
        sections = {
          lualine_a = { { "mode", icon = "" } },
          lualine_b = {
            "branch",
            "diff",
          },
          lualine_c = {
            { "filename", path = 1 },
          },
          lualine_x = {
            { "encoding" },
            { "fileformat" },
            { "filetype" },
            {
              "lsp-status",
              colored = false,
              disabled_filetypes = { "TelescopePrompt" },
            }, -- "pnx/lualine-lsp-status"
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = (function(t)
                local r = {}
                for k, v in pairs(t) do
                  r[string.lower(k)] = v
                end
                return r
              end)(signs),
            },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        extensions = {
          "fugitive",
          "fzf",
          "lazy",
          "mason",
          "nvim-dap-ui",
          "nvim-tree",
          "quickfix",
          "toggleterm",
        },
      }
    end,
    event = "VimEnter",
  },
  { "pnx/lualine-lsp-status" },
}
