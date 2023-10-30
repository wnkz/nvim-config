local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("mason-lspconfig").setup_handlers({
    function(server_name) -- default handler
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
    end,
    ["pyright"] = function()
        lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "off",
                    },
                },
            },
        })
    end,
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
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
    end,
    ["clangd"] = function()
        lspconfig.clangd.setup({
            cmd = {
                "clangd",
                "--completion-style=detailed",
                "--offset-encoding=utf-16", -- fix: warning: multiple different client offset_encodings
            },
            capabilities = capabilities,
        })
    end,
    ["rust_analyzer"] = function()
        local rt = require("rust-tools")
        local masonrs = require("mason-registry")
        local install_path = masonrs.get_package("codelldb"):get_install_path()
        local codelldb_path = install_path .. "/extension/adapter/codelldb"
        local liblldb_path = install_path .. "/extension/lldb/lib/liblldb.dylib"
        local rt_capabilities = vim.deepcopy(capabilities)

        rt.setup({
            server = {
                settings = {
                    check = {
                        command = "clippy",
                    },
                },
                capabilities = rt_capabilities,
                on_attach = function(_, bufnr)
                    vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
                end,
            },
            dap = {
                adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
            },
        })
    end,
    ["yamlls"] = function()
        lspconfig.yamlls.setup({
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
    end,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("keep", opts, { desc = "[LSP] Declaration" }))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("keep", opts, { desc = "[LSP] Definition" }))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("keep", opts, { desc = "[LSP] Hover" }))
        vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            vim.tbl_extend("keep", opts, { desc = "[LSP] Implementation" })
        )
        vim.keymap.set(
            "n",
            "<C-k>",
            vim.lsp.buf.signature_help,
            vim.tbl_extend("keep", opts, { desc = "[LSP] Signature help" })
        )
        vim.keymap.set(
            "n",
            "<space>wa",
            vim.lsp.buf.add_workspace_folder,
            vim.tbl_extend("keep", opts, { desc = "[LSP] Add Workspace folder" })
        )
        vim.keymap.set(
            "n",
            "<space>wr",
            vim.lsp.buf.remove_workspace_folder,
            vim.tbl_extend("keep", opts, { desc = "[LSP] Remove Workspace folder" })
        )
        vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, vim.tbl_extend("keep", opts, { desc = "[LSP] List Workspace folder" }))
        vim.keymap.set(
            "n",
            "<space>D",
            vim.lsp.buf.type_definition,
            vim.tbl_extend("keep", opts, { desc = "[LSP] Type definition" })
        )
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, vim.tbl_extend("keep", opts, { desc = "[LSP] Rename" }))
        vim.keymap.set(
            "n",
            "<space>ca",
            vim.lsp.buf.code_action,
            vim.tbl_extend("keep", opts, { desc = "[LSP] Code Action" })
        )
        vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("keep", opts, { desc = "[LSP] References" }))
    end,
})
