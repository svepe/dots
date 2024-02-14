return {
    "echasnovski/mini.bufremove",
    version = false,
    config=function()
        require("mini.bufremove").setup()
        -- https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f
        -- Easier window switching with leader + Number
        -- Creates mappings like this:
        --   km.set("n", "<Leader>2", "2<C-W>w", { desc = "Move to Window 2" })
        for i = 1, 6 do
          local lhs = "<leader>" .. i
          local rhs = i .. "<C-W>w"
          vim.keymap.set("n", lhs, rhs, { desc = "Move to Window " .. i })
        end

        vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Windowl left" })
        vim.keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Window right" })
        vim.keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Window down" })
        vim.keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Window up" })
        vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Close window" })
        vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split below" })
        vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split right" })
        vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split below" })
        vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split right" })
    end,
}
