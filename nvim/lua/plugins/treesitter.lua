return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
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
            init_selection = 'gsi',
            node_incremental = 'gsi',
            scope_incremental = 'gsc',
            node_decremental = 'gsd',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ['[f'] = '@function.outer',
              ['[c'] = '@class.outer',
            },
            goto_next_end = {
              [']f'] = '@function.outer',
              [']c'] = '@class.outer',
            },
            goto_previous_start = {
              ['[F'] = '@function.outer',
              ['[C'] = '@class.outer',
            },
            goto_previous_end = {
              [']F'] = '@function.outer',
              [']C'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['gan'] = '@parameter.inner',
            },
            swap_previous = {
              ['gap'] = '@parameter.inner',
            },
          },
        },
      })
    end
  },
}
