return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    highlight = {
      backdrop = true,
    },
    prompt = {
      enabled = false,
    },
    jump = {
      -- automatically jump when there is only one match
      autojump = true,
    },
    modes = {
      char = {
        enabled = true,
        -- hide after jump when not using jump labels
        autohide = true,
        -- show jump labels
        jump_labels = false,
        -- set to `false` to use the current line only
        multi_line = false,
        highlight = {
          backdrop = false,
        },
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function() require("flash").jump() end,
      desc = "Flash",
    },
  },
}
