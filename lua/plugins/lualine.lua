local function LSP_active()
    for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.attached_buffers[vim.api.nvim_get_current_buf()] and client.name ~= "null-ls" then
            return "LSP ~ " .. client.name .. " "
        end
    end
    return "No LSP"
end

return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "auto",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff" },
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
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    },
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            extensions = {
                "fugitive",
                "fzf",
                "nvim-tree",
                "toggleterm",
            },
        },
        event = "VimEnter",
    },
}
