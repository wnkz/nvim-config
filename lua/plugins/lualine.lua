local function LSP_active()
    local active_clients = {}
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
        if client.attached_buffers[vim.api.nvim_get_current_buf()] and client.name ~= "null-ls" then
            table.insert(active_clients, client.name)
        end
    end

    if next(active_clients) == nil then
        return "No LSP"
    else
        return "LSP ~ " .. table.concat(active_clients, "|") .. " "
    end
end

return {
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            local signs = require("config").defaults.icons.diagnostics
            return {
                options = {
                    theme = "auto",
                    component_separators = "|",
                    section_separators = "",
                    globalstatus = vim.o.laststatus == 3,
                    disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = {
                        "branch",
                        "diff",
                    },
                    lualine_c = {
                        { "filename", path = 1 },
                    },
                    lualine_x = {
                        { "encoding" },
                        { "fileformat" },
                        { "filetype" },
                        { LSP_active, icon = " " },
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            symbols = (function(t)
                                local r = {}
                                for k, v in pairs(t) do
                                    r[string.lower(k)] = v
                                end
                                return r
                            end)(signs),
                        },
                    },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                extensions = {
                    "fugitive",
                    "fzf",
                    "lazy",
                    "mason",
                    "nvim-dap-ui",
                    "nvim-tree",
                    "quickfix",
                    "toggleterm",
                },
            }
        end,
        event = "VimEnter",
    },
}
