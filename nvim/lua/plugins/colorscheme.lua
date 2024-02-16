return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                on_colors = function(colors)
                    colors.gitSigns.add = colors.green
                    colors.gitSigns.change = colors.blue
                    colors.gitSigns.delete = colors.red
                end
            })
            vim.cmd.colorscheme("tokyonight-night")
        end,
    },
}
