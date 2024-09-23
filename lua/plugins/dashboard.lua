return {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
        local logo = [[
⠀⠀⠀⣠⣶⣆⠀⠀⠀⠀⠀⠀⠀⠀⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⣠⣾⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣾⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢰⡄⣠⠴⠶⠶⣤⡀⠀⠀⢀⣠⠴⠶⠶⢤⡀⠀⠀⠀⣠⠴⠶⠶⢦⣄⠀⢰⣶⣶⠀⠀⠀⠀⣰⣶⡶⢰⣶⣶⠀⠀⣶⣶⣤⣶⣿⣷⣦⣠⣶⣾⣿⣷⣦⡀
⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣷⡀⠀⠀⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⡏⠀⠀⠀⠀⠈⣷⠀⢠⡞⠁⠀⠀⠀⠀⠹⡆⢀⡾⠁⠀⠀⠀⠀⠘⣷⡀⢻⣿⣧⠀⠀⢠⣿⣿⠁⢸⣿⣿⠀⠀⣿⣿⠋⠀⠀⢹⣿⣿⠋⠀⠈⢻⣿⣷
⣿⣿⣿⣿⣿⠀⠻⣿⣿⣿⣿⣿⣆⠀⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣿⠀⢸⡗⠒⠒⠒⠒⠒⠚⠃⢸⡇⠀⠀⠀⠀⠀⠀⢸⡇⠀⢿⣿⡆⢀⣿⣿⠃⠀⢸⣿⣿⠀⠀⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿
⣿⣿⣿⣿⣿⠀⠀⠙⣿⣿⣿⣿⣿⣧⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣿⠀⠸⣇⠀⠀⠀⠀⠀⠀⠀⠸⣧⠀⠀⠀⠀⠀⠀⣾⠃⠀⠈⣿⣿⣼⣿⠇⠀⠀⢸⣿⣿⠀⠀⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿
⣿⣿⣿⣿⣿⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣿⠀⠀⠙⠷⣤⣀⣀⣤⠶⠂⠀⠙⠷⣤⣀⣀⣤⠾⠃⠀⠀⠀⠘⣿⣿⠏⠀⠀⠀⢸⣿⣿⠀⠀⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿
⢿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠙⢿⣿⣿⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠙⢿⠀⠀⠀⠀⠀⠀⠀⠀⠻⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ]]

        logo = string.rep("\n", 3) .. logo .. "\n\n"

        local opts = {
            theme = "doom",
            hide = {
                -- this is taken care of by lualine
                -- enabling this messes up the actual laststatus setting after loading a file
                statusline = false,
            },
            config = {
                header = vim.split(logo, "\n"),
                -- stylua: ignore start
                center = {
                    { action = "Telescope find_files", desc = " Find File", icon = " ", key = "f" },
                    { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
                    { action = "Telescope frecency", desc = " Recent Files", icon = " ", key = "r" },
                    { action = "Telescope live_grep", desc = " Find Text", icon = " ", key = "g" },
                    { action = "Telescope file_browser", desc = " File Explorer", icon = " ", key = "b" },
                    { action = "lua require(\"persistence\").load()", desc = " Load Session", icon = " ", key = "l" },
                    { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "p" },
                    { action = "Mason", desc = " Mason", icon = " ", key = "m" },
                    { action = function() vim.api.nvim_input("<cmd>qa!<cr>") end, desc = " Quit", icon = " ", key = "q" },
                },
                -- stylua: ignore end
                footer = function()
                    local version = vim.version()
                    local nvim_version_info = "  Neovim v"
                        .. version.major
                        .. "."
                        .. version.minor
                        .. "."
                        .. version.patch

                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local lazy_plugins_info = "⚡ Loaded "
                        .. stats.loaded
                        .. "/"
                        .. stats.count
                        .. " plugins in "
                        .. ms
                        .. "ms"

                    return {
                        nvim_version_info,
                        lazy_plugins_info,
                    }
                end,
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            button.key_format = "  %s"
        end

        -- open dashboard after closing lazy
        if vim.o.filetype == "lazy" then
            vim.api.nvim_create_autocmd("WinClosed", {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                    end)
                end,
            })
        end

        return opts
    end,
}
