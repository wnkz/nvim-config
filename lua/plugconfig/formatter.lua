local function default_prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require "formatter".setup {
  logging = false,
  filetype = {
    python = {
      function()
        return {
          exe = "black",
          args = {
            "-",
            "--stdin-filename",
            vim.api.nvim_buf_get_name(0)
          },
          stdin = true
        }
      end,
      function()
        return {
          exe = "isort",
          args = {
            "-",
            "--filename",
            vim.api.nvim_buf_get_name(0),
            "--profile",
            "black"
          },
          stdin = true
        }
      end
    },
    yaml = {default_prettier},
    json = {default_prettier},
    javascript = {default_prettier},
    typescript = {default_prettier},
    html = {default_prettier},
    c = {
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true,
          cwd = vim.fn.expand("%:p:h")
        }
      end
    },
    lua = {
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
    markdown = {default_prettier},
    sh = {
      function()
        return {
          exe = "shfmt",
          args = {
            "-i",
            2,
            "-filename",
            vim.api.nvim_buf_get_name(0),
            "-"
          },
          stdin = true
        }
      end
    }
  }
}
