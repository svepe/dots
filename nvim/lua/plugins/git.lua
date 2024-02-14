return {
    {
        'lewis6991/gitsigns.nvim',
        opts={},
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "sindrets/diffview.nvim",
        },
        config=function()
            local neogit = require("neogit")
            neogit.setup()
            vim.keymap.set(
                {"n", "v"},
                "<leader>gs",
                function()
                    neogit.open({ cwd=vim.fn.expand("%:p:h"), kind="vsplit" })
                end,
                { desc="Git status" }
            )
        end
    },
}
