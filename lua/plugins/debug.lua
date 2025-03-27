return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui" },
      { "nvim-neotest/nvim-nio" },
      { "theHamsta/nvim-dap-virtual-text", opts = { commented = true } },
      { "williamboman/mason.nvim" },
      { "jay-babu/mason-nvim-dap.nvim" },

      { "mfussenegger/nvim-dap-python" },
    },
    keys = function(_, keys)
      local dap = require("dap")
      local dapui = require("dapui")
      return {
        -- VSCode style mappings
        { "<F5>", dap.continue, desc = "Debug: Start/Continue" },
        { "<F17>", dap.terminate, desc = "Debug: Stop" }, -- <S-F5> / see https://github.com/neovim/neovim/issues/7384
        { "<S-M-F5>", dap.restart, desc = "Debug: Restart" },
        { "<F10>", dap.step_over, desc = "Debug: Step Over" },
        { "<F11>", dap.step_into, desc = "Debug: Step Into" },
        { "<F12>", dap.step_out, desc = "Debug: Step Out" },
        { "<leader>b", dap.toggle_breakpoint, desc = "Debug: Toggle Breakpoint" },
        {
          "<leader>B",
          function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
          end,
          desc = "Debug: Set Breakpoint",
        },
        { "<F7>", dapui.toggle, desc = "Debug: See last session result." },
        unpack(keys),
      }
    end,
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      local masonrs = require("mason-registry")

      require("mason-nvim-dap").setup({
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {},
      })

      -- Dap UI setup
      -- For more information, see |:help nvim-dap-ui|
      dapui.setup({
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close

      dap.adapters.lldb = {
        type = "executable",
        command = vim.fn.system("brew --prefix llvm"):gsub("\n", "") .. "/bin/lldb-vscode",
        name = "lldb",
      }

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = masonrs.get_package("codelldb"):get_install_path() .. "/extension/adapter/codelldb",
          args = { "--port", "${port}" },
        },
      }
      if vim.fn.has("win32") == 1 then
        dap.adapters.codelldb.executable.detached = false
      end

      require("dap.ext.vscode").load_launchjs(nil, { lldb = { "c" }, codelldb = { "c" } })

      require("dap-python").setup(masonrs.get_package("debugpy"):get_install_path() .. "/venv/bin/python")

      dap.configurations.c = {
        {
          name = "codelldb: Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
        {
          name = "codelldb: Launch a.out",
          type = "codelldb",
          request = "launch",
          program = vim.fn.getcwd() .. "/a.out",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
        {
          name = "codelldb: Launch with arguments",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " +")
          end,
        },
        {
          name = "lldb: Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
        {
          name = "lldb: Launch a.out",
          type = "lldb",
          request = "launch",
          program = vim.fn.getcwd() .. "/a.out",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
        {
          name = "lldb: Launch with arguments",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " +")
          end,
        },
      }

      -- use codicons for dap signs
      -- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
      -- vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint" })
      -- vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapBreakpoint" })
      -- vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
      -- vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint" })
      vim.diagnostic.config({
        signs = {
          text = {
            ["DapBreakpoint"] = "",
            ["DapBreakpointCondition"] = "",
            ["DapLogPoint"] = "",
            ["DapStopped"] = "",
            ["DapBreakpointRejected"] = "",
          },
          texthl = {
            ["DapBreakpoint"] = "DapBreakpoint",
            ["DapBreakpointCondition"] = "DapBreakpoint",
            ["DapLogPoint"] = "DapBreakpoint",
            ["DapStopped"] = "DapStopped",
            ["DapBreakpointRejected"] = "DapBreakpoint",
          },
        },
      })
    end,
  },
}
