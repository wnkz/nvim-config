return {
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", lazy = true },
            { "hrsh7th/cmp-nvim-lua", lazy = true },
            { "hrsh7th/cmp-buffer", lazy = true },
            { "hrsh7th/cmp-path", lazy = true },
            { "hrsh7th/cmp-cmdline", lazy = true },
            { "hrsh7th/cmp-calc", lazy = true },
            { "hrsh7th/cmp-emoji", lazy = true },
            { "hrsh7th/cmp-nvim-lsp-signature-help", lazy = true },
            { "petertriho/cmp-git", lazy = true },
            { "ray-x/cmp-treesitter", lazy = true },
            { "onsails/lspkind-nvim", lazy = true }, -- adds vscode-like pictograms
            { "saadparwaiz1/cmp_luasnip", lazy = true },
            { "rcarriga/cmp-dap", lazy = true },
            {
                "garymjr/nvim-snippets",
                opts = {
                    friendly_snippets = true,
                },
                dependencies = { "rafamadriz/friendly-snippets" },
            },
            keys = {
                {
                    "<Tab>",
                    function()
                        return vim.snippet.active { direction = 1 } and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
                    end,
                    expr = true,
                    silent = true,
                    mode = { "i", "s" },
                },
                {
                    "<S-Tab>",
                    function()
                        return vim.snippet.active { direction = -1 } and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
                    end,
                    expr = true,
                    silent = true,
                    mode = { "i", "s" },
                },
            },
        },
        config = function()
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
            end

            local cmp = require "cmp"
            local defaults = require "cmp.config.default"()
            local lspkind = require "lspkind"

            cmp.setup {
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm { select = false },
                    ["<C-y>"] = cmp.mapping.confirm { select = true },
                    ["<S-CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace },
                    ["<C-CR>"] = function(fallback)
                        cmp.abort()
                        fallback()
                    end,
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                sources = cmp.config.sources({
                    {
                        name = "lazydev",
                        -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                        group_index = 0,
                    },
                    {
                        name = "nvim_lsp",
                        entry_filter = function(entry, ctx)
                            return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
                        end,
                    },
                    { name = "nvim_lua" },
                    { name = "snippets" },
                    { name = "treesitter" },
                }, {
                    { name = "nvim_lsp_signature_help" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                    { name = "calc" },
                    { name = "emoji" },
                }),
                formatting = {
                    format = lspkind.cmp_format {
                        mode = "symbol",
                    },
                },
                experimental = {
                    ghost_text = true,
                },
                sorting = defaults.sorting,
            }

            -- git
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" },
                }, {
                    { name = "buffer" },
                }),
            })

            -- May conflict with flash.nvim?
            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources {
                    { name = "buffer" },
                },
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })

            cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
                sources = {
                    { name = "dap" },
                },
            })
        end,
    },
}
