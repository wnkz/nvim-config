local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local header = {
    [[                                                                   ]],
    [[      ████ ██████           █████      ██                    ]],
    [[     ███████████             █████                            ]],
    [[     █████████ ███████████████████ ███   ███████████  ]],
    [[    █████████  ███    █████████████ █████ ██████████████  ]],
    [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
    [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
    [[██████  █████████████████████ ████ █████ █████ ████ ██████]]
}

-- Make the header a bit more fun with some color!
local function colorize_header()
    local lines = {}

    for i, chars in pairs(header) do
        local line = {
            type = "text",
            val = chars,
            opts = {
                hl = "StartLogo" .. i,
                shrink_margin = false,
                position = "center"
            }
        }

        table.insert(lines, line)
    end

    return lines
end

dashboard.section.buttons.val = {
    dashboard.button("l", "   Load session", ":SessionManager load_current_dir_session<CR>"),
    dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("r", "   Recently used files", ":Telescope frecency<CR>"),
    dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
    dashboard.button("g", "   Find word", ":Telescope live_grep<CR>"),
    dashboard.button("b", "   File Browser", ":Telescope file_browser<CR>"),
    dashboard.button("u", "   Update plugins", ":PackerSync<CR>"), -- Packer sync
    dashboard.button("s", "   Mason", ":Mason<CR>"),
    dashboard.button("q", "   Quit", ":qa!<CR>")
}
dashboard.section.buttons.opts = {
    spacing = 0
}

-- Footer
local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local version = vim.version()
    local nvim_version_info = "  Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return " " .. total_plugins .. " plugins" .. nvim_version_info
end
dashboard.section.footer.val = footer()

dashboard.config.layout = {
    {type = "padding", val = 2},
    {type = "group", val = colorize_header()},
    {type = "padding", val = 2},
    dashboard.section.buttons,
    {type = "padding", val = 1},
    dashboard.section.footer
}

-- Hide all the unnecessary visual elements while on the dashboard, and add
-- them back when leaving the dashboard.
local group = vim.api.nvim_create_augroup("CleanDashboard", {})

vim.api.nvim_create_autocmd(
    "User",
    {
        group = group,
        pattern = "AlphaReady",
        callback = function()
            vim.opt.showtabline = 0
            vim.opt.showmode = false
            vim.opt.laststatus = 0
            vim.opt.showcmd = false
            vim.opt.ruler = false
        end
    }
)

vim.api.nvim_create_autocmd(
    "BufUnload",
    {
        group = group,
        pattern = "<buffer>",
        callback = function()
            vim.opt.showtabline = 2
            vim.opt.showmode = true
            vim.opt.laststatus = 3
            vim.opt.showcmd = true
            vim.opt.ruler = true
        end
    }
)

alpha.setup(dashboard.config)
