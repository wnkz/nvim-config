local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local header = {
    "⠀⠀⠀⢀⠐⣄⠀⠀⠀⠀⠀⠀⠀⠀⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⢀⣴⣿⣾⣿⣦⠀⠀⠀⠀⠀⠀⠀⣿⠻⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⣴⣿⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⣿⠀⠈⠻⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠿⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⣿⠀⠀⠀⣿⠀⠀⠀⠀⠀⢀⡀⠀⣀⣤⣄⡀⠀⠀⠀⠀⢀⣀⣤⣄⣀⠀⠀⠀⠀⢀⣀⣠⣄⣀⠀⠀⢠⣤⣄⠀⠀⠀⠀⢠⣤⣤⢠⣤⣤⠀⠀⣤⣤⢀⣤⣴⣤⡄⠀⣠⣤⣦⣤⣄⠀",
    "⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⣸⠀⠀⠀⣿⠀⠀⠀⠀⠀⢸⡷⠋⠀⠀⠀⠙⣆⠀⠀⣴⠋⠀⠀⠀⠈⢳⡀⠀⣴⠏⠁⠀⠀⠈⠻⣆⠈⢿⣿⡆⠀⠀⠀⣾⣿⠇⢀⣿⣿⠀⠀⣿⣿⡟⠋⠙⢻⣿⣾⠟⠋⠙⢿⣿⣇",
    "⣻⣿⣿⣿⣿⠈⢿⣿⣿⣿⣿⣦⠀⠀⣸⠀⠀⠀⣿⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣿⠀⢸⣧⣤⣤⣤⣤⣤⣤⡇⢰⡏⠀⠀⠀⠀⠀⠀⢻⡆⠘⣿⣿⡀⠀⣼⣿⡏⠀⢀⣿⣿⠀⠀⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿",
    "⣿⣿⣿⣿⣿⠀⠈⢻⣿⣿⣿⣿⣷⡀⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣿⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⢸⡇⠀⠹⣿⣧⢰⣿⡟⠀⠀⢀⣿⣿⠀⠀⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿",
    "⣿⣿⣿⣿⣿⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⣿⠀⠈⢷⡀⠀⠀⠀⠀⠀⠀⠈⢷⡀⠀⠀⠀⠀⢀⡿⠀⠀⠀⢻⣿⣿⣿⠁⠀⠀⢀⣿⣿⠀⠀⣿⣿⠀⠀⠀⢸⣿⣿⠀⠀⠀⢸⣿⣿",
    "⣿⣿⣿⣿⣿⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠸⠇⠀⠀⠀⠀⠀⠿⠀⠀⠀⠙⠲⠶⠶⠖⠋⠁⠀⠀⠙⠲⠤⠴⠖⠋⠀⠀⠀⠀⠈⠛⠛⠃⠀⠀⠀⠘⠿⠿⠀⠀⠿⠿⠀⠀⠀⠘⠿⠿⠀⠀⠀⠸⠿⠟",
    "⠻⣿⣿⣿⣿⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠈⠻⣿⣿⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠈⢻⠀⠀⠀⠀⠀⠀⠀⠀⠹⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
}

dashboard.section.header.val = header
dashboard.section.header.opts.hl = "AlphaHeader"

dashboard.section.buttons.val = {
    dashboard.button("l", "   Load session", ":SessionManager load_current_dir_session<CR>"),
    dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "   Recently used files", ":Telescope frecency<CR>"),
    dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
    dashboard.button("g", "   Find word", ":Telescope live_grep<CR>"),
    dashboard.button("b", "   File Browser", ":Telescope file_browser<CR>"),
    dashboard.button("p", "󰒲   Lazy", ":Lazy<CR>"),
    dashboard.button("s", "   Mason", ":Mason<CR>"),
    dashboard.button("q", "   Quit", ":qa!<CR>"),
}

-- Footer
local function footer()
    local version = vim.version()
    local nvim_version_info = " Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return nvim_version_info
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "AlphaFooter"

-- Hide all the unnecessary visual elements while on the dashboard, and add
-- them back when leaving the dashboard.
local group = vim.api.nvim_create_augroup("CleanDashboard", {})

vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "AlphaReady",
    callback = function()
        vim.opt.showtabline = 0
        vim.opt.showmode = false
        vim.opt.laststatus = 0
        vim.opt.showcmd = false
        vim.opt.ruler = false
    end,
})

vim.api.nvim_create_autocmd("BufUnload", {
    group = group,
    pattern = "<buffer>",
    callback = function()
        vim.opt.showtabline = 2
        vim.opt.showmode = true
        vim.opt.laststatus = 3
        vim.opt.showcmd = true
        vim.opt.ruler = true
    end,
})

alpha.setup(dashboard.config)
