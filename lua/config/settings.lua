vim.cmd("language en_US.utf-8")
vim.cmd.colorscheme("nordern")

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = false,
})
