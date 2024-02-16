return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "c", "cpp", "lua", "python", "bash" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>v",
            node_incremental = "v",
            scope_incremental = "<leader>s",
            node_decremental = "V",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["aa"] = { query="@parameter.outer", desc="argument" },
              ["ia"] = { query="@parameter.inner", desc="argument" },
              ["af"] = { query="@function.outer", desc="function" },
              ["if"] = { query="@function.inner", desc="function" },
              ["ac"] = { query="@class.outer", desc="class" },
              ["ic"] = { query="@class.inner", desc="class" },
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]f"] = { query="@function.outer", desc="Next function start" },
              ["]c"] = { query="@class.outer", desc="Next class start" },
              ["]a"] = { query="@parameter.inner", desc="Next argument start" },
            },
            goto_next_end = {
              ["]F"] = { query="@function.outer", desc="Next function end" },
              ["]C"] = { query="@class.outer", desc="Next class end" },
              ["]A"] = { query="@parameter.inner", desc="Next argument end" },
            },
            goto_previous_start = {
              ["[f"] = { query="@function.outer", desc="Previous function start" },
              ["[c"] = { query="@class.outer", desc="Previous class start" },
              ["[a"] = { query="@parameter.inner", desc="Previous argument start" },
            },
            goto_previous_end = {
              ["[F"] = { query="@function.outer", desc="Previous function end" },
              ["[C"] = { query="@class.outer", desc="Previous class end" },
              ["[A"] = { query="@parameter.inner", desc="Previous argument end" },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["gan"] = { query="@parameter.inner", desc="Swap with next argument" },
            },
            swap_previous = {
              ["gap"] = { query="@parameter.inner", desc="Swap with previous argument" },
            },
          },
        },
      })
    end
  },
}
