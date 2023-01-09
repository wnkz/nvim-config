-- Color table for highlights
local colors = {
    bg = "#202328",
    fg = "#bbc2cf",
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67"
}

local function active_lsp()
    local msg = "No Active Lsp"
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

require("lualine").setup {
    options = {
        theme = "onedark"
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {
            {
                "filename",
                path = 1
            },
            {
                "diff",
                colored = true
            }
        },
        lualine_x = {
            "encoding",
            "fileformat",
            {
                "filetype",
                colored = true
            },
            {
                active_lsp,
                icon = " LSP:"
            },
            {
                "diagnostics",
                sources = {"nvim_diagnostic"},
                sections = {"error", "warn", "info"},
                -- symbols = {error = ' ', warn = ' ', info = ' '},
                symbols = {error = " ", warn = " ", info = " ", hint = " "},
                color_error = colors.red,
                color_warn = colors.yellow,
                color_info = colors.cyan
            }
        },
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    extensions = {
        "fugitive",
        "fzf",
        "nvim-tree"
    }
}
