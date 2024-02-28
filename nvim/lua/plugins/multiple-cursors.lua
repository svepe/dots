return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*", -- Use the latest tagged version
    opts = {
        match_visible_only = false,
    },
    keys = {
        { "<leader>cj", "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "x" } },
        { "<leader>ck", "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "x" } },
        { "<leader>ca", "<Cmd>MultipleCursorsAddMatches<CR>",       mode = { "n", "x" } },
        { "<leader>cc", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" } },
        { "<leader>cd", "<Cmd>MultipleCursorsJumpNextMatch<CR>",    mode = { "n", "x" } },
    },
}
