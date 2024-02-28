return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        {
            "nvim-telescope/telescope-file-browser.nvim",
        },
    },
    config = function()
        require("telescope").setup({
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                    mappings = {
                        i = {
                            ["<tab>"] = "select_default",
                        },
                    },
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")
    end
}
