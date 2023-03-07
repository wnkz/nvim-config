return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = { "mason-lspconfig.nvim" }
    },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        opts = {
            automatic_installation = true,
        },
        lazy = true,
        dependencies = { "mason.nvim" },
    },
    { "ray-x/lsp_signature.nvim", lazy = true },
    { "jose-elias-alvarez/null-ls.nvim", lazy = true },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("lint").linters_by_ft = {
                markdown = { "vale" },
                terraform = { "tflint" },
                yaml = { "cfn_lint" },
            }
        end,
        lazy = true,
    },
}
