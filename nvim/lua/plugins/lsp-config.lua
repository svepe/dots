return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "pyright",
                "volar",
                "tsserver",
                "lua_ls",
            },
            auto_install = true,
            log_level = vim.log.levels.DEBUG,
        },
    },
    { "folke/neodev.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        runtime = {
                            version = "LuaJIT",
                        },
                    },
                },
                capabilities = capabilities,
            })
            lspconfig.volar.setup({})
        end,
    },
}
