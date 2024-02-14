return {
    "numToStr/Comment.nvim",
    opts = {
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
            ---Line-comment toggle keymap
            line = "<leader>;;",
            ---Block-comment toggle keymap
            block = "gbc",
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
            ---Line-comment keymap
            line = "<leader>;",
            ---Block-comment keymap
            block = "gb",
        },
        ---LHS of extra mappings
        extra = {
            ---Add comment on the line above
            above = "<leader>;O",
            ---Add comment on the line below
            below = "<leader>;o",
            ---Add comment at the end of line
            eol = "<leader>;A",
        },
    },
    lazy = false,
}
