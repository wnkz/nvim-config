require'formatter'.setup {
  logging = false,
  filetype = {
    python = {
      function()
        return {
          exe = "black -",
          args = {"--stdin-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end,
      function()
        return {
          exe = "isort -",
          args = {
            "--filename", vim.api.nvim_buf_get_name(0),
            "--profile", "black",
          },
          stdin = true
        }
      end
    },
    yaml = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true 
        }
      end
    },
    json = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
          stdin = true 
        }
      end
    },
    c = {
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true,
          cwd = vim.fn.expand('%:p:h')
        }
      end
    }
  }
}
