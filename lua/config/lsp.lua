local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local signs = require("config").defaults.icons.diagnostics
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
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
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = ev.buf
            if opts.desc then
                opts.desc = "[LSP] " .. opts.desc
            end
            vim.keymap.set(mode, l, r, opts)
        end

        -- stylua: ignore start
        map("n", "<space>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
        -- map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
        map("n", "<space>ca", function()
            require("tiny-code-action").code_action()
        end, { desc = "[C]ode [A]ction" })

        map("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "[G]oto [D]efinition" })
        map("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
        map("n", "gi", require("telescope.builtin").lsp_implementations, { desc = "[G]oto [I]mplementation" })
        map("n", "<space>D", require("telescope.builtin").lsp_type_definitions, { desc = "Type [D]efinition" })
        map("n", "<space>ds", require("telescope.builtin").lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
        map("n", "<space>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, { desc = "[W]orkspace [S]ymbols" })
        map("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })

        map("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
        map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })

        map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "[W]orkspace [A]dd folder" })
        map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "[W]orkspace [R]emove folder" })
        map("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { desc = "[W]orkspace [L]ist folder" })
        -- stylua: ignore end
    end,
})
