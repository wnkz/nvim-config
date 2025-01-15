return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      { "saghen/blink.cmp" },

      {
        "rachartier/tiny-code-action.nvim",
        dependencies = {
          { "nvim-lua/plenary.nvim" },
          { "nvim-telescope/telescope.nvim" },
        },
        event = "LspAttach",
        config = function()
          require("tiny-code-action").setup()
        end,
      },
    },
    config = function()
      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          local t_builtin = require("telescope.builtin")

          map("<space>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          -- map("<space>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("<space>ca", function()
            require("tiny-code-action").code_action()
          end, "[C]ode [A]ction")

          map("gd", t_builtin.lsp_definitions, "[G]oto [D]efinition")
          map("gr", t_builtin.lsp_references, "[G]oto [R]eferences")
          map("gI", t_builtin.lsp_implementations, "[G]oto [I]mplementation")
          map("<space>D", t_builtin.lsp_type_definitions, "Type [D]efinition")
          map("<space>ds", t_builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

          map("K", vim.lsp.buf.hover, "Hover Documentation")

          map("<space>ws", t_builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          map("<space>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd folder")
          map("<space>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove folder")
          map("<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, "[W]orkspace [L]ist folder")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[T]oggle Inlay [H]ints")
          end
        end,
      })

      local servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off",
              },
            },
          },
        },
        lua_ls = {
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
        },
        clangd = {
          cmd = {
            "clangd",
            "--completion-style=detailed",
            "--offset-encoding=utf-16", -- fix: warning: multiple different client offset_encodings
          },
        },
        yamlls = {
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
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require("mason").setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format Lua code
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })

      local signs = require("config").defaults.icons.diagnostics
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
}
