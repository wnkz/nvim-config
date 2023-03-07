local dap, dapui = require("dap"), require("dapui")
local masonrs = require("mason-registry")

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

require("mason-nvim-dap").setup({
    automatic_installation = true,
})

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- use codicons for dap signs
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint" })
