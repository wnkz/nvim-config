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

-- https://github.com/akinsho/toggleterm.nvim
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("UserTermConfig", {}),
  pattern = "term://*",
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("no_undo_sensitive", { clear = true }),
  pattern = {
    -- System temporary directories
    "/tmp/*",
    "/private/tmp/*", -- macOS
    "/var/tmp/*",
    "/run/user/*/", -- Linux user runtime directories
    "/dev/shm/*", -- RAM-backed tmpfs (used by pass, gopass)

    -- Environment variable files
    "*.env*", -- .env, .env.local, .env.production, etc.
    "*/.env*", -- Environment files in subdirectories

    -- SSH private keys
    "*/.ssh/id_*", -- id_rsa, id_ed25519, id_ecdsa, id_dsa
    "*/.ssh/*_key", -- Alternative private key naming

    -- GPG/PGP private keys and encrypted files
    "*/.gnupg/private-keys-v1.d/*", -- Private key storage
    "*/.gnupg/secring.gpg", -- Legacy secret keyring
    "*.gpg", -- GPG encrypted files
    "*.asc", -- ASCII-armored encrypted files

    -- Private key files (various formats and algorithms)
    "*_rsa",
    "*_rsa.*",
    "*_ed25519",
    "*_ed25519.*",
    "*_ecdsa",
    "*_ecdsa.*",
    "*_dsa",
    "*_dsa.*",
    "*.pem",
    "*.key",

    -- Certificate archives and keystores (contain private keys)
    "*.p12", -- PKCS#12 bundle (cert + private key)
    "*.pfx", -- Windows PKCS#12
    "*.keystore", -- Java KeyStore
    "*.jks", -- Java KeyStore format
    "*.truststore", -- Java TrustStore

    -- Cloud provider credentials (specific files only)
    "*/.aws/credentials", -- AWS access keys
  },
  desc = "Disable undofile for sensitive paths",
  callback = function()
    vim.bo.undofile = false
  end,
})
