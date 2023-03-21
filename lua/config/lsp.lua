local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)

    require("lsp_signature").on_attach({
        bind = true,
        handler_opts = {
            border = "rounded",
        },
        floating_window = true,
        toggle_key = "<M-x>",
    }, bufnr)
end

require("neodev").setup()

local lspconfig = require("lspconfig")

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Language servers with default config
local servers = {
    "bashls",
    "dockerls",
    "eslint",
    "html",
    "rust_analyzer",
    "terraformls",
    "vimls",
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

-- Language servers with custom config
lspconfig["pyright"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
            },
        },
    },
})

-- fix: warning: multiple different client offset_encodings
local clangd_capabilities = capabilities
clangd_capabilities.offsetEncoding = "utf-8"
lspconfig["clangd"].setup({
    on_attach = on_attach,
    capabilities = clangd_capabilities,
})

lspconfig["yamlls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        yaml = {
            customTags = {
                "!And",
                "!If",
                "!Not",
                "!Equals",
                "!Or",
                "!FindInMap sequence",
                "!Base64",
                "!Cidr",
                "!Ref",
                "!Sub",
                "!GetAtt",
                "!GetAZs",
                "!ImportValue",
                "!Select",
                "!Select sequence",
                "!Split",
                "!Join sequence",
                "!And sequence",
                "!If sequence",
                "!Not sequence",
                "!Equals sequence",
                "!Or sequence",
                "!FindInMap",
                "!Join",
                "!Sub sequence",
                "!ImportValue sequence",
                "!Split sequence",
                "!Condition",
            },
        },
    },
})

lspconfig["lua_ls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
            format = {
                enable = false,
            },
        },
    },
})

-- null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.cfn_lint,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort.with({ extra_args = { "--profile", "black" } }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.rustfmt.with({ extra_args = { "--edition=2021" } }),
        null_ls.builtins.formatting.clang_format.with({ filetypes = { "c" } }),
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.sql_formatter,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.trim_newlines,
        null_ls.builtins.formatting.trim_whitespace,
    },
    on_attach = on_attach,
})
