vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "~/.aws/config", "~/.aws/credentials" },
  command = "set filetype=dosini",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.conf" },
  command = "set filetype=conf",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "Jenkinsfile" },
  command = "set filetype=groovy",
})
