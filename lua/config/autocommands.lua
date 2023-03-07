local cursor_settings = vim.api.nvim_create_augroup("cursor_settings", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
    group = cursor_settings,
    pattern = "*",
    command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait100-blinkoff500-blinkon500,sm:block-blinkwait175-blinkoff150-blinkon175",
})
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
    group = cursor_settings,
    pattern = "*",
    command = "set guicursor=a:block-blinkwait100-blinkoff500-blinkon500",
})

local term_settings = vim.api.nvim_create_augroup("term_settings", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", { -- Go to insert mode by default to start typing command
    group = term_settings,
    pattern = "*",
    command = "startinsert",
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
    end,
})
