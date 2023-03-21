return {
    {
        "akinsho/bufferline.nvim",
        version = "v3.*",
        event = "BufReadPre",
        opts = {
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true, -- use a "true" to enable the default, or set your own character
                    },
                },
            },
            highlights = {
                buffer_selected = {
                    italic = false,
                },
            },
        },
    },
    {
        "kazhala/close-buffers.nvim",
        event = "BufReadPre",
        config = true,
    },
}
