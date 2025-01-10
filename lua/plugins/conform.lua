return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<space>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = function()
    local prettier = { "prettierd", "prettier", stop_after_first = true }
    local prettier_filetypes = { -- List of filetypes that should use Prettier
      "astro",
      "css",
      "javascript",
      "json",
      "jsonc",
      "markdown",
      "typescript",
      "typescriptreact",
      "vue",
      "yaml",
    }

    local formatters_by_ft = {
      c = { "clang_format" },
      lua = { "stylua" },
      python = { "isort", "ruff_format" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      sql = { "sqlfluff" },
      terraform = { "terraform_fmt" },
      hcl = { "packer_fmt" },
      zig = { "zigfmt" },
      ["_"] = { "trim_whitespace", "trim_newlines" },
    }

    for _, ft in ipairs(prettier_filetypes) do
      formatters_by_ft[ft] = prettier
    end

    return {
      formatters_by_ft = formatters_by_ft,
      formatters = {
        isort = {
          prepend_args = { "--profile", "black" },
        },
        rustfmt = {
          args = { "--edition=2021" },
        },
        packer_fmt = {
          command = "packer",
          args = { "fmt", "-" },
        },
        sqlfluff = {
          args = { "format", "-" },
        },
      },
    }
  end,
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
