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
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            -- Lua
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                        runtime = {
                            version = "LuaJIT",
                        },
                    },
                },
                capabilities = capabilities,
            })

            -- JavaScript
            lspconfig.volar.setup({
                capabilities = capabilities,
                filetypes = {
                    "typescript",
                    "javascript",
                    "javascriptreact",
                    "typescriptreact",
                    "vue",
                    "json",
                },
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                end
            })
            lspconfig.eslint.setup({
                on_attach = function(client, bufnr)
                    client.server_capabilities.documentFormattingProvider = false
                    vim.keymap.set('n', '<leader>mF', ":EslintFixAll<CR>", { buffer = bufnr, desc = "Eslint fix all" })
                end
            })

            -- Python
            lspconfig.ruff_lsp.setup({})
            lspconfig.pyright.setup({
                capabilities = capabilities,
            })
        end,
    },
}
