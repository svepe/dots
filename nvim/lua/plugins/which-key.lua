return {
    "folke/which-key.nvim",
    opts = {},
    config = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>"] = {
                f = { name = "File" },
                b = { name = "Buffer" },
            },
        })
    end
}
